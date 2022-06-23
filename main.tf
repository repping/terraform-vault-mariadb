resource "vault_mount" "mariadb" {
  path = "mariadb"
  type = "database"
}

resource "vault_database_secret_backend_connection" "mariadb" {
  backend       = vault_mount.mariadb.path
  name          = "mariadb"
  allowed_roles = ["test"]

  mysql {
    connection_url = var.mariadb_connection_url
    username       = var.mariadb_username
    password       = var.mariadb_password
  }
}

resource "vault_database_secret_backend_role" "role" {
  backend             = vault_mount.mariadb.path
  name                = "test"
  db_name             = vault_database_secret_backend_connection.mariadb.name
  creation_statements = ["CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT SELECT ON *.* TO '{{name}}'@'%';"]
  default_ttl         = 3600
  max_ttl             = 36000
}