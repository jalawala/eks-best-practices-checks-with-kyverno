# S3 Bucket Terraform Configuration

This Terraform configuration creates an S3 bucket with a unique, random name for the EKS Best Practices Checks with Kyverno project.

## Features

- **Unique Naming**: Uses a random 8-character suffix to ensure bucket name uniqueness
- **Security Best Practices**: 
  - Server-side encryption enabled (AES256)
  - Public access blocked
  - Versioning enabled
- **Lifecycle Management**: Automatically deletes old versions after 30 days
- **Tagging**: Comprehensive tagging for resource management

## Files

- `main.tf` - Main Terraform configuration
- `variables.tf` - Input variables
- `outputs.tf` - Output values
- `providers.tf` - Provider configurations
- `terraform.tfvars.example` - Example variables file

## Usage

### 1. Initialize Terraform

```bash
cd /Users/jalawala/Documents/office/code/jalawala/eks-best-practices-checks-with-kyverno/infra/terraform/s3
terraform init
```

### 2. Create terraform.tfvars (Optional)

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your preferred values
```

### 3. Plan the deployment

```bash
terraform plan
```

### 4. Apply the configuration

```bash
terraform apply
```

### 5. View outputs

```bash
terraform output
```

## Outputs

- `bucket_name` - The unique name of the created S3 bucket
- `bucket_arn` - The ARN of the S3 bucket
- `bucket_id` - The ID of the S3 bucket
- `bucket_domain_name` - The domain name of the S3 bucket
- `bucket_regional_domain_name` - The regional domain name
- `bucket_region` - The AWS region where the bucket is created
- `random_suffix` - The random suffix used in the bucket name

## Variables

- `environment` - Environment name (default: "dev")
- `aws_region` - AWS region (default: "us-east-1")
- `enable_logging` - Enable S3 access logging (default: false)
- `tags` - Additional tags to apply

## Clean Up

To destroy the resources:

```bash
terraform destroy
```

**Note**: Make sure the bucket is empty before destroying, as Terraform cannot delete non-empty S3 buckets.
