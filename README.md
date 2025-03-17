# 🚀 Deploy an NGINX Server on AWS EC2 with Terraform  

This project automates the deployment of an **NGINX web server** on an **AWS EC2 instance** using **Terraform**. The deployed instance will be **publicly accessible**, allowing users to verify their deployment through a web browser.

**This Terraform script deploys the following AWS resources:**

- AWS Provider – Configures AWS as the cloud provider
- VPC (Virtual Private Cloud) – Creates an isolated network environment
- Subnet – Allocates a network segment within the VPC
- Internet Gateway – Provides internet access to resources inside the VPC
- Route Table – Defines routing rules for internet connectivity
- Route Table Association – Links the subnet to the route table for internet access
- Security Group – Allows inbound HTTP (port 80) traffic and outbound internet access
- EC2 Instance – Launches a publicly accessible Amazon Linux 2 instance
- NGINX Web Server – Installs and configures NGINX as a web server on the EC2 instance

---

## 📌 Prerequisites  

Before using this Terraform script, ensure you have:  

- An **AWS Free Tier** or **Paid AWS account**  
- Terraform installed ([Download Terraform](https://developer.hashicorp.com/terraform/downloads))  
- An AWS IAM user with sufficient permissions (EC2, VPC, and S3 if using remote state)  
- AWS CLI configured (`aws configure`)  

---

## 📥 Clone This Repository  

To get started, **clone this repository** to your local machine:  

```bash
git clone git@github.com:ScottEnman/terraform-aws-deployment.git
cd terraform-aws-deployment
```

---

## 🔧 Configure Your AWS AMI  

Terraform requires an **Amazon Machine Image (AMI) ID** for launching the EC2 instance. Since AMI IDs vary across AWS regions, **you must provide your own AMI ID**.  

### How to Find Your AMI ID:  

1. Log into **AWS Management Console**  
2. Navigate to **EC2**  
3. Click on **Launch Instance** (you don’t need to create one)  
4. Under **Amazon Machine Image (AMI)**, find an image like **Amazon Linux 2**  
5. Copy the **AMI ID** (e.g., `ami-0abcdef1234567890`)  

### Set Your AMI ID in `variables.tf`  

Open the `variables.tf` file and replace `"YOUR_EC2_AMI"` with your AMI ID:  

```terraform
variable "ec2_ami" {
    description = "Value of the AMI ID for the EC2 Instance"
    type        = string
    default     = "YOUR-AMI-ID" # Replace with your AMI ID
}
```

---

## 🚀 Deploying the NGINX Server  

Once the AMI ID is set, **deploy the infrastructure using Terraform**:  

### 1️⃣ Initialize Terraform  
```bash
terraform init
```

### 2️⃣ Preview Changes  
```bash
terraform plan
```

### 3️⃣ Apply and Deploy 🚀  
```bash
terraform apply -auto-approve
```

This will create:  
✅ A **publicly accessible EC2 instance**  
✅ An **NGINX web server**  

Once Terraform completes, it will output the **public IP address** of the instance.  

---

## 🌍 Access Your Web Server  

Once deployment is successful, open a "Separate" web browser and go to:  

```bash
http://<your-ec2-public-ip>
```

You should see a page confirming that the server is live! 🎉  

---

## 🔥 Destroying the Infrastructure (Optional)  

To remove all resources and avoid AWS charges, run:  

```bash
terraform destroy -auto-approve
```

---

## 🎯 Summary  

✔ You cloned the repo  
✔ Set up AWS credentials  
✔ Provided an AMI ID  
✔ Used Terraform to deploy an EC2 instance with NGINX  
✔ Accessed the deployed web server  

Now, your **NGINX server is live!** 🚀  

---

### 📜 License  

This project is open-source and free to use. Modify it as needed!  

Happy Terraforming! 🎉
