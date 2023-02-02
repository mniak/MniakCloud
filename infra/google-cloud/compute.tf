resource "google_compute_instance" "CloudServer" {
  provider     = google-beta
  name         = "cloud-server"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-minimal-2204-jammy-v20221206"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.MainSubNetwork.self_link
    stack_type = "IPV4_IPV6"
    access_config {
      nat_ip       = google_compute_address.External.address
      network_tier = "STANDARD"
    }
  }

  metadata = {
    "user-data" = file("google-cloud/cloud-init.yaml")
  }
}


