variable "base_url" {
  description = "gitlab url"
}

variable "gitlab_token" {
  description = "gitlab token"
  sensitive   = true
}

variable "group_name" {
  description = "group name created by terraform"
  type        = string
}

variable "lfs_enabled" {
  description = "on/off lfs option"
  type        = bool
  default     = true
}