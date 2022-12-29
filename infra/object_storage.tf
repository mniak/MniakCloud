resource "oci_objectstorage_bucket" "Main" {
  compartment_id = var.compartment
  name           = "storage"
  namespace      = "mniak"
  auto_tiering   = "InfrequentAccess"
}

# data "http" "ArchLinuxARMCloud" {
#   url = "https://github.com/mcginty/arch-boxes-arm/releases/download/v20220323/Arch-Linux-aarch64-cloudimg-20220323.0.qcow2"

#   lifecycle {
#     postcondition {
#       condition     = self.status_code == 200
#       error_message = "Request failed"
#     }
#   }
# }

# resource "local_file" "ArchLinuxARMCloud" {
#   content  = data.http.ArchLinuxARMCloud.response_body
#   filename = "${path.module}/Arch-Linux-aarch64-cloudimg-20220323.0.qcow2"
# }

# resource "oci_objectstorage_object" "ArchLinuxARMCloud" {
#   bucket    = oci_objectstorage_bucket.Main.name
#   namespace = oci_objectstorage_bucket.Main.namespace
#   object    = "Arch-Linux-aarch64-cloudimg-20220323.0.qcow2"
#   #   source    = local_file.ArchLinuxARMCloud.filename
#   source = "https://github.com/mcginty/arch-boxes-arm/releases/download/v20220323/Arch-Linux-aarch64-cloudimg-20220323.0.qcow2"
# }
