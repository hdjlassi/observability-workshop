provider "multipass" {}

terraform {
  required_providers {
    multipass = {
      source  = "larstobi/multipass"
      version = "~> 1.4.1"
    }
  }
}

variable "splunk_access_token" {
  description = "Splunk Oberservability Cloud Access Token"
}

variable "splunk_rum_token" {
  description = "Splunk Oberservability Cloud RUM Token"
}

variable "splunk_realm" {
  description = "Splunk Oberservability Cloud Realm (us0, us1, us2, eu0, jp0, au0)"
}

variable "splunk_presetup" {
  description = "Presetup the instance? (true/false)"
  type = bool
}

data "template_file" "user_data" {
  template = "${file("../workshop/aws/ec2/templates/userdata.yaml")}"
  vars = {
    access_token = "${var.splunk_access_token}"
    rum_token = "${var.splunk_rum_token}"
    realm = "${var.splunk_realm}"
    presetup = "${var.splunk_presetup}"
  }
}

resource "local_file" "user_data" {
  filename = "ubuntu-cloudinit.yml"
  content  = data.template_file.user_data.rendered
}

resource "random_string" "hostname" {
  length = 4
  lower  = true
  upper  = false
  special = false
  numeric = false
}

resource "multipass_instance" "ubuntu" {
  name = random_string.hostname.result
  memory = "8096MiB"
  disk = "32GiB"
  cpus = 4
  image  = "jammy"
  cloudinit_file = local_file.user_data.filename
}
