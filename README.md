# Terraform Playground

 Terraform is the infrastructure as code offering from HashiCorp. It is a tool for building, changing, and managing infrastructure in a safe, repeatable way. Operators and Infrastructure teams can use Terraform to manage environments with a configuration language called the HashiCorp Configuration Language (HCL) for human-readable, automated deployments.

## Prerequisites

* Start with a Linux or Mac OS X machine with a docker installed


## Installation

* Download the repository as a zip or make a clone
* Unzip the files to a directory
* Navigate to the root directory
* Run the command ```docker build --name terraform . ```


docker run -d --name local-terraform icoelho/terraform:0.12.20


** For more information about the installation click [here])https://learn.hashicorp.com/terraform/getting-started/install)
 

## Run Terraform

* Launching terraform will automatically download the necessary plugins

``` terraform init ```

* Check with the following command what terraform will provide, this command is a preview.

``` terraform plan ```

* After checking the output, the apply command will build the infrastructure declared in the main.tf file

``` terraform apply ```

* Confirm with "yes" to perform the deployment.


## Technologies Used

* [Docker v19.03.3](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
* [Terraform v0.12.20](https://www.terraform.io/downloads.html)
* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) 
