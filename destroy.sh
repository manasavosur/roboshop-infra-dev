#!/bin/bash

set -e

echo "Destroying Backend alb's..."
cd 50-databases
terraform destroy -auto-approve
echo "Remaining resources:"
terraform state list || echo "No resources left"
cd ..

echo "Destroying Databases..."
cd 40-databases
terraform destroy -auto-approve
echo "Remaining resources:"
terraform state list || echo "No resources left"
cd ..

echo "Destroying Bastion..."
cd 30-bastion
terraform destroy -auto-approve
echo "Remaining resources:"
terraform state list || echo "No resources left"
cd ..

echo "Destroying SG Rules..."
cd 20-sg-rules
terraform destroy -auto-approve
echo "Remaining resources:"
terraform state list || echo "No resources left"
cd ..

echo "Destroying Security Groups..."
cd 10-sg
terraform destroy -auto-approve
echo "Remaining resources:"
terraform state list || echo "No resources left"
cd ..

echo "Destroying VPC..."
cd 00-vpc
terraform destroy -auto-approve
echo "Remaining resources:"
terraform state list || echo "No resources left"
cd ..

echo "All infrastructure destroyed."
