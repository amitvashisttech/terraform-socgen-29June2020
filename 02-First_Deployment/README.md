# Prerequisites  

## Amazon Cloud Access

### Create a Programatic Access key User in AWS.
```You need to a IAM User - > Login -> AWS Console -> Search (IAM) -> Create User (terraform) -> Enable Progrmatic Access -> Attach Existing Policy (EC2FullAccess) -> Create & Downloand Keys.```


### Login to Vagrant VM
```
cd desktop/devops-labs/vagrant-setup/terraform
``` 
```
vagrant.exe status
```
```
vagrant ssh terraform
```
```
sudo su - 
```
```
terraform --version
```

### Now export the AWS Keys into Env. Variables
```
echo "export AWS_ACCESS_KEY_ID="XXXXXXXXXXXX" " >> /root/.bashrc
```
```
echo "export AWS_SECRET_ACCESS_KEY="XXXXXXYYYYYYYYYYYYYYYYYYYYYYYYYYY" " >>  /root/.bashrc
```
```
source  /root/.bashrc
```
```
set | grep -i AWS 
```

### Clone my Repo. 
```
git clone https://github.com/amitvashisttech/terraform-socgen-29June2020.git
```

### Set a Default Compute Region and Zone  
This tutorial assumes a default compute region and zone have been configured.


#### Update the following Session. 
```
cd terraform-socgen-29June2020/02-First_Deployment
```
```
cat first_deployment.tf 
provider "aws" {
 # access_key = "Access Key"
 # secret_key = "Secrey Key"
  region     = "us-east-2"
}
resource "aws_instance" "example" {
  ami           = "ami-04781752c9b20ea41"
  instance_type = "t2.micro"
}
```

#### Run Terraform Init & Apply 
```
terraform init
```
```
terraform apply
```
