resource "oci_core_image" "ArchLinuxARMCloud" {
  compartment_id = oci_identity_compartment.Main.id
  display_name   = "Arch Linux aarch64 cloud 2022-03-23"
  image_source_details {
    // https://github.com/mcginty/arch-boxes-arm/releases/tag/v20220323
    source_image_type = "QCOW2"
    source_type       = "objectStorageUri"
    # source_uri        = oci_objectstorage_object.ArchLinuxARMCloud
    source_uri = "https://github.com/mcginty/arch-boxes-arm/releases/download/v20220323/Arch-Linux-aarch64-cloudimg-20220323.0.qcow2"
  }
}

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
    source_type = "image"
    source_id   = oci_core_image.ArchLinuxARMCloud.id
  }
  metadata = {
    "user_data" = base64encode(file("cloud-init.yaml"))
  }
}
