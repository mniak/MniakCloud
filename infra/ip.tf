resource "oci_core_public_ip" "Main" {
  compartment_id = oci_identity_compartment.Main.id
  lifetime       = "RESERVED"
  display_name   = "Main IP"
}