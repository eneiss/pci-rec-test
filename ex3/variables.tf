variable "instance_type" {
  type    = string
  default = "d2-4" # Discovery type (d2-4: 4GB, 2vCPU)
}

variable "region" {
  type    = string
  default = "GRA7" # Gravelines, Nord de la France
}