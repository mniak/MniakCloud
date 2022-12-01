variable "compartment" {
  description = "OCID of the parent compartment"
  type        = string
  default     = "ocid1.tenancy.oc1..aaaaaaaas6yayr7q7cyte5q5l2jmm3wls7rq2jkctd3xmhrfom6e4wrvbpda"
}

variable "region" {
  description = "The region to use"
  type        = string
  default     = "sa-saopaulo-1"
}
