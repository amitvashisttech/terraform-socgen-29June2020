# Tarrform Variables

Like a variable and any other programming language it allows you to store some information to reuse
and pass around.

Variables in Terraform are a great way to define centrally controlled reusable values. The information in Terraform variables is saved independently from the deployment plans, which makes the values easy to read and edit from a single file

Terraform supports a few different variable formats. Depending on the usage, the variables are generally divided into inputs and outputs.


## Output variables
Output variables provide a convenient way to get useful information about your infrastructure. As you might have noticed, much of the server details are calculated at deployment and only become available afterwards. Using output variables you can extract any server-specific values including the calculated details.

Configuring output variables is really quite simple. All you need to do is define a name for the output and what value it should represent. For example, you could have Terraform show your server’s IP address after deployment with the output variable below.

```
output "frontend_ip" {
  value = "${aws_instance.frontend.public_ip}"
}
```

## In the following example output variable will be printing Public IP for Frontend & Public IP & FQDN for Backend.

```
 provider "aws" {
  #access_key = ""
  #secret_key = ""
  region     = "us-east-1"
}

resource "aws_instance" "frontend" {
  ami                   = "ami-039a49e70ea773ffc"
  instance_type         = "t2.micro"
}

resource "aws_instance" "backend" {
  count                 = 2
  ami                   = "ami-039a49e70ea773ffc"
  instance_type         = "t2.micro"
}

output "frontend_ip" {
  value = "${aws_instance.frontend.public_ip}"
}

output "backend_ips" {
  value = "${list ("${aws_instance.backend.*.public_ip}" ,"${aws_instance.backend.*.public_dns}")}"
  }
```



## Terraform Apply
```
terraform apply 
----
Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

Outputs:

backend_ips = [
    [
        52.86.161.60,
        54.237.126.68
    ],
    [
        ec2-52-86-161-60.compute-1.amazonaws.com,
        ec2-54-237-126-68.compute-1.amazonaws.com
    ]
]
frontend_ip = 54.84.249.153
----
```

## Print the Output Values from TfState file
```
terraform output backend_ips
terraform output frontend_ip
```


## Destroy Terrafrom
```
terraform destroy
```


