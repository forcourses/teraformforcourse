provider "gitlab" {
  token    = var.gitlab_token
  base_url = var.base_url
}


resource "gitlab_group" "terraform_group" {
  name             = var.group_name
  path             = var.group_name
  description      = "${var.group_name} created by terraform"
  visibility_level = "private"
  lfs_enabled      = var.lfs_enabled
}

resource "gitlab_project" "my_terraform_project" {
  name         = "terraform_project"
  namespace_id = gitlab_group.terraform_group.id
  initialize_with_readme = true
  description = "${var.group_name} Infrastructure core repo"
}


resource "gitlab_group_access_token" "my_terraform_acess_token" {
  group        = gitlab_group.terraform_group.id
  name         = "${var.group_name} token"
  expires_at   = "2025-03-14"
  access_level = "developer"

  scopes = ["api"]
}

resource "gitlab_group_variable" "my_terraform_group_variable" {
  group = gitlab_group.terraform_group.id
  key   = "gat"
  value = gitlab_group_access_token.my_terraform_acess_token.token
}