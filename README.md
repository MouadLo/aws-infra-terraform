# Infrastructure Automation With Terraform

Terraform file to create a custom VPC in each availability zone has its own public and private subnet,  public subnets for internet-facing services/applications and private subnets for (Database, caching services, and backends). this of course if we use a Load Balancer (LB), we will typically put the LB in the public subnets and the instances serving an application in the private subnets.

Instances started in subnet main-public-3 will have IP address 10.0.3.X, and will be lanched in the us-east-1c availability zone (Amazon calls 1 datacenter an availability zone).

All public subnets are connected to an Internet Gateway. these instances will also have a public IP address, allowing them to be reachable from the internet.

Instances from main-public can reach instances from main-private, because they're all in the same VPC. this of course if we set the firewall to allow from one to another.

 - main-public-1 (10.0.1.0/24) us-east-1a
 - main-public-2 (10.0.2.0/24) us-east-1b
 - main-public-3 (10.0.3.0/24) us-east-1c
 - main-private-1 (10.0.4.0/24) us-east-1a
 - main-private-2 (10.0.5.0/24) us-east-1b
 - main-private-3 (10.0.6.0/24) us-east-1c
  


