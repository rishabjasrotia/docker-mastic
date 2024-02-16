## Mautic Docker

## How To

```
docker compose up -d
```


## Open SSL Cert Creation

```
cd iac/docker/cert

# Use openssl to create cer and key files
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout key/mautic-test.key -out crt/mautic-test.crt -config mautic-test.conf -passin pass:demo

# Alternatively, create a CSR file if you have your own authority with a command as follows:
sudo openssl req -out mautic-test.csr -newkey rsa:4096 -nodes -config mautic-test.conf 

# Export a pfx that you can import / trust
sudo openssl pkcs12 -export -out mautic-test.pfx -inkey key/mautic-test.key -in crt/mautic-test.crt
```