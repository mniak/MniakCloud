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
    assign_public_ip = oci_core_public_ip.Main.ip_address
  }
  source_details {
    // Canonical-Ubuntu-22.04-Minimal-aarch64-2022.11.05-0
    // sa-saopaulo-1
    source_type = "image"
    source_id   = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaa3qj5t6lciltgvztum7sgkp6gxb2ln4bkpraugvqvgvmt2cxh337a"
  }
  metadata = {
    "ssh_authorized_keys" = ""
    "user_data"           = base64encode(<<-EOT
    #include
    https://gist.githubusercontent.com/mniak/b5cea0341be6e289b74ae8ed83073b91/raw/anyOS-script-setup-k3os.yaml
    EOT
    )
  }
}
