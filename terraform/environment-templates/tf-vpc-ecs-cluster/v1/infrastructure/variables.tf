# required by proton
variable "environment" {
  description = "The Proton Environment"
  type = object({
    name   = string
    inputs = map(string)
  })
  default = null
}

variable "region" {
  description = "aws region"
  type        = string
  default     = "ap-southeast-1"
}

variable "tf_state_bucket" {
  description = "Terraform state bucket name. This is merely a passthrough so we can conveniently output it back to proton"
  type        = string
}
