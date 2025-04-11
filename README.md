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
    git clone https://github.com/your-username/random-pokemon-flask-app.git
    cd random-pokemon-flask-app
    ```

2. Build the Docker image:
    ```bash
    docker build -t random-pokemon-flask .
    ```

3. Push the Docker image to your Docker Hub or ECR repository.

4. Deploy infrastructure using Terraform:
    - Update Terraform variables (e.g., AWS region, VPC settings).
    - Apply the Terraform configuration to provision resources.
    ```bash
    terraform init
    terraform apply
    ```

5. Once deployed, the app will be accessible via the ALB endpoint.

