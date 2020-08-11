# AWS IAM Role Terraform module

Terraform module which create AWS IAM Role, attaches policies and optionally creates instance profile.

## Usage

### With Lambda function

```hcl
data "aws_iam_policy_document" "lambda_access" {
  statement {
    ...
  }
}

module "lambda_role" {
  source  = "spirius/iam-role/aws"
  version = "~> 1.0"

  name                 = "my-lambda"
  assume_role_services = ["lambda.amazonaws.com"]
  managed_policy_arns  = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]
  access_policy        = data.aws_iam_policy_document.lambda_access

  tags = {
    Name = "my-lambda"
  }
}

resource "aws_lambda_function" "lambda" {
  ...

  role = module.lambda_role.role.arn
}
```

### With EC2 instance with SSM access

```hcl
data "aws_iam_policy_document" "ec2_access" {
  statement {
    ...
  }
}

module "ec2_role" {
  source  = "spirius/iam-role/aws"
  version = "~> 1.0"

  name                 = "my-instance"
  assume_role_services = ["ec2.amazonaws.com"]
  managed_policy_arns  = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]
  access_policy        = data.aws_iam_policy_document.ec2_access
  instance_profile     = true

  tags = {
    Name = "my-instance"
  }
}

resource "aws_instance" "instance" {
  ...

  iam_instance_profile = module.ec2_role.profile.name
}
```
