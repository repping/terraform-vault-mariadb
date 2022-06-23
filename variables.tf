variable "mariadb_connection_url" {
  description = "Address of the MariaDB database to connect to."
  type        = string

  validation {
    condition     = length(var.mariadb_connection_url) != 0
    error_message = "Please specify the address of the MariaDB RDS instance to connect to."
  }
}
variable "mariadb_username" {
  description = "Username to use to connect to the MariaDB RDS instance."
  type        = string
  default     = "root"

  validation {
    condition     = length(var.mariadb_username) != 0
    error_message = "Please specify the username to connect to MariaDB."
  }
}
variable "mariadb_password" {
  description = "Password to use to connect to the MariaDB RDS instance."
  type        = string

  validation {
    condition     = length(var.mariadb_password) != 0
    error_message = "Please specifiy the password to connect to MariaDB."
  }
}
variable "vault_addr" {
  description = "Address of the Vault instance to connect to."
  type        = string

  validation {
    condition     = length(var.vault_addr) != 0
    error_message = "Please specify the address of the Vault instance to connect to."
  }
}
variable "vault_token" {
  description = "Token to use to connect to Vault and configure the dynamic secrets engine."
  type        = string

  validation {
    condition     = length(var.vault_token) != 0
    error_message = "Please specify a token to use to connect to Vault."
  }
}