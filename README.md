# module: Vault - MariaDB

## Terraform registry
This modules is available on the Terraform registry:  
https://registry.terraform.io/modules/repping/mariadb/vault/latest


## Variables
|inputs|
|-|
|mariadb_connection_url|
|mariadb_password|
|mariadb_username|
|vault_addr|
|vault_token|

## Usage
Declare the input variables.

_Example:_
```hcl
module "vault-mariadb" {
  source = "../../"

  mariadb_connection_url   = "{{username}}:{{password}}@tcp(localhost:3306)/"
  mariadb_password         = "admin_password"
  mariadb_username         = "admin"
  vault_addr               = "http://localhost:8200"
  vault_token              = "hvs-13r2rg254y2th"
}
```