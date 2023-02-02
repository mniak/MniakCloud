resource "google_compute_address" "External" {
  name = "external-ip"
}

resource "google_compute_firewall" "Firewall" {
  name    = "libera-tutto"
  network = "default"
  source_ranges = [
    "0.0.0.0/0"
  ]

  allow {
    protocol = "all"
  }
}
