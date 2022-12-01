resource "oci_identity_compartment" "Main" {
  name           = "MniakCloud"
  description    = "Main compartment for MniakCloud"
  compartment_id = "ocid1.tenancy.oc1..aaaaaaaas6yayr7q7cyte5q5l2jmm3wls7rq2jkctd3xmhrfom6e4wrvbpda"
}
