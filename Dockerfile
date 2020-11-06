FROM odoo:14.0
USER root
RUN python3 -m pip install wdb
RUN python3 -m pip install websocket-client
RUN apt-get -qq update && apt-get install -y chromium
USER odoo
