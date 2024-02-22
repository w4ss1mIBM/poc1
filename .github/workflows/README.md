# AWS Terraform GitHub Actions Workflows

This repository contains GitHub Actions workflows for provisioning and destroying AWS resources using Terraform. Managed by `w4ss1m`, these workflows are designed to streamline the infrastructure management process for development and production environments.

## Workflows Overview

# AWS Terraform GitHub Actions Workflows

This repository contains GitHub Actions workflows for provisioning and destroying AWS resources using Terraform. Managed by `w4ss1m`, these workflows are designed to streamline the infrastructure management process for development and production environments.

## Workflows Overview

### 1. Provision/Destroy AWS Resources Sequentially

**File:** `provision-destroy-sequential.yml`

This workflow allows for the sequential provisioning or destruction of AWS resources. It is triggered manually via the GitHub UI and supports the dynamic execution based on the input (`provision` or `destroy`). The workflow is structured to ensure the Terraform backend is set up before managing other AWS resources, enforcing a sequential execution pattern for reliability and consistency.

#### Improvements:
- Ensured sequential execution of Terraform commands to avoid race conditions.
- Utilized global environment variables for AWS credentials and Terraform settings to enhance security and maintainability.

### 2. Provision/Destroy BackEnd Terraform

**File:** `provision-destroy-backend.yml`

Dedicated to managing the Terraform backend infrastructure, this workflow focuses on the provisioning or destruction of the S3 bucket and DynamoDB table used by Terraform for state management. It's triggered manually and designed to provide a focused approach to backend infrastructure management.

#### Improvements:
- Isolated backend management to allow independent updates without affecting the broader infrastructure.
- Streamlined the Terraform initialization and application process for backend resources.

### 3. Provision/Destroy AWS Resources Without Backend

**File:** `provision-destroy-no-backend.yml`

This workflow caters to scenarios where managing AWS resources does not require interacting with the Terraform backend. It's suitable for direct resource management tasks like provisioning web servers or databases, providing a simplified workflow for projects with less complex infrastructure needs.

#### Improvements:
- Removed dependencies on backend configuration for faster execution in environments where backend management is handled separately or not needed.
- Simplified workflow for quicker modifications and easier understanding by new team members.

## General Workflow Structure

Each workflow follows a structured approach to infrastructure management with Terraform on AWS, including:

- Manual trigger capability through GitHub UI with `provision` or `destroy` actions.
- Utilization of GitHub Secrets for secure handling of AWS credentials.
- Consistent use of environment variables for easy configuration and updates.
- Terraform version management to ensure compatibility and stability across runs.

## Maintainer

These workflows are maintained by `w4ss1m`. For contributions, suggestions, or issues, please contact the maintainer directly or use the repository's issues and pull request features.

## Contribution

Contributions are welcome! If you'd like to improve these workflows or suggest new features, please fork the repository and submit a pull request, or open an issue to discuss your ideas.


## How to Use These Workflows

### For Non-Technical Users

These workflows automate the process of setting up and taking down the infrastructure on AWS (Amazon Web Services) that our applications run on. Think of it like assembling and disassembling a Lego set automatically, where the Lego pieces are the various components of our online services (like databases, web servers, etc.).

- **To Start (Provision):** When we want to set up our services, we "provision" the necessary resources. This is like building our Lego set, where each piece is put in place according to the instructions.
- **To Stop (Destroy):** When we no longer need those services running, we "destroy" the resources. This is akin to breaking down our Lego set into individual pieces again.

### For Technical Users

To trigger these workflows:

1. **Navigate to the Actions tab** in the GitHub repository.
2. **Select the workflow** you want to run from the list.
3. **Click on 'Run workflow'**, select the branch where the workflow is located, and choose the action type (`provision` or `destroy`).
4. **Click 'Run workflow'** again to start the process.

The workflows are designed with security and efficiency in mind, using GitHub Secrets to securely store sensitive information like AWS credentials and environment variables to make configurations easily adjustable.

## Maintainer

These workflows are maintained by `w4ss1m`. For contributions, suggestions, or issues, please contact the maintainer directly or use the repository's issues and pull request features.

## Contribution

Contributions are welcome! If you'd like to improve these workflows or suggest new features, please fork the repository and submit a pull request, or open an issue to discuss your ideas.

