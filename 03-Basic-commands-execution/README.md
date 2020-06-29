# Tarrform Plans

## Build Plan
### Terrafrom Plan & apply without consent
```
terraform plan
terraform apply
```

### Create Terraform Build Plan
```
terraform plan -out Build-Plan
```

### Check Terraform Build Plan
```
terraform show Build-Plan
```

### Apply Terraform Build Plan
```
terraform apply "Build-Plan"
```


## Destroy Plan

### Create Terraform Destroy Plan
```
terraform plan --destroy  -out Destroy-Plan
```

###  Check Terraform Destroy Plan
```
terraform show Destroy-Plan
```

###  Apply Terraform Destroy Plan
```
terraform apply "Destroy-Plan"
```



