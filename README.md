# docker-odoo

Для создания новой базы:

```
docker-compose run --rm odoo -d mr1_2021_03_03 -i sye_base,sye_contacts,sye_crm,sye_sync_kis,sye_dadata --load-language=ru_RU --stop-after-init
```

где mr1_2021_03_03 - это название базы
