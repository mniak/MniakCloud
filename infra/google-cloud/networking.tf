resource "google_compute_address" "External" {
  name         = "server-ip"
  network_tier = "STANDARD"
}

resource "google_compute_firewall" "Firewall" {
  name    = "libera-tutto"
  network = google_compute_network.MainNetwork.self_link
  source_ranges = [
    "0.0.0.0/0"
  ]

  allow {
    protocol = "all"
  }
}

resource "google_compute_network" "MainNetwork" {
  name                    = "main-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "MainSubNetwork" {
  name             = "dual-stack-subnet"
  ip_cidr_range    = "10.0.0.0/22"
  stack_type       = "IPV4_IPV6"
  ipv6_access_type = "EXTERNAL"
  network = google_compute_network.MainNetwork.id
  
}
