# module: Vault - MariaDB

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


<!-- ## (old) Usage
1.  Download mariadb-client and jq where you plan to connect from
```
sudo apt update; sudo apt install mariadb-client jq
```

2. a - Read the Vault API endpoint for the database creds you created:
```
curl --header "X-Vault-Token: hvs.SVL0G27gK2XzeMKBQNHz1FLX" --request GET http://10.0.0.52:8200/v1/mariadb/creds/test | jq
```

2. b - *OR* directly from the CLI on the Vault server itself:
```
vault read database/creds/my-role
```

3. Access MariaDB from the host mentioned in step 1 and use the credentials from step 2
```
mariadb -h tf-simple-mariadb.cg1o0c6lya4c.eu-west-1.rds.amazonaws.com -u v-root-test-bbTSjeQwMAHg87nGgG51 -p

Enter password: ************

  Welcome to the MariaDB monitor.  Commands end with ; or \g.
  Your MariaDB connection id is 30
  Server version: 10.6.7-MariaDB managed by https://aws.amazon.com/rds/

MariaDB [(none)]> 
```
4. _optional_: Check the priviledges for the MariaDB user:
```
MariaDB [(none)]> SHOW GRANTS FOR CURRENT_USER();
  +----------------------------------------------------------------------------------------------------------------------------------+
  | Grants for v-root-test-DroGFdwPvYa7yp96KfKG@%                                                                                    |
  +----------------------------------------------------------------------------------------------------------------------------------+
  | GRANT SELECT ON *.* TO `v-root-test-DroGFdwPvYa7yp96KfKG`@`%` IDENTIFIED BY PASSWORD '*494F8B9307A3C0CFE776F30950C3D4E8EF88EA8C' |
  +----------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.000 sec)
```
5. Renew the lease beyond 1h and up to the max_ttl:
```
vault lease renew database/creds/readonly/$LEASE_ID
```

6. a - _optional_: Revoke the lease:
```
vault lease revoke mariadb/creds/test/$LEASE_ID
```
6. b - Or via the Vault API:
```
curl --header "X-Vault-Token: hvs.9I7u6J79CiEVvunMlVg8imtm" --request POST --data '{"lease_id": "mariadb/creds/test/PikMuhNLhVT0FKq6BYoo8pBj"}' http://10.0.0.52:8200/v1/sys/leases/revoke | jq
``` -->