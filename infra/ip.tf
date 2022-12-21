resource "oci_core_public_ip" "Main" {
  compartment_id = oci_identity_compartment.Main.id
  lifetime       = "RESERVED"
  display_name   = "Main IP"
  private_ip_id = data.oci_core_private_ips.Main.private_ips[0].id
}

data "oci_core_private_ips" "Main" {
  ip_address = oci_core_instance.MainServer.private_ip
  subnet_id  = oci_core_subnet.Main.id
}