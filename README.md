# docker-odoo
# SaaS Demo deploy instruction

```
git clone -b 12.0-saas --single-branch https://github.com/em230418/docker-odoo.git saas_odoo
cd saas_odoo
mkdir vendor
mkdir -p vendor/it-projects-llc
mkdir -p vendor/OCA
mkdir -p vendor/Openworx

cd vendor/OCA
git clone -b 12.0 https://github.com/OCA/server-auth.git --single-branch
git clone -b 12.0 https://github.com/OCA/web.git --single-branch
git clone -b 12.0 https://github.com/OCA/queue.git --single-branch
cd ../..

cd vendor/Openworx
git clone -b 12.0 https://github.com/Openworx/backend_theme.git --single-branch
cd ../..

cd vendor/it-projects-llc
git clone -b 12.0 https://github.com/itpp-labs/access-addons.git
git clone -b 12.0-saas_expiration https://github.com/em230418/saas-addons.git

cd saas-addons
git remote add vildan https://github.com/Enigma228322/saas-addons.git
git fetch vildan 12.0-saas_apps
git checkout vildan/12.0-saas_apps saas_apps
git reset saas_apps
cd ..

cd ../..

docker-compose up odoo
```

wait for installing, then press Ctrl+C in terminal and again:

```
docker-compose up odoo
```

- Go to http://saas.127.0.0.1.nip.io/web/login?debug=1
- admin:admin
- Main menu -> Settings -> Technical -> Outgoing email servers
- - SMTP Server: smtpfake
- - Description: anything
- - SMTP Port: 1025
- - Save
- Logout or do everything else in Private Browsing (Incognito in Chromium-based) or in other browser

- In other window go to http://saas.127.0.0.1.nip.io/price
