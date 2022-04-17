output "external_ip_address_app" {
  value = yandex_compute_instance.app[*].network_interface.0.nat_ip_address
}

output "internal_ip_address_app" {
  value = yandex_compute_instance.app[*].network_interface.0.ip_address
}

output "lb_external_ip" {
  value = yandex_lb_network_load_balancer.reddit-app-lb.listener.*.external_address_spec
}
