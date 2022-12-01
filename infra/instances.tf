resource "oci_core_instance" "MainServer" {
  availability_domain = "NBMi:SA-SAOPAULO-1-AD-1"
  compartment_id      = oci_identity_compartment.Main.id
  display_name        = "Main Server"
  shape               = "VM.Standard.A1.Flex"
  shape_config {
    memory_in_gbs = "96"
    ocpus         = "16"
  }
  create_vnic_details {
    subnet_id = oci_core_subnet.Main.id
  }
  source_details {
    source_type = "image"
    source_id   = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaa3qj5t6lciltgvztum7sgkp6gxb2ln4bkpraugvqvgvmt2cxh337a"
  }
}

