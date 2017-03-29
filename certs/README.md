#### Generate root CA
---

# Prereq:
Run this from a real Linux distribution. The version of openssl compiled against OS X is a bit ... weird. Recomendation is to either run these commands inside of a Docker container or a Vagrant VM.

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
# Note you will be required to press enter several times
# When prompted for a password type 'password'

cd certs/

make regenerate-dev0
```

#### Generate wildcard *.pro2.dev0.be.lan certificate
---

IMPORTANT: common name must be set to *.pro2.dev0.be.lan
```
# Note you will be required to press enter several times
# When prompted for a password type 'password'

cd certs/

make regenerate-pro2
```

IMPORTANT: common name must be set to *.net.dev0.be.lan
```
# Note you will be required to press enter several times
# When prompted for a password type 'password'

cd certs/

make regenerate-net
```


# FAQ

# Example of output you will see when regenerating:

```
[vagrant@hyena certs]$ make regenerate-pro2
Generating a 2048 bit RSA private key
.....+++
................................................................................................................................+++
writing new private key to 'pro2.dev0.be.lan.key'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [US]:
State or Province Name (full name) [New York]:
Locality Name (eg, city) [New York]:
Organization Name (eg, company) [Behance]:
Organizational Unit Name (eg, section) [Behance]:
Common Name (eg, your name or your server's hostname) [pro2.dev0.be.lan]:
Email Address []:

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password [password]:
An optional company name []:
Using configuration from ca_signing_openssl.cnf
Enter pass phrase for ca.key:
Check that the request matches the signature
Signature ok
Certificate Details:
        Serial Number:
            96:00:7d:f2:8f:d2:9b:3c
        Validity
            Not Before: Mar 26 07:54:48 2017 GMT
            Not After : Mar 24 07:54:48 2027 GMT
        Subject:
            countryName               = US
            stateOrProvinceName       = New York
            organizationName          = Behance
            organizationalUnitName    = Behance
            commonName                = pro2.dev0.be.lan
        X509v3 extensions:
            X509v3 Basic Constraints:
                CA:FALSE
            Netscape Cert Type:
                SSL Server
            Netscape Comment:
                OpenSSL Generated Server Certificate
            X509v3 Subject Key Identifier:
                4B:3E:67:AD:67:25:4A:A7:AC:B3:B5:60:5B:55:37:61:BA:DB:3C:CA
            X509v3 Authority Key Identifier:
                keyid:3D:DB:71:A0:D2:B8:A8:07:B7:3C:F4:C7:A1:86:F0:64:8E:AA:CF:A8
                DirName:/C=US/ST=New York/L=New York/O=Behance/OU=Dev/CN=Behance Dev/emailAddress=none@none.com
                serial:C8:F1:C9:C3:35:EB:5E:0A

            X509v3 Key Usage: critical
                Digital Signature, Key Encipherment
            X509v3 Extended Key Usage:
                TLS Web Server Authentication
            X509v3 Subject Alternative Name:
                DNS:pro2.dev0.be.lan, DNS:*.pro2.dev0.be.lan
Certificate is to be certified until Mar 24 07:54:48 2027 GMT (3650 days)
Sign the certificate? [y/n]:y


1 out of 1 certificate requests certified, commit? [y/n]y
Write out database with 1 new entries
Data Base Updated
make[1]: Entering directory '/home/vagrant/dev/tugboat/certs'
 View pro2.dev0.be.lan.csr:
verify OK
Certificate Request:
    Data:
        Version: 0 (0x0)
        Subject: C=US, ST=New York, L=New York, O=Behance, OU=Behance, CN=pro2.dev0.be.lan
        Subject Public Key Info:
```


# Guides:
- https://gist.github.com/Soarez/9688998
- http://stackoverflow.com/questions/21488845/how-can-i-generate-a-self-signed-certificate-with-subjectaltname-using-openssl
- http://stackoverflow.com/questions/21489525/is-a-wildcard-san-certificate-possible
- http://stackoverflow.com/questions/10175812/how-to-create-a-self-signed-certificate-with-openssl/27931596#27931596
- https://jamielinux.com/docs/openssl-certificate-authority/create-the-root-pair.html
