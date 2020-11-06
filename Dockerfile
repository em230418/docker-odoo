FROM odoo:10.0
USER root
RUN python -m pip install wdb
USER odoo
