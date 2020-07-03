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

# Terraform apply - will create a K8s- GKE Cluster
- Update the Project ID 
- Update the User JSON file -> .ssh/account.json

# Download Kubectl Utility to communicate with GKE Cluster	
 curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

# Check the K8s Status 
kubectl get nodes
