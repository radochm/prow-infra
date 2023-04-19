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

variable "credentials" {
  default = "/etc/satoken/satoken"
}

variable "ssh_prv_key" {
  default = "/etc/ssh-key/id_rsa"
}

variable "ssh_pub_key" {
  default = "/etc/ssh-key/id_rsa.pub"
}

variable "ansible_user" {
  default = "ubuntu"
}
