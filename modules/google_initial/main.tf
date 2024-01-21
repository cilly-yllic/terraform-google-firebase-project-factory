module "google_project_service" {
  source   = "./google_project_service"
  project  = var.project
  services = var.api_services
}

module "google_firebase_project" {
  source     = "./google_firebase_project"
  project    = var.project
  region     = var.region
  depends_on = [module.google_project_service]
}