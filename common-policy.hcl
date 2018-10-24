path "auth/token/lookup-self" {
    capabilities = [ "read" ]
}

path "sys/capabilities-self" {
    capabilities = [ "update" ]
}

path "sys/mounts" {
    capabilities = [ "read" ]
}

path "sys/auth" {
    capabilities = [ "read" ]
}

path "auth/token/accessors" {
    capabilities = [ "sudo", "list" ]
}

path "auth/token/lookup-accessor/*" {
    capabilities = [ "read" ]
}

path "secret/*" {
  capabilities = ["list"]
}