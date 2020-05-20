```
git clone -b 12.0-ira https://github.com/em230418/docker-odoo.git ira-12
cd ira-12

cd vendor/it-projects-llc
git clone https://github.com/em230418/misc-addons.git -b 12.0-ir_attachment_s3-fix
cd ../..

dcu odoo
```
