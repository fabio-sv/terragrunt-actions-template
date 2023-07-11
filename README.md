# Terragrunt with Github Actions template

Defines a base repo for using Terragrunt and Github Actions together.
Writes plan outcome to PR.

### File structure

```tree
├───modules		# re-usable Terraform modules
├───common		# re-usable Terragrunt modules wrapping Terraform modules
├───nonprod		# Account scope
│   ├───af-south-1	Region scope
│   │   ├───core	# environment scope - core is environment independent
│   │   ├───dev		# dev environment scope
│   │   └───qa		# qa environment scope
│   └───eu-west-1
│       ├───core
│       ├───dev
│       └───qa
└───prod
    └───af-south-1
        ├───core
        ├───stg
        └───prod
```
