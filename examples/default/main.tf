module "vault-mariadb" {
  source = "../../"
  
  mariadb_connection_url = "{{username}}:{{password}}@tcp(mariadb:3306)/"
  mariadb_password       = "root_password"
  mariadb_username       = "root"
  vault_addr             = "http://vault:8200"
  vault_token            = "dev_root_token"
}