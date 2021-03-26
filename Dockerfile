FROM odoo:10.0
USER root
RUN python -m pip install wdb
RUN apt-get update && apt-get install -y python-braintree python-zeep
USER odoo
