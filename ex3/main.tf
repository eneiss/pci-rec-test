# ==================== INSTANCE
resource "openstack_compute_instance_v2" "ex3" {
  name     = "ex3_instance"
  provider = openstack.ovh

  image_name  = var.image_name
  region      = var.region
  flavor_name = var.instance_type
  key_pair    = openstack_compute_keypair_v2.test_keypair.name

  user_data = file("cloud-init.sh")

  network {
    name = "main_network"
  }
}

# ==================== KEY PAIR
resource "openstack_compute_keypair_v2" "test_keypair" {
  name       = "ex3_keypair"
  provider   = openstack.ovh
  region     = var.region
  public_key = file("~/.ssh/id_rsa.pub")
}

# ==================== FLOATING IP
resource "openstack_compute_floatingip_v2" "instance_ip" {
  provider = openstack.ovh
  region   = var.region
  pool     = "public"
}

resource "openstack_compute_floatingip_associate_v2" "association" {
  provider    = openstack.ovh
  floating_ip = openstack_compute_floatingip_v2.instance_ip.address
  instance_id = openstack_compute_instance_v2.ex3.id
}