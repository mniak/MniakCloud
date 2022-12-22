resource "oci_objectstorage_bucket" "Main" {
  compartment_id = var.compartment
  name           = "storage"
  namespace      = "mniak"
  auto_tiering   = "InfrequentAccess"
}

resource "oci_objectstorage_object" "ArchLinuxARMCloud" {
  bucket    = oci_objectstorage_bucket.Main.name
  namespace = oci_objectstorage_bucket.Main.namespace
  object    = "Arch-Linux-aarch64-cloudimg-20220323.0.qcow2"
  source = "https://github.com/mcginty/arch-boxes-arm/releases/download/v20220323/Arch-Linux-aarch64-cloudimg-20220323.0.qcow2"
}
