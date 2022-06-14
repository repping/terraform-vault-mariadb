module "vault-mariadb" {
  source = "../../../"

  vault_addr = "http://${vault.public_ip}:${vault.vault_port}"
  mariadb_addr =  "{{username}}:{{password}}@tcp(${mariadb.address}:3306)/"
  mariadb_username = var.username
  mariadb_password = var.password
  vault_token = "hvs.9I7-123token321-imtm"
}