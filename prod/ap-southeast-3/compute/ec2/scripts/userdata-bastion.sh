#!/bin/bash

# Update system packages
sudo dnf update -y

# Install basic tools: Git, unzip, wget, curl, nano
sudo dnf install -y git unzip wget curl nano

# Install Docker
sudo dnf install -y docker
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ec2-user # Add ec2-user to the docker group

# Install AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip aws/

# Install kubectl (latest stable version)
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install eksctl (latest version)
EKSCTL_VERSION=$(curl --silent "https://api.github.com/repos/weaveworks/eksctl/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
curl -sLO "https://github.com/weaveworks/eksctl/releases/download/${EKSCTL_VERSION}/eksctl_Linux_amd64.tar.gz"
tar -xzf eksctl_Linux_amd64.tar.gz -C /tmp && sudo mv /tmp/eksctl /usr/local/bin
rm -f eksctl_Linux_amd64.tar.gz

# Check Latest Terraform Version
# Download Terraform binary
TERRAFORM_VERSION="1.10.1"
wget "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

# Unzip and move Terraform to a directory in PATH
unzip "terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
sudo mv terraform /usr/local/bin/

# Clean up
rm "terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

# Verify installations
echo "Verifying installed tools..."
aws --version
kubectl version --client --output=yaml
terraform --version
docker --version
git --version
nano --version
#eksctl version



# Configure AWS CLI
#aws configure

# Configure kubectl
#aws eks update-kubeconfig --name <your-cluster-name>

# Optional: Install additional tools or run custom scripts

# Example: Install Helm
#curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Example: Clone a Terraform repository
#git clone https://github.com/your-username/your-terraform-repo.git