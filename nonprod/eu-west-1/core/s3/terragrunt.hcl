include "root" {
  path   = find_in_parent_folders()
  expose = true
}

include "common" {
  path = "${dirname(find_in_parent_folders())}/common/s3/terragrunt.hcl"
}

inputs = {
  bucket_name = "eu-west-1-core-bucket"
}
