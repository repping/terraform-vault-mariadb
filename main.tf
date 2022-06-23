resource "vault_mount" "mariadb" {
  path = "mariadb"
  type = "database"
}

resource "vault_database_secret_backend_connection" "mariadb" {
  allowed_roles = ["test"]
  backend       = vault_mount.mariadb.path
  name          = "mariadb"

  mysql {
    connection_url = var.mariadb_connection_url
    password       = var.mariadb_password
    username       = var.mariadb_username
  }
}

resource "vault_database_secret_backend_role" "role" {
  backend             = vault_mount.mariadb.path
  creation_statements = ["CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT SELECT ON *.* TO '{{name}}'@'%';"]
  db_name             = vault_database_secret_backend_connection.mariadb.name
  default_ttl         = 3600
  max_ttl             = 36000
  name                = "test"
}