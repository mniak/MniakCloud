resource "oci_core_vcn" "Main" {
  display_name   = "MniakCloud main network"
  compartment_id = oci_identity_compartment.Main.id
  cidr_blocks = [
    "10.0.0.0/16",
  ]
}


resource "oci_core_subnet" "Main" {
  display_name   = "MniakCloud main subnet"
  vcn_id         = oci_core_vcn.Main.id
  compartment_id = oci_identity_compartment.Main.id
  cidr_block     = "10.0.0.0/24"
}

