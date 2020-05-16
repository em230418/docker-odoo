FROM odoo:12.0
USER root
RUN python3 -m pip install wdb
RUN python3 -m pip install boto3
USER odoo
