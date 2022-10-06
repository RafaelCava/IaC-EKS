variable "aws_region" {
  type    = string
  default = "us-west-2"
}

variable "repository" {
  type = string
}

variable "cargoIAM" {
  type = string
}

variable "ambiente" {
  type = string
}

variable "cluster_name" {
  type = string
}
