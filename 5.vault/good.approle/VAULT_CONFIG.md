
# РЕШЕНИЕ ЧЕРЕЗ РОЛИ VAULT

# Политика test-policy.hcl выглядит так:
path "secrets/data/*" {
  capabilities = [ "read" ]
}

vault policy write jenkins test-policy.hcl

vault auth enable approle

# Роль выглядит примерно так:
vault write -tls-skip-verify auth/approle/role/test-role \
  token_policies="test-policy" \
  token_ttl=1h \
  token_max_ttl=4h \
  secret_id_bound_cidrs="0.0.0.0/0","127.0.0.1/32" \
  token_bound_cidrs="0.0.0.0/0","127.0.0.1/32" \
  secret_id_ttl=60m policies="test-policy" \
  bind_secret_id=false

# Соответственно, role-id получаю:
vault read -tls-skip-verify auth/approle/role/nginx-demo/role-id

# И получаю role secretid:
vault write -format=json -f auth/approle/role/test-role/secret-id > secretid.json

# Текст SECRET_ID в секретах Jenkins http://localhost:8080/manage/credentials/

