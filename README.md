## Tugboat: an nginx proxy for mapping domains to containers
---

#### Certificate Installation
---

Allows tugboat to serve HTTPS traffic and be trusted by the browser

1. Open 'Keychain Access' (Application > Utilities > Keychain Access)
2. On the left, select 'System' from Keychains, select 'Certificates' from Category
3. Select File > Import Items, choose `./certs/ca.pem`
4. Enter password whenever prompted
5. 'Behance Dev' should now be in the list of certificates. Double click it to open a properties panel
6. Expand the 'Trust' section, change the 'When using this certificate' dropdown to say 'Always Trust'
7. Close properties panel, which will save that selection
8. Firefox does *not* use these certificates, so it has to be added manually.
  - Firefox > Preferences > Advanced > View Certificates > Import > `./certs/ca.pem`

