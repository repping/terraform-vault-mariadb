module "vault-mariadb" {
  source = "../../"

  vault_addr       = var.vault_addr
  mariadb_addr     = var.mariadb_addr
  mariadb_username = var.mariadb_username
  mariadb_password = var.mariadb_password
  vault_token      = var.vault_token
}