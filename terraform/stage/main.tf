
provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}



module "app" {
  source           = "../modules/app"
  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path
  app_disk_image   = var.app_disk_image
  subnet_id        = var.subnet_id
  app_count        = var.app_count
  platform_id      = var.platform_id
  environment      = var.environment
  db_ip            = module.db.external_ip_address_db.0
}

module "db" {
  source           = "../modules/db"
  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path
  db_disk_image    = var.db_disk_image
  subnet_id        = var.subnet_id
  app_count        = var.app_count
  platform_id      = var.platform_id
  environment      = var.environment
}
