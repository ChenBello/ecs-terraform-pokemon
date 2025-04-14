# ecs-terraform-pokemon

# Random Pokémon Flask App

Flask app that displays random Pokémon, deployed on AWS ECS with ALB (Application Load Balancer) and Auto Scaling.

## Features
- Flask-based web app
- Displays random Pokémon
- Deployed on AWS ECS Fargate
- Accessible via ALB
- Auto Scaling for scalability

## Architecture
- **Amazon ECS**: Hosts the Flask app in containers
- **ALB (Application Load Balancer)**: Routes traffic to the ECS service
- **Auto Scaling**: Automatically adjusts the number of containers based on traffic

## Setup and Deployment

### Prerequisites
- AWS account with necessary permissions
- Terraform for infrastructure provisioning
- Docker for containerizing the Flask app

### Steps to Deploy
1. Clone the repository:
    ```bash
    git clone https://github.com/ChenBello/ecs-terraform-pokemon.git
    cd ecs-terraform-pokemon
    ```

2. Copy the example variables file and update it with your own values:
    ```bash
    cp terraform.tfvars.example terraform.tfvars
    ```
    
3. Build the Docker image locally (optional for testing):
    ```bash
    cd application
    docker build -t pokemon-flask-app .
    ```

3. Push the Docker image to your Docker Hub or ECR repository.

4. Deploy infrastructure using Terraform:
    - Update Terraform variables (e.g., AWS region, VPC settings).
    - Apply the Terraform configuration to provision resources.
    - Make sure `terraform.tfvars` contains your actual values.
    ```bash
    cd infrastructure
    terraform init
    terraform apply
    ```

5. Once deployed, the app will be accessible via the ALB endpoint.



## GitHub Actions CI/CD

This project includes a GitHub Actions workflow that automates the Docker build, push, and ECS deployment process every time a change is pushed to the main branch within the application/ folder.

# Features
	•	Builds and pushes the Docker image to Amazon ECR
	•	Deploys the new image to Amazon ECS using force-new-deployment
	•	Slack notifications on success and failure
	•	Workflow dispatch to trigger deployments manually
	•	Only triggers when relevant code changes are made

# Workflow Location

The workflow file is located at:
.github/workflows/DeployApp.yml

Trigger Conditions
	•	Automatically runs on push to the main branch when changes are made to files inside the application/ directory.
	•	Can also be triggered manually via the GitHub UI using workflow dispatch.

# Required GitHub Secrets

To enable this workflow, set the following secrets in your repository (Settings → Secrets and variables → Actions):

Name	Description
AWS_ACCESS_KEY_ID	IAM user’s access key
AWS_SECRET_ACCESS_KEY	IAM user’s secret key
AWS_ACCOUNT_ID	Your AWS account ID
SLACK_WEBHOOK_URL	Incoming webhook URL for Slack notifications

Required GitHub Repository Variables

Under repository Settings → Variables, add:

# Name	Description
ECR_BACKEND_IMAGE	ECR repository name (e.g. pokemon-flask-app)
AWS_DEFAULT_REGION	AWS region (e.g. us-east-1)
ECS_CLUSTER	Name of your ECS cluster
ECS_BACKEND_SERVICE	Name of the ECS service to update

What Happens During Deployment
	1.	Checkout repository
	2.	Authenticate to AWS and Amazon ECR
	3.	Build the Docker image from the application/ directory
	4.	Push the image to ECR with the latest tag
	5.	Update ECS service to force a new deployment using the new image
	6.	Send Slack notification on success or failure, with details about the deployer, service, and commit message

# Example Slack Messages
	•	✅ Deployment succeeded!
	•	❌ Deployment failed!

These messages include the service name, ECS cluster, GitHub username, and the commit message that triggered the deployment.
