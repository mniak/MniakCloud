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
    private_ip = oci_core_private_ip.MainServer.id
  }
  source_details {
    // Canonical-Ubuntu-22.04-Minimal-aarch64-2022.11.05-0
    // sa-saopaulo-1
    source_type = "image"
    source_id   = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaa3qj5t6lciltgvztum7sgkp6gxb2ln4bkpraugvqvgvmt2cxh337a"
  }
  metadata = {
    "user_data" = base64encode(<<EOT
    #cloud-config
users:
  - name: andre
    passwd: "$6$rounds=4096$U2FMYkUSs1rpjI8W$2xPyE8iUwABiOyZxAJBCW4Mq4MxwKr5GFnkVCpD0omF6SEIorej9aUjyyZk8NnFNBAIBMPmgXble601.cTJhK/"
    ssh_import_id:
      - gh:mniak
    lock_passwd: true
    sudo: ALL=(ALL:ALL) ALL
packages:
  - mosh
  - wireguard
write_files:
  - path: /etc/wireguard/wg0.conf
    content: |
      [Interface]
      Address = 10.1.0.1/24
    EOT
    )
  }
}
