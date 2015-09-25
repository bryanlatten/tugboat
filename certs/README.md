#### Generate root CA
---

IMPORTANT: must be done from openssl 1.01e+
```
openssl genrsa -out ca.key 2048 -aes-256-cbc
openssl genrsa -des3 -out ca.key 2048
openssl req -x509 -sha256 -newkey rsa:2048 -new -nodes -key ca.key -days 3650 -out ca.pem
```
#### Generate wildcard *.dev0.be.lan certificate
---

IMPORTANT: common name must be set to *.dev0.be.lan
```
openssl genrsa -out dev0.be.lan.key 2048 -aes-256-cbc
openssl req -newkey rsa:2048 -new -key dev0.be.lan.key -out dev0.be.lan.csr
openssl x509 -req -in dev0.be.lan.csr -CA ca.pem -CAkey ca.key -CAcreateserial -out dev0.be.lan.crt -days 3650
```

#### Generate wildcard *.pro2.dev0.be.lan certificate
---

IMPORTANT: common name must be set to *pro2.dev0.be.lan
```
openssl genrsa -out pro2.dev0.be.lan.key 2048 -aes-256-cbc
openssl req -newkey rsa:2048 -new -key pro2.dev0.be.lan.key -out pro2.dev0.be.lan.csr
openssl x509 -req -in pro2.dev0.be.lan.csr -CA ca.pem -CAkey ca.key -CAcreateserial -out pro2.dev0.be.lan.crt -days 3650
```
