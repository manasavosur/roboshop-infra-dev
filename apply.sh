#!/bin/bash
# set -e

# for dir in 00-vpc 10-sg 20-sg-rules 30-bastion
# do
#   echo "Applying $dir..."
#   cd $dir
#   terraform apply -auto-approve
#   cd ..
# done

#ssh to bastion and run terraform init and apply for 40-databases manually as they are using private ips

# Continue rest
for dir in 50-backend-alb 60-catalogue 70-acm 80-frontend-alb
do
  echo "Applying $dir..."
  cd $dir
  terraform apply -auto-approve
  cd ..
done

echo "Infrastructure creation completed successfully."