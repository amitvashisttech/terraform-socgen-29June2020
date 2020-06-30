# Tarrform Variables

Like a variable and any other programming language it allows you to store some information to reuse
and pass around.

Variables in Terraform are a great way to define centrally controlled reusable values. The information in Terraform variables is saved independently from the deployment plans, which makes the values easy to read and edit from a single file

Terraform supports a few different variable formats. Depending on the usage, the variables are generally divided into inputs and outputs.

## Input variables

Input variables are usually defined by stating a name, type and a default value. However, the type and default values are not strictly necessary. Terraform can deduct the type of the variable from the default or input value.

```
variable "variable_name" {}
terraform apply -var variable_name="value"
```

## String

Strings mark a single value per structure and are commonly used to simplify and make complicated values more user-friendly. Below is an example of a string variable definition.
```
variable "template" {
    type = "string"
    default = "01000000-0000-4000-8000-000030080200"
}
```

A string variable can then be used in resource plans. Surrounded by double quotes, string variables are a simple substitution such as the example underneath.

```
storage = "${var.template}"
```


## List

Another type of Terraform variables lists. They work much like a numbered catalogue of values. Each value can be called by their corresponding index in the list. Here is an example of a list variable definition.

```
variable "users" {
    type    = "list"
    default = ["root", "user1", "user2"]
}
```

Lists can be used in the resource plans similarly to strings, but you’ll also need to denote the index of the value you are looking for.
```
username = "${var.users[0]}"
```


## Map

Maps are a collection of string keys and string values. These can be useful for selecting values based on predefined parameters such as the server configuration by the monthly price.

```
variable "plans" {
    type = "map"
    default = {
        "5USD"  = "1xCPU-1GB"
        "10USD" = "1xCPU-2GB"
        "20USD" = "2xCPU-4GB"
    }
}
```

You can access the right value by using the matching key. For example, the variable below would set the plan to "1xCPU-1GB".
```
plan = "${var.plans["5USD"]}"
```



## Boolean

The last of the available variable types is boolean. They give the option to employ simple true or false values. For example, you might wish to have a variable that decides when to generate the root user password on a new deployment.

```
variable "set_password" {
    default = false
}
```

The above example boolean can be used similarly to a string variable by simply marking down the correct variable.

```
create_password = "${var.set_password}"
```

By default, the value is set to false in this example. However, you can overwrite the variable at deployment by assigning a different value in a command line variable.
```
terraform apply -var set_password="true"
```




## Output variables
Output variables provide a convenient way to get useful information about your infrastructure. As you might have noticed, much of the server details are calculated at deployment and only become available afterwards. Using output variables you can extract any server-specific values including the calculated details.

Configuring output variables is really quite simple. All you need to do is define a name for the output and what value it should represent. For example, you could have Terraform show your server’s IP address after deployment with the output variable below.

```
output "public_ip" {
    value = "${upcloud_server.server_name.ipv4_address}"
}
```

## In the following example will be provsioning two instance with default variable name: zone ["us-east-1a", "us-east-1b"]

```
provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1"
}

variable "zones" {
  default = ["us-east-1a", "us-east-1b"]
}

resource "aws_instance" "example" {
  count                 = 2
  availability_zone     = "${var.zones[count.index]}"
  ami                   = "ami-07585467"
  instance_type         = "t2.micro"
}
```



## In the plan you can see instances will be provisioned in mentioend AZ ["us-east-1a", "us-east-1b"]
```
terraform plan
```


## Input Variable file
```
cat var-file-example.tfvars
zones = ["us-east-1c", "us-east-1d"]
```

## In this dafault values will be overide & instance will be provsioned in mentioend AZ ["us-east-1c", "us-east-1d"]
```
terraform plan -var-file=var-file-example.tfvars
```

## In this dafault values will be overide & instance will be provsioned in mentioend AZ ["us-east-1b","us-east-1d"]
```
terraform plan -var 'zones=["us-east-1b","us-east-1d"]'
```

## Destroy Terrafrom
```
terraform destroy
```


