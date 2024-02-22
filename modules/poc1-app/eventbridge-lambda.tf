#This IAM role grants the Lambda function permissions to interact with EC2 instances.
resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy" "lambda_policy" {
  name        = "lambda_policy"
  description = "IAM policy for Lambda to manage EC2 instances"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:StartInstances",
          "ec2:StopInstances"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

#Create Lambda Function to start and stop EC2 instances
data "archive_file" "lambda" {
  type        = "zip"
  source_file = "stop-start-ec2-lambda.py"
  output_path = "lambda_function.zip"
}



resource "aws_lambda_function" "manage_ec2" {
  function_name = "ManageEC2Instances"

  # Assuming you have the Lambda code in a file named lambda_function.zip
  filename         = "lambda_function.zip"
  source_code_hash = filebase64sha256("lambda_function.zip")
  handler          = "lambda_function.handler" # This line specifies the entry point
  runtime          = "python3.8"               # Or your runtime of choice

  role = aws_iam_role.lambda_execution_role.arn
  environment {
    variables = {
      INSTANCE_ID = aws_instance.windows_ec2[0].id
    }
  }
  depends_on = [data.archive_file.lambda]
  # VPC Configuration - Adjust these to your specific VPC setup
  vpc_config {
    subnet_ids         = ["data.aws_subnet.app_subnet.id"] # Update this
    security_group_ids = ["your_security_group_id"]        # Update this
  }
}


# CloudWatch Event Rules to Trigger the Lambda Function
resource "aws_cloudwatch_event_rule" "stop_instances_weekend" {
  name                = "stop-instances-weekend"
  description         = "Trigger to stop EC2 instances on Friday evening"
  schedule_expression = "cron(0 22 ? * FRI *)" # Adjust the time as needed
}

resource "aws_cloudwatch_event_rule" "start_instances_weekend" {
  name                = "start-instances-weekend"
  description         = "Trigger to start EC2 instances on Monday morning"
  schedule_expression = "cron(0 4 ? * MON *)" # Adjust the time as needed
}

resource "aws_cloudwatch_event_target" "stop_instances" {
  rule      = aws_cloudwatch_event_rule.stop_instances_weekend.name
  target_id = "StopInstancesTarget"
  arn       = aws_lambda_function.manage_ec2.arn
}

resource "aws_cloudwatch_event_target" "start_instances" {
  rule      = aws_cloudwatch_event_rule.start_instances_weekend.name
  target_id = "StartInstancesTarget"
  arn       = aws_lambda_function.manage_ec2.arn
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_stop_instances" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.manage_ec2.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.stop_instances_weekend.arn
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_start_instances" {
  statement_id  = "AllowExecutionFromCloudWatchStart"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.manage_ec2.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.start_instances_weekend.arn
}

