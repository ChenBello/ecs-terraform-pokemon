🐾 ecs-terraform-pokemon
Random Pokémon Flask App on AWS ECS
This project showcases a simple yet scalable Flask web app that displays random Pokémon. It's deployed using AWS ECS Fargate, with an Application Load Balancer (ALB) and Auto Scaling for high availability and performance.

🚀 Features
🎯 Flask-based Python web application

🔁 Displays a random Pokémon each time the page loads

🐳 Dockerized and deployed via Amazon ECS Fargate

🌐 Exposed to the internet via ALB

📈 Auto Scaling based on resource usage

🔄 Fully automated CI/CD pipeline via GitHub Actions

🧱 Architecture Overview
Component	Purpose
Amazon ECS Fargate	Runs the containerized Flask app
Application Load Balancer (ALB)	Distributes incoming traffic
Auto Scaling	Automatically scales ECS tasks
Amazon ECR	Stores Docker images
GitHub Actions	Automates deployment process
🛠️ Prerequisites
AWS account with appropriate IAM permissions

Terraform installed

Docker installed

GitHub account with access to repository secrets and variables

📦 Deployment Instructions
Clone the Repository:

bash
Copy
Edit
git clone https://github.com/ChenBello/ecs-terraform-pokemon.git
cd ecs-terraform-pokemon
Configure Terraform Variables:

bash
Copy
Edit
cp terraform.tfvars.example terraform.tfvars
Update terraform.tfvars with your AWS account, VPC, and app configuration.

(Optional) Build Docker Image Locally:

bash
Copy
Edit
cd application
docker build -t pokemon-flask-app .
Push Image to ECR or Docker Hub: Follow your registry’s instructions for login and image push.

Deploy with Terraform:

bash
Copy
Edit
cd infrastructure
terraform init
terraform apply
Access Your App: After deployment, the app is accessible via the ALB DNS name output by Terraform.

🔁 CI/CD with GitHub Actions
This repository includes a GitHub Actions workflow for continuous deployment, located at:

bash
Copy
Edit
.github/workflows/DeployApp.yml
✅ What It Does:
Builds the Docker image when changes occur in application/

Pushes the image to Amazon ECR

Triggers a force-new-deployment on ECS

Sends a Slack notification on success/failure

Supports manual deployments via workflow dispatch

⚙️ Workflow Triggers
Auto: On push to main affecting application/ directory

Manual: Trigger from the GitHub Actions UI

🔐 Required GitHub Secrets
Add these under Settings → Secrets and variables → Actions:

Name	Description
AWS_ACCESS_KEY_ID	IAM user access key
AWS_SECRET_ACCESS_KEY	IAM user secret key
AWS_ACCOUNT_ID	Your AWS account ID
SLACK_WEBHOOK_URL	Slack incoming webhook URL
📘 Repository Variables
Add under Settings → Variables:

Name	Description
ECR_BACKEND_IMAGE	ECR repo name (e.g. pokemon-flask-app)
AWS_DEFAULT_REGION	AWS region (e.g. us-east-1)
ECS_CLUSTER	ECS cluster name
ECS_BACKEND_SERVICE	ECS service name
📤 Deployment Workflow Steps
Checkout the repository

Authenticate to AWS & ECR

Build the Docker image from application/

Push image to ECR with latest tag

Update ECS service with a new image

Send a Slack message with deployment status

💬 Slack Notification Examples
✅ Deployment succeeded!

❌ Deployment failed!

Messages include:

GitHub username

Commit message

ECS cluster & service name

