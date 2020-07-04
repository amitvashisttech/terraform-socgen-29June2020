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

output : gcloud container clusters get-credentials cool-beanbag-XXXXXX-cluster --zone us-e ast1-b --project cool-beanbag-XXXXXX


# Download Kubectl Utility to communicate with GKE Cluster	
 curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

cp -rf kubectl /usr/bin/kubectl
chmod +x /usr/bin/kubectl

# Initialize Kubeclt.
gcloud container clusters get-credentials cool-beanbag-XXXXXX-cluster --zone us-e ast1-b --project cool-beanbag-XXXXXX
ls -ltr ~/.kube/config


# Check the K8s Status 
kubectl get nodes

# First App Deployment
kubectl run get-started --image=amitvashist7/get-started:part2 --port=80
kubectl get pods
kubectl describe pod get-started
kubectl get svc
kubectl expose pod get-started --type=LoadBalancer
kubectl get svc
kubectl describe svc get-started

# Status Check 
kubectl get nodes,pods,svc
NAME                                                       STATUS   ROLES    AGE   VERSION
node/gke-cool-beanbag-272-cool-beanbag-272-3aa414a6-383q   Ready    <none>   90m   v1.14.10-gke.36
node/gke-cool-beanbag-272-cool-beanbag-272-84d307bd-1mbd   Ready    <none>   90m   v1.14.10-gke.36
node/gke-cool-beanbag-272-cool-beanbag-272-f0b9c1c3-hhxs   Ready    <none>   90m   v1.14.10-gke.36

NAME              READY   STATUS    RESTARTS   AGE
pod/get-started   1/1     Running   0          11m

NAME                  TYPE           CLUSTER-IP     EXTERNAL-IP      PORT(S)        AGE
service/get-started   LoadBalancer   10.39.249.61   35.231.143.235   80:30585/TCP   7m45s
service/kubernetes    ClusterIP      10.39.240.1    <none>           443/TCP        91m


# Clean Up 
kubectl delete pod,svc get-started
pod "get-started" deleted
service "get-started" deleted
