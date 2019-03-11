terraform {
  backend "s3" {
    bucket = "matorz.woa19.gdansk"
    region = "eu-west-1"
    key    = "terraform/lb-pub-priv/terraform.tfstate"
  }
}   

provider "aws" {
  region = "eu-west-1"
  version = "2.1"
}

locals {
  cidr_vpc = "10.99.0.0/16"
  cidr_sub_pub_1 = "10.99.0.0/24"
  cidr_sub_pub_2 = "10.99.1.0/24"
  base_ami = "ami-0ff760d16d9497662"
}


