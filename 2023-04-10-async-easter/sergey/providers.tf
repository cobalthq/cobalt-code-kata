terraform {
  backend "gcs" {
    bucket  = "sergey-personal-use"
    prefix  = "terraform/state"
  }
}

provider "google" {
  project = var.project
  region  = var.region
}
