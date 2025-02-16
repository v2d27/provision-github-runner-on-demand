variable "region" {
  type = string
  default = "ap-southeast-1"
}

variable "github-token" {
    type = string
    description = "Your PAT with runner access permissions"
}


# Example your org link is: https://github.com/my-org-name
# => value must be: my-org-name
variable "github-org" {
    type = string
    description = "Your GitHub organization"
}