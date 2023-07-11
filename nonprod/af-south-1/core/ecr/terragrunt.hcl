include "root" {
  path   = find_in_parent_folders()
  expose = true
}

include "common" {
  path = "${dirname(find_in_parent_folders())}/common/ecr/terragrunt.hcl"
}

inputs = {
  ecr_name = "ecr-repo"
}
