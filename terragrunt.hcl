locals {
  account_config = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_config  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_config     = read_env_config(find_in_parent_folders("env.hcl"))

  region = local.region_config.locals.region
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = local.account_config.locals.state_bucket
    dynamodb_table = local.account_config.locals.state_table
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "af-south-1"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
	required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "${local.region}"
}
EOF
}



