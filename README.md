# docker-odoo
# SaaS Demo deploy instruction

```
git clone -b 13.0-saas_production --single-branch https://github.com/em230418/docker-odoo.git saas_odoo
cd saas_odoo
mkdir vendor
mkdir -p vendor/it-projects-llc
mkdir -p vendor/OCA

cd vendor/OCA
git clone -b 13.0 https://github.com/OCA/server-auth.git --single-branch
git clone -b 13.0 https://github.com/OCA/web.git --single-branch
git clone -b patch-1 https://github.com/em230418/queue.git --single-branch
git clone -b 13.0-mig-contract https://github.com/em230418/contract.git --single-branch
cd ../..

cd vendor/it-projects-llc
git clone -b 13.0 https://github.com/itpp-labs/access-addons.git
git clone -b 13.0-odoo_backup_sh-103 https://github.com/em230418/misc-addons.git
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
- Main menu -> Settings -> Invoicing -> Customer Payments -> Invoice online payments (on) -> Save
- Main menu -> website -> configurations -> manage apps -> Refresh
- Logout or do everything else in Private Browsing (Incognito in Chromium-based) or in other browser

- In other window go to `/price` page

# Setting alternative domain

For example, you have domain "mydomain.com" and your build name is "mybuild"

1. Open host2db.ini, add line "mydomain.com = mybuild" in "mappings" section, Save
2. Wait for 1 minute, until new changes will load
3. In front server (nginx, envoy) add domain to section with odoo cluster. For example like this in envoy.yaml:

```diff
diff --git a/envoy.yaml b/envoy.yaml
index ea4a6c6..4b1f2de 100644
--- a/envoy.yaml
+++ b/envoy.yaml
@@ -126,7 +126,7 @@ static_resources:
               routes:
               - match: {prefix: /}
                 route: {cluster: target_filebrowser}
-            - domains: [odoo.*, saas.em230418.new.it-projects.info, "*.saas.em230418.new.it-projects.info", "*.nip.io"]
+            - domains: [odoo.*, saas.em230418.new.it-projects.info, "*.saas.em230418.new.it-projects.info", "*.nip.io", mydomain.com]
               name: local_service
               routes:
               - match: {prefix: /longpolling/}
```