terraform {
  backend "s3" {
    bucket         = "mniak"
    key            = "cloud/terraform.tfstate"
    region         = "sa-east-1"
    dynamodb_table = "MniakCloud-TerraformLock"
  }
}

