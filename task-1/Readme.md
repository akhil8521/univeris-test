



  

## Install Terraform

  

``` bash

wget https://releases.hashicorp.com/terraform/0.8.3/terraform_0.8.3_linux_amd64.zip -O terraform.zip

unzip terraform.zip

rm terraform.zip

sudo mv terraform /usr/local/bin/terraform

```

## What Does this tf code do?

- This code has modules for VPC and Subnets.
- It creats a vpc,public,private and protected subnets and nat gateways which are connected to private subnets.

## Run 

  

1. Create the `credentials` file with the credentials to access GCP 
2. From [the service account key page in the Cloud Console](https://console.cloud.google.com/iam-admin/serviceaccounts) choose an existing account, or create a new one. Next, download the JSON key file. Name it something you can remember, and store it somewhere secure on your machine.

3. Update ./main.tf file   "credentials = file("path/credentials-file.json")"  with the new downloaded file.

4. Run `terraform init`

5. Run `terraform plan`

6. Run `terraform apply`

- Create a .tfvars file to store the variables.