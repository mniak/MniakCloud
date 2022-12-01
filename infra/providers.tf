terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "4.100.0"
    }
  }
  cloud {
    organization = "mniak"
    workspaces {
      name = "MniakCloud"
    }
  }
}

provider "oci" {
  tenancy_ocid        = "mniak"
  auth                = "SecurityToken"
  config_file_profile = "DEFAULT"
  region              = var.region
}
