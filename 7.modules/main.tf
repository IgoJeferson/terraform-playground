# Warning! The examples on this page are not eligible for the AWS free tier. 
# Do not try the examples on this page unless you're willing to spend a small amount of money.


terraform {
  required_version = "0.11.11"
}

# This module requires that your AWS account has a default VPC.
provider "aws" {
  profile   = "default"
  region    = "us-east-1"
}

module "consul" {
  # The source attribute is the only mandatory argument for modules. It tells Terraform where the module can be retrieved. Terraform automatically downloads and manages modules for you.
  source      = "hashicorp/consul/aws"

  # It's recommend to explicitly constraint the acceptable version numbers for each external module to avoid unexpected or unwanted changes.
  version = "0.7.3"
  num_servers = "3"
}


# If you run terraform apply, you will see a large list of all of the resources encapsulated 
# in the module. The output is similar to what we saw when using resources directly,
# but the resource names now have module paths prefixed to their names.

# Without needing any knowledge of how Consul works, how to install Consul, 
# or how to form a Consul cluster, you've created a working cluster in just a few minutes.

## Module Outputs

# Just as the module instance had input arguments such as num_servers above, module can also produce output values, similar to resource attributes.

output "consul_server_asg_name" {
  # The syntax for referencing module outputs is ${module.NAME.OUTPUT}, where NAME is the module name given in the header of the module configuration block and OUTPUT is the name of the output to reference.
  value = "${module.consul.asg_name_servers}"
}

# If you run terraform apply again, Terraform will make no changes to infrastructure, but you'll now see the "consul_server_asg_name" output with the name of the created auto-scaling group: