# Lab 9 - Packer and Terraform Deployment

This project automates the creation of an AWS EC2 instance with Nginx installed using Packer and Terraform. The guide outlines the steps to build the AMI with Packer, deploy the instance with Terraform, and ensure proper setup.

## Prerequisites
Before proceeding, ensure you have the following:
- AWS Account with CLI configured
- Packer v1.12.0 or later
- Terraform v1.5.0 or later

To confirm installation:
```bash
packer version
terraform version
aws --version
```

## Step 1: Clone the Repository
```bash
git clone https://gitlab.com/cit_4640/4640-w9-lab-start-w25.git
cd 4640-w9-lab-start-w25
```

## Step 2: Import AWS Key Pair
Run the following command to import your public key into AWS:
```bash
cd scripts
./import_lab_key ~/.ssh/aws.pub
```

## Step 3: Build the AMI with Packer
1. Navigate to the Packer directory:
```bash
cd ../packer
```
2. Initialize Packer plugins:
```bash
packer init .
```
3. Build the AMI:
```bash
packer build ansible-web.pkr.hcl
```
4. Confirm the AMI was created successfully:
```bash
aws ec2 describe-images --owners self
```

## Step 4: Deploy the EC2 Instance with Terraform
1. Navigate to the Terraform directory:
```bash
cd ../terraform
```
2. Initialize Terraform:
```bash
terraform init
```
3. Preview the deployment:
```bash
terraform plan
```
4. Deploy the resources:
```bash
terraform apply
```
5. When prompted, type `yes` to confirm.

## Step 5: Verify the Deployment
After deployment, retrieve the instance details:
```bash
terraform output
```
Copy the Public IP from the output and visit it in your browser to confirm that Nginx is running.

## Step 6: Clean Up Resources (Optional)
If you wish to remove the deployed resources:
```bash
terraform destroy
```
Type `yes` when prompted to confirm deletion.

## Notes
- Ensure your AWS credentials are properly configured before starting.
- If you encounter any errors, refer to the terminal output for troubleshooting hints.

## Contact
If you have any questions or issues, please feel free to reach out.

