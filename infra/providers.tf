terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "4.100.0"
    }
  }
  backend "s3" {
    bucket         = "mniak"
    key            = "cloud/terraform.tfstate"
    region         = "sa-east-1"
    dynamodb_table = "MniakCloud-TerraformLock"
  }
}

provider "oci" {
  tenancy_ocid        = "mniak"
  auth                = "InstancePrincipal"
  config_file_profile = "DEFAULT"
  region              = var.region
}
