# Prerequisites
```
apt-get update
apt-get install jq wget unzip -y 
```

# Download Terraform 
```
 wget https://releases.hashicorp.com/terraform/0.11.12/terraform_0.11.12_linux_amd64.zip -P /root/
```

# Install Terraform 
```
cd /root
unzip terraform_0.11.12_linux_amd64.zip
mv terraform /usr/bin/
chmod +x /usr/bin/terraform
```

# Verify Terrform
```
terraform --version
```



