terraform {
  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "~> 0.34.0"
    }

    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.51.1"
    }
  }
}

# https://registry.terraform.io/providers/ovh/ovh/latest/docs#provider-configuration
provider "ovh" {
  endpoint           = "ovh-eu"
  application_key    = "xxxxxxxxx"
  application_secret = "yyyyyyyyy"
  consumer_key       = "zzzzzzzzzzzzzz"
}

# Configure the OpenStack provider hosted by OVHcloud
provider "openstack" {
  auth_url    = "https://auth.cloud.ovh.net/v3/"
  domain_name = "default" # Domain name - Always at 'default' for OVHcloud
  alias       = "ovh"
}
