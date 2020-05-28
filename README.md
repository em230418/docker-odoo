# docker-odoo
# SaaS Demo deploy instruction

```
git clone -b 13.0-saas_production --single-branch https://github.com/em230418/docker-odoo.git saas_odoo
cd saas_odoo
mkdir vendor
mkdir -p vendor/it-projects-llc
mkdir -p vendor/OCA

cd vendor/OCA
git clone -b 13.0-auth_signup_verify_email_port https://github.com/em230418/server-auth.git --single-branch
git clone -b 13.0 https://github.com/OCA/web.git --single-branch
git clone -b patch-1 https://github.com/em230418/queue.git --single-branch
git clone -b 13.0-mig-contract https://github.com/devCbssolutionsRo/contract.git --single-branch
cd ../..

cd vendor/it-projects-llc
git clone -b 13.0 https://github.com/itpp-labs/access-addons.git
git clone -b 13.0-saas_apps_signup https://github.com/em230418/saas-addons.git
cd ../..

docker-compose up odoo
```

wait for installing, then press Ctrl+C in terminal and again:

```
docker-compose up odoo
```

- Go to `/web/login?debug=1`
- admin:admin
- Main menu -> Settings -> Technical -> Outgoing email servers
- - SMTP Server: smtpfake
- - Description: anything
- - SMTP Port: 1025
- - Save
- In `/web#id=1&model=saas.operator&view_type=form` press `Edit`
- - DB URLs. Probably http://{db_name}.mydomain.com
- - Master URL. Probably http://saas.mydomain.com
- - If you are using nip.io service - press Discard
- - Else - press Save
- Main menu -> Settings -> General settings -> Customer Account -> Free sign up -> Save
- Main menu -> website -> configurations -> manage apps -> Refresh
- Logout or do everything else in Private Browsing (Incognito in Chromium-based) or in other browser

- In other window go to `/price` page
