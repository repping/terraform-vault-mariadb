module "vault-mariadb" {
  source = "../../"
# TODO geen vars maar de echte waarden
  mariadb_connection_url     = var.mariadb_connection_url
  mariadb_password = var.mariadb_password
  mariadb_username = var.mariadb_username
  vault_addr       = var.vault_addr
  vault_token      = var.vault_token
}