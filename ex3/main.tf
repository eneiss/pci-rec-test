resource "openstack_compute_instance_v2" "ex3" {
  name     = "ex3_instance"
  provider = openstack.ovh

  image_name  = "Debian 10"
  region      = var.region
  flavor_name = var.instance_type
  key_pair    = openstack_compute_keypair_v2.test_keypair.name
  # security_groups = ["default"]   # not required?

  user_data = file("cloud-init.sh")

  network {
    name = "main_network"
  }
}

resource "openstack_compute_keypair_v2" "test_keypair" {
  provider   = openstack.ovh
  name       = "ex3_keypair"
  public_key = file("~/.ssh/id_rsa.pub")
}