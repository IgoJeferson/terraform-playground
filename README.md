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


** For more information about the installation click [here](https://learn.hashicorp.com/terraform/getting-started/install) **
 

## Run Terraform

* Launching terraform will automatically download the necessary plugins

``` terraform init ```

* Check with the following command what terraform will provide, this command is a preview.

``` terraform plan ```

* After checking the output, the apply command will build the infrastructure declared in the main.tf file

``` terraform apply ```

* Confirm with "yes" to perform the deployment.


* ** Other important commands are **

* To follow style conventions, we recommend language consistency between files and modules written by different teams. The ``` terraform fmt ``` command enables standardization which automatically updates configurations in the current directory for easy readability and consistency.

* If you are copying configuration snippets or just want to make sure your configuration is syntactically valid and internally consistent, the built in ``` terraform validate ``` command will check and report errors within modules, attribute names, and value types.

* Destroy Infrastructure: 

Destroying your infrastructure is a rare event in production environments. But if you're using Terraform to spin up multiple environments such as development, test, QA environments, then destroying is a useful action.


``` terraform destroy ```

Answer "yes" to execute this plan and destroy the infrastructure:

** For more information about the commands click [here](https://www.terraform.io/docs/commands/index.html) **

## Technologies Used

* [Docker v19.03.3](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
* [Terraform v0.12.20](https://www.terraform.io/downloads.html)
* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) 
