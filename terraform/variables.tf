variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  default = "ru-central1-a"
}
variable app_zone {
  description = "Application zone"
  default = "ru-central1-a"
}
variable token {
  description = "Token"
}
variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable image_id {
  description = "Disk image"
}
variable subnet_id {
  description = "Subnet"
}
variable "private_key_path" {
  description = "Path to the private key file used by provisioners"
}
variable "instance_count" {
  description = "Sets number of reddit-app instances to be deployed"
  default = 1
}
# variable service_account_key_file{
#   description = "key .json"
# }
