# QuickEC2

Build your own single-use, disposable Virtual Machine in the Cloud!  

The code was written for local Terraform use to create a quick AWS EC2 Instance for testing purposes along with the necessary VPC, Subnets, and Security Groups.

## Caveat Emptor

This configuration may create chargeable (non-free) resources in your AWS account especially if you change the defaults such as the EC2 instance size, so make sure that you understand this before deploying the infrastructure.

## Prerequisites

- EC2 Instance infrastructure
    - A suitable AMI ID
    - Key pair
        - Private key: local PEM file
        - Public key: key material
- Software and configuration
    - Terraform
    - AWS account
        - IAM user with sufficient privileges
            - Access Key ID
            - Secret Access Key
    - AWS CLI
        - Aws default profile configured using the Access Key credentials above

## Steps

- Install Terraform.
- Clone this repo, or download the code to your local workstation.
- Open (or extract) the ***src*** folder.
- Fill-in the above **prerequisites** in the ***terraform.tfvars*** file.
- Go to the ***src*** folder.
- Run the following commands in a terminal in the ***src*** location:
    ```bash
    terraform init
    terraform plan -out "QuickEC2.plan"
    terraform apply "QuickEC2.plan"
    ```
- Once you're done with the Instance, destroy the infrastructure:
    ```bash
    terraform destroy
    ```
- Answer ***yes*** when prompted.

## Allowed Connections

- AWS Instance Connect
- AWS Session Manager
- SSH for Linux
- RDP for Windows

## Defaults

- Region: us-east-1
- VPC CIDR: 10.169.0.0/26
- EC2 Subnet CIDR (public): 10.169.0.0/27

## Outputs

- EC2 Instance hostname
- SSH command for connection if it's a Linux Instance
- AWS CLI command to obtain the automatically-generated Administrator password for RDP connection if it's a Windows Instance
