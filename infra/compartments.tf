resource "oci_identity_compartment" "Main" {
  name           = "MniakCloud"
  description    = "Main compartment for MniakCloud"
  compartment_id = var.compartment

}
