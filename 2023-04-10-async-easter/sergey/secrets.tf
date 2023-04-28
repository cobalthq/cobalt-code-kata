resource "google_secret_manager_secret" "personal" {
  secret_id = var.secret_name

  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "personal" {
  secret      = google_secret_manager_secret.personal.id
  secret_data = var.environment
}
