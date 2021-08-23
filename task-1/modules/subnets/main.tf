# Public Subnet
# https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html
resource "google_compute_subnetwork" "public" {
  name          = "${var.public_name}-${count.index}" #"public-${count.index}" 
  region        = var.region
  count         = var.custom_count != "" ? var.custom_count : length(data.google_compute_zones.available.names)
  ip_cidr_range = cidrsubnet(var.public_subnet_cidr, 2, count.index)
  network       = var.network_name
}

#  Private Subnet
#  https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html
resource "google_compute_subnetwork" "protected" {
  name                     = "${var.protected_name}-${count.index}"
  ip_cidr_range            = cidrsubnet(var.protected_subnet_cidr, 2, count.index)
  region                   = var.region
  count                    = var.custom_count != "" ? var.custom_count : length(data.google_compute_zones.available.names)
  network                  = var.network_name
  private_ip_google_access = "true"
}
# Private Subnet
# https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html
resource "google_compute_subnetwork" "private_nat" {
  name                     = "${var.private_name}-${count.index}"
  ip_cidr_range            = cidrsubnet(var.private_subnet_cidr, 2, count.index)
  region                   = var.region
  count                    = var.custom_count != "" ? var.custom_count : length(data.google_compute_zones.available.names)
  network                  = var.network_name
  private_ip_google_access = "true"
}

##Nat-Gateway

# Cloud Router
# https://www.terraform.io/docs/providers/google/r/compute_router.html
resource "google_compute_router" "router" {
  name    = var.router_name
  network = var.network_name
  bgp {
    asn            = 64514
    advertise_mode = "CUSTOM"
  }
}

# NAT Gateway
# https://www.terraform.io/docs/providers/google/r/compute_router_nat.html
resource "google_compute_router_nat" "nat" {
  name                               = var.nat_name
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  dynamic "subnetwork" {
    for_each = google_compute_subnetwork.private_nat
    content {
      name                    = subnetwork.value.name
      source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
    }
  }
}