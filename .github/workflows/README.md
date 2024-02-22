---

# AWS Infrastructure Management with GitHub Actions

This repository contains a GitHub Actions workflow that automates the provisioning and destruction of AWS resources in a sequential manner. It's designed to simplify infrastructure management for both technical and non-technical users, ensuring a streamlined deployment and teardown process for AWS services.

## Overview

The GitHub Actions workflow defined in this repository supports two main operations:

1. **Provisioning AWS Resources**: Automatically creates the necessary AWS infrastructure for the application, including S3 buckets, EC2 instances, and backend resources like DynamoDB tables for state locking.
2. **Destroying AWS Resources**: Safely tears down the AWS resources that were provisioned, ensuring that no unnecessary services are left running.

## Key Features

- **Sequential Resource Management**: Ensures that resources are created and destroyed in a specific order to maintain dependencies and avoid conflicts.
- **Dynamic Backend Configuration**: Utilizes dynamic backend configuration for Terraform, allowing for flexibility in managing state files across different environments.
- **Conditional Workflow Execution**: Based on user input at the time of workflow dispatch, the workflow can either provision or destroy resources, offering versatility in operations.
- **Security and Best Practices**: Implements best practices for security, including the use of GitHub Secrets to store sensitive information like AWS Access Keys.

## How It Works

The workflow is triggered manually through the GitHub UI, where the user specifies the action type (`provision` or `destroy`). Based on this input, the workflow either proceeds with the provisioning of the AWS infrastructure or the destruction of the previously created resources.

### Technical Details

For **technical users**, the workflow leverages Terraform for infrastructure as code (IaC) to ensure idempotency and repeatability. It includes jobs for setting up Terraform, provisioning backend resources, and managing the main AWS resources. Conditional logic within the workflow allows for flexible management based on the specified action type.

### For Non-Technical Stakeholders

For **non-technical users**, this workflow represents a simple and efficient way to manage the application's infrastructure without needing to understand the underlying technical complexities. By triggering the workflow and selecting the desired action, stakeholders can ensure that the application's infrastructure is aligned with the current needs, whether scaling up for increased demand or scaling down to manage costs.

## Getting Started

To use this workflow:

1. Ensure you have the necessary permissions to trigger GitHub Actions workflows in this repository.
2. Navigate to the "Actions" tab in the GitHub repository.
3. Select the "Manage AWS Resources" workflow.
4. Click on "Run workflow," choose the action type (`provision` or `destroy`), and then click "Run workflow" again.

## Contributing

Contributions to improve the workflow or add new features are welcome. Please follow the standard GitHub pull request process and ensure your changes adhere to best practices for infrastructure management.

## Key Improvements

- Combined provisioning and destruction into a single workflow for efficiency.
- Introduced dynamic backend configuration for Terraform to enhance flexibility.
- Implemented conditional logic to tailor the workflow's behavior based on user input.

## Maintainer

For questions or support regarding this workflow, please contact the repository maintainer.

- GitHub: [@w4ss1m]

---
