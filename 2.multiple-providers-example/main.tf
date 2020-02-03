provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

# Create a new AWS Instance
resource "aws_instance" "example" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform Getting Started"
  }
}

# Create a new Datadog monitor
resource "datadog_monitor" "example" {
  name               = "Instance Example"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: @hipchat-channel"
  escalation_message = "Escalation message @pagerduty"

  query = "avg(last_1h):avg:aws.ec2.cpu{host:${aws_instance.example.id}} by {host} > 4"

  thresholds = {
    ok                = 0
    warning           = 2
    warning_recovery  = 1
    critical          = 4
    critical_recovery = 3
  }

  notify_no_data    = false
  renotify_interval = 60

  notify_audit = false
  timeout_h    = 60
  include_tags = true

  silenced = {
    "*" = 0
  }
}