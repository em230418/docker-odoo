# docker-odoo
# SaaS Demo deploy instruction

```
git clone -b 12.0-saas --single-branch https://github.com/em230418/docker-odoo.git saas_odoo
cd saas_odoo
mkdir vendor
mkdir -p vendor/it-projects-llc
mkdir -p vendor/OCA
mkdir -P vendor/Openworx

cd vendor/OCA
git clone -b 12.0 https://github.com/OCA/server-auth.git
git clone -b 12.0 https://github.com/OCA/web.git
git clone -b 12.0 https://github.com/OCA/queue.git
cd ../..

cd vendor/Openworx
git clone -b 12.0 https://github.com/Openworx/backend_theme.git
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

Go to http://saas.127.0.0.1.nip.io/
