A Terraform script which spins up three different Azure Windows VMs and dependent sevices.
The tradeoff of this template is that it creates three VMs with different configurations at a time. Only single VM resource block is declared in the main.tf (virtualMachines.tf) file and rest configurations are declared in virtualMachines.tfvars file.


Steps to get it up and running.
1. Clone this repository in a new directory.
2. Run Terraform commands: terraform init --> terraform fmt --> terraform validate.
3. As this script uses (.tfvars) file, it must be passed during plan and apply such as terraform plan -var-file=virtualMachines.tfvars & terraform apply -var-file=virtualMachines.tfvars.
4. Finally to destroy the resources use this command terraform destroy -var-file="virtualMachines.tfvars".

Note!
Do not make any changes outside of this script/template as it causes inconsistency in terraform and the actual infrastructure.

To modify it, just change the virtualMachines.tfvars file with your desired values and not the other files.

