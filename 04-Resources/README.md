# Tarrform Resources

## Creating One EC2 Frontend Instance 

```
resource "aws_instance" "frontend" {
  depends_on    = ["aws_instance.backend"]
  ami           = "ami-008c6427c8facbe08"
  instance_type = "t2.micro"
  lifecycle {
    create_before_destroy = true
  }
}
```


### This instnace is having two meta perameters
### 1. Condition Depends_on

```
depends_on    = ["aws_instance.backend"]
```


### 2. LifeCycle (Create before destroy )

```
  lifecycle {
    create_before_destroy = true
  }
```

## Creating Two EC2 Backend Instance 

```
resource "aws_instance" "backend" {
  count         = 2
  ami           = "ami-008c6427c8facbe08"
  instance_type = "t2.micro"
  timeouts {
    create = "60m"
    delete = "2h"
  }
}
```

### This one also contain one meta perameters
### Timeout

```
timeouts {
    create = "60m"
    delete = "2h"
  }
```

## Apply Terraform
```
terraform apply
```


## Destroy Plan
```
terraform destroy
```


