variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable image_id {
  description = "Disk image for reddit app"
  default = "fd8emqvr1350ndn2r6dv"
}
variable subnet_id {
  description = "Subnets for modules"
}
variable app_zone {
  description = "Application zone"
  default = "ru-central1-a"
}
