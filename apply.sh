#!/bin/bash

set -e

for dir in 00-vpc 10-sg 20-sg-rules 30-bastion 40-databases
do
  echo "Applying Terraform in $dir..."
  cd $dir
  terraform init
  terraform apply -auto-approve
  cd ..
done

echo "Infrastructure creation complete."