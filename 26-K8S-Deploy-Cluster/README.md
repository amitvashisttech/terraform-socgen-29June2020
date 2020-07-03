# GCP Account Setup 
1. Setup a GCP Account 
    - Create a Project : k8s-demo
	- Create a Service Account : k8s-demo-sa
	        - Roles: 
			       - Project : Editor
				   - Assinment: Admin
				   - Compute Engine: Compute Admin 
				   - Compute Engine: Compute Network Admin 
			- Create a Key	(JSON)

# Download SDK
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-sdk


# Initialize Google SDK
2. Download Google SDK 
    - glcoud init 
       - Auth & Authorized. 	
