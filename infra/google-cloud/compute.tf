resource "google_compute_instance" "vm" {
  provider     = google-beta
  name         = "vm"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-minimal-2204-jammy-v20221206"
    }
  }

  network_interface {
    network = "default"
  }
}
