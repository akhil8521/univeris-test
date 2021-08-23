provider "google" {
  credentials = file("./univeris01.json")
  project     = "univeris01"
  region      = "us-west2"
}

module "vpc" {
  source       = "./modules/vpc"
  network_name = var.network_name
}

module "subnets" {
  source                = "./modules/subnets"
  public_name           = var.public_name
  private_name          = var.private_name
  protected_name        = var.protected_name
  public_subnet_cidr    = var.public_subnet_cidr
  private_subnet_cidr   = var.private_subnet_cidr
  protected_subnet_cidr = var.protected_subnet_cidr
  custom_count          = var.custom_count
  network_name          = var.network_name
  region                = var.region
  router_name           = var.router_name
  nat_name              = var.nat_name
}
