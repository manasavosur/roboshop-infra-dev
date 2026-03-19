#!/bin/bash
set -e

for dir in 00-vpc 10-sg 20-sg-rules 30-bastion
do
  echo "Applying $dir..."
  cd $dir
  terraform apply -auto-approve
  cd ..
done

# Apply DB separately
echo "Applying databases..."
cd 40-databases
terraform apply -auto-approve
cd ..

# Continue rest
for dir in 50-backend-alb 60-catalogue 70-acm 80-frontend-alb
do
  echo "Applying $dir..."
  cd $dir
  terraform apply -auto-approve
  cd ..
done