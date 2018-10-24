ldap_url=""
user_dn="" ### Example: ou=users,dc=example,dc=com
group_dn="" ### Example: ou=groups,dc=example,dc=com
bind_dn="" ### Example: cn=binduser,cn=users,dc=example,dc=com
#
# Enable LDAP
vault auth enable ldap

# Set the LDAP config
vault write auth/ldap/config \
    url="$ldap_url" \
    userdn="$user_dn" \
    userattr=sAMAccountName \
    groupdn="$group_dn" \
    groupfilter="(&(objectClass=group)(member:1.2.840.113556.1.4.1941:={{.UserDN}}))" \
    groupattr="cn" \
    binddn="$bind_dn" \
    bindpass='<Enter Password here>' \
    certificate=@<File and location of CA Cert> \
    insecure_tls=false \
    starttls=true

# Set the common policy based on the common-policy HCL file
vault policy write common-policy ./common-policy.hcl

# Set the admin policy based on the admin-policy HCL file
vault policy write admin-policy ./admin-policy.hcl

# Apply the two policies to the vault_admin group (vault_admin group is an arbitrary security group in LDAP; this group can be anything created in LDAP)
vault write auth/ldap/groups/vault_admin policies=common-policy
vault write auth/ldap/groups/vault_admin policies=admin-policy