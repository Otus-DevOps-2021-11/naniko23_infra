resource "yandex_lb_target_group" "reddit-app" {
  name      = "reddit-app-lb-group"
  region_id = "ru-central1"

  target {
    subnet_id = "e9bn6e0kr6dsfm08apg7"
    address   = yandex_compute_instance.app[0].network_interface.0.ip_address
  }

    target {
    subnet_id = "e9bn6e0kr6dsfm08apg7"
    address   = yandex_compute_instance.app[1].network_interface.0.ip_address
  }
}

resource "yandex_lb_network_load_balancer" "reddit-app-lb" {
  name = "reddit-app-load-balancer"

  listener {
    name = "my-listener"
    port = 9292
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.reddit-app.id

    healthcheck {
      name = "http"
      http_options {
        port = 9292
        path = "/"
      }
    }
  }
}
