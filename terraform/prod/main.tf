provider "yandex" {
  #token     = "t1.9euelZqbz8qdkpmWnZSZzZyLnJvGlO3rnpWanZSTmJnNlc2Ri5qLnJadlJzl8_c1J0Rw-e8fT14q_t3z93VVQXD57x9PXir-zef1656Vmo2ez56OyJuSx5KTz8bGlouc7_0.HYE4xHs_dU9eJJXfA66iJGZtJ1c7zHF2n0nxUOmdADwWem6ytVcRPcVpjJNBuf0by0tXjzvI7bi8WxTjw-r6AA"
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

resource "yandex_compute_instance" "app" {
  count = var.instance_count
  name = "reddit-app-${count.index}"
  zone = var.app_zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  connection {
    type  = "ssh"
    host  = self.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    private_key = file(var.private_key_path)
  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }

}
