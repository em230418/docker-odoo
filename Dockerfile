FROM odoo:13.0
USER root
RUN python3 -m pip install wdb
RUN python3 -m pip install mysqlclient
USER odoo
