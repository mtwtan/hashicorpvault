# Installing HashiCorp Vault with Docker

## Installing Vault with Consul backend using Docker-compose

### Pre-Requisites
- Assume that a host with Docker has been installed.
- Assume that NGINX has been installed on the host.
- Assume that docker-compose has been installed

### Some assumptions
- The mounted locations are in /mnt/docker/consul and /mnt/docker/vault for Consul and Vault respectively.
- The location of the external volumes can be changed as desired.

### Installing with docker-compose
- Inside the same directory folder where the docker-compose.yml file is located
- Ensure that the env.sh file is in the same folder and the LOCAL_IP variable has the IP address of the host
```
$ source env.sh
$ docker-compose up -d
```

### Configure NGINX
- Copy the vault.conf to /etc/nginx/conf.d
- Edit the vault.conf to include the location of the relevant SSL/TLS cert and key location
- Restart NGINX

