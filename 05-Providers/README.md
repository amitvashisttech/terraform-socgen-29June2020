# Tarrform Providers

Providers are generally form infrastructure service or software service services.

They're responsible for implementing and understanding the provider's own API and they interact with
those API as exposing those resources.

To add a new provider into our configuration we need to initialize it First

## Initialization downloads and installs the latest version & prepares it for use

```
terrafrom init
```


## We can have multiple provider in the same configuration to target two diffrent cloud providers
### GCP Providers
```
provider "google" {
  credentials = file("account.json")
  project     = "my-project-id"
  region      = "us-central1"
}
```

### AWS Providers
```
provider "aws" {
  access_key = "AWS-ACCESS"
  secret_key = "Key"
  region     = "us-west-2"
}
```



## We can also apply multiple configurations for an individual providers to target multiple REGIONS with name ALIAS
### AWS Provider target REGION : us-east-1

```
provider "aws" {
  access_key = "ACCESS_KEY"
  secret_key = "SECRET_KEY"
  region     = "us-east-1"
}
```


### AWS Provider target REGION : us-west-1

```
provider "aws" {
  access_key = "ACCESS_KEY"
  secret_key = "SECRET_KEY"
  alias      = "us-west-1"
  region     = "us-west-1"
}

```


## In the following example will be provsioning two instance with respective providers & into respective avaliablity zones. 

```
provider "aws" {
 # access_key = "ACCESS_KEY"
 # secret_key = "SECRET_KEY"
  region     = "us-west-2"
}

provider "aws" {
  # access_key = "ACCESS_KEY"
  # secret_key = "SECRET_KEY"
  alias      = "us-east-1"
  region     = "us-east-1"
}

resource "aws_instance" "us_east_example" {
  provider      = "aws.us-east-1"
  ami           = "ami-039a49e70ea773ffc"
  instance_type = "t2.micro"
}

resource "aws_instance" "us_west_example" {
  ami           = "ami-008c6427c8facbe08"
  instance_type = "t2.micro"
}
```



## Apply Terraform
```
terraform apply
```


## Destroy Terrafrom
```
terraform destroy
```


