# AWS High Availability Web Application

## Project Overview

Designed and deployed a highly available web application on Amazon Web Services (AWS) using EC2, VPC, IAM, S3, Elastic Load Balancer (ALB), Auto Scaling Group (ASG), and CloudWatch.

The architecture distributes incoming application traffic across multiple EC2 instances deployed in different Availability Zones to improve application availability, scalability, and reliability.

## AWS Services Used

- **Amazon EC2:** Hosted the web application using Amazon Linux.
- **Amazon VPC:** Created isolated networking with public and private subnets.
- **AWS IAM:** Configured IAM roles and policies for secure AWS service access.
- **Amazon S3:** Used for application files and backup storage.
- **Application Load Balancer:** Distributed incoming traffic across EC2 instances.
- **Auto Scaling Group:** Automatically maintained EC2 capacity and replaced unhealthy instances.
- **Amazon CloudWatch:** Monitored infrastructure metrics and configured alarms.

## Architecture

The application was deployed across two Availability Zones in the AWS Mumbai Region (ap-south-1).

Architecture components:

1. Internet users access the application through an Application Load Balancer.
2. ALB forwards requests to healthy EC2 instances.
3. EC2 instances run inside private subnets.
4. Auto Scaling Group maintains desired instance capacity.
5. IAM roles provide secure access to S3.
6. S3 stores application files and backups.
7. CloudWatch monitors EC2 and ALB metrics.

## Network Configuration

| Component | Configuration |
|---|---|
| AWS Region | ap-south-1 |
| VPC CIDR | 10.0.0.0/16 |
| Public Subnets | 2 |
| Private Subnets | 2 |
| Internet Gateway | 1 |
| NAT Gateway | 1 (lab configuration) |
| Availability Zones | 2 |

## Auto Scaling Configuration

- Minimum Instances: 2
- Desired Instances: 2
- Maximum Instances: 4
- Scaling Policy: Target Tracking
- CPU Target Utilization: 50%

## Security Implementation

- Configured security groups to restrict inbound traffic.
- Allowed HTTP traffic from ALB to EC2.
- Used IAM roles instead of hardcoded AWS credentials.
- Enabled S3 Block Public Access.
- Deployed application servers in private subnets.

## Monitoring

Configured Amazon CloudWatch to monitor:

- EC2 CPU Utilization
- ALB Request Count
- ALB Target Response Time
- Healthy and Unhealthy Host Count
- Auto Scaling capacity

Configured CloudWatch alarms for infrastructure monitoring.

## High Availability Testing

Performed the following tests:

1. Accessed the application through the ALB DNS endpoint.
2. Verified traffic distribution across EC2 instances.
3. Terminated an EC2 instance to test automatic replacement.
4. Verified Auto Scaling Group maintained the desired capacity.
5. Checked application health using ALB target group health checks.
6. Verified S3 access using the EC2 IAM role.
7. Monitored infrastructure metrics using CloudWatch.

## Key Learnings

- AWS networking and VPC architecture.
- EC2 deployment and configuration.
- IAM roles and permission management.
- Load balancing and traffic distribution.
- Auto Scaling and infrastructure availability.
- S3 storage and access management.
- CloudWatch monitoring and alarms.

## Project Outcome

Successfully implemented a multi-AZ AWS web application architecture with load balancing, automatic instance replacement, centralized monitoring, and secure AWS resource access.

## Author

Prem Kumar

GitHub: https://github.com/Premkumar734
