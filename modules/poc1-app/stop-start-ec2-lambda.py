import boto3
import os

def handler(event, context):
    instance_id = os.environ['INSTANCE_ID']  # Fetching the instance ID from environment variables
    ec2 = boto3.client('ec2')
    if event['action'] == 'stop':
        # Stop the EC2 instance
        ec2.stop_instances(InstanceIds=[instance_id])  # Use the variable, not the string literal
    elif event['action'] == 'start':
        # Start the EC2 instance
        ec2.start_instances(InstanceIds=[instance_id])  # Use the variable, not the string literal
