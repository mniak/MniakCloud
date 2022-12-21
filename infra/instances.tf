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
    subnet_id        = oci_core_subnet.Main.id
    assign_public_ip = false
  }
  source_details {
    // Canonical-Ubuntu-22.04-Minimal-aarch64-2022.11.05-0
    // sa-saopaulo-1
    source_type = "image"
    source_id   = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaa3qj5t6lciltgvztum7sgkp6gxb2ln4bkpraugvqvgvmt2cxh337a"
  }
  metadata = {
    "user_data" = base64encode(file("cloud-init.yaml"))
  }
}
