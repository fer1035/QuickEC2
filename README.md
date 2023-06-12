# QuickEC2

Build your own single-use, disposable Virtual Machine in the Cloud!  

The code was written for local Terraform use to create a quick AWS EC2 Instance for testing purposes along with the necessary VPC, Subnet, and Security Groups. More about [AWS EC2](https://docs.aws.amazon.com/ec2/).

## Caveat Emptor

- This configuration may create chargeable (non-free) resources in your AWS account especially if you change the defaults such as the EC2 instance size, so make sure that you understand this before deploying the infrastructure.
- The resulting infrastructure is meant **for quick testing purposes only**, and **not for production use**.

## Prerequisites

- [AWS account](https://aws.amazon.com/)
- AWS [IAM user](https://us-east-1.console.aws.amazon.com/iamv2/) with sufficient privileges
    - Access Key ID
    - Secret Access Key
- A suitable AMI ID (AMI is regional)
- A local Terraform [installation](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## Steps

- Before
    - Clone this repo, or download the code to your local workstation.
    - Open (or extract) the ***src*** folder.
    - Fill-in the above **prerequisites** in the ***terraform.tfvars*** file (customize more of the details in there if so desired).
    - Go to the ***src*** folder.
    - Run the following commands in a terminal in the ***src*** location:
        ```bash
        export AWS_ACCESS_KEY_ID="<your AWS Access Key ID>"
        export AWS_SECRET_ACCESS_KEY="<your AWS Secret Access Key>"
        terraform init
        terraform plan -out "QuickEC2.plan"
        terraform apply "QuickEC2.plan"
        ```
- After
    - Once you're done with the Instance, destroy the infrastructure:
        ```bash
        terraform destroy
        ```
    - Answer ***yes*** when prompted.

## Allowed Connection Methods

- EC2 Instance Connect
- AWS Session Manager
- SSH for Linux (requires Key Pair configuration)
- RDP for Windows (requires Key Pair and AWSCLI configuration)

## About The Key Pair

There are several options available here for the Key Pair usage.

- Without Key Pair
    - You can connect to the EC@ Instance through the browser using EC2 Instance Connect or AWS Session Manager. In this case, you can leave both the ***public_key*** and ***key_pair_name*** parameters as ***null***.
- Key Pair created in AWS
    - If you have created a Key Pair in the AWS EC2 console and you want to use it here, you will just need to specify ***key_pair_name*** as it appears in the console.
- Your own Key Pair
    - If you have created your own public-private Key Pair and you want to use it here, you will just need to specify ***public_key***, which is the public key material / content.

## Defaults

- Region: us-east-1
- Availability Zone: us-east-1a
- CIDR range: 10.169.0.0/27

## Outputs

- EC2 Instance hostname
- SSH command for connection if it's a Linux Instance
- AWS CLI command to obtain the automatically-generated Administrator password for RDP connection if it's a Windows Instance
