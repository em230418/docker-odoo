#!/bin/sh
docker-compose run --rm \
               odoo odoo \
               -d sye_test \
               -i sye_sync_kis \
               --log-handler=odoo.addons.sye_sync_kis:DEBUG \
               --test-enable --stop-after-init
