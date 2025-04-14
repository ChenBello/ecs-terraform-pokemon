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

