FROM odoo:10.0
USER root
RUN python -m pip install wdb
RUN python -m pip install six==1.10.0
USER odoo
