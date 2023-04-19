variable "project" {
    default = "awesome-chess-384113"
}

variable "region" {
  default = "europe-central2"
}

variable "zone" {
    default = "europe-central2-c"
}

variable "instance" {
  default = "e2-standard-4"
}

variable "ssh_pem_key" {
  default = "~/.ssh/gce.pem"
}

variable "ansible_user" {
  default = "ubuntu"
}
