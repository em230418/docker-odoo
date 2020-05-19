FROM odoo:13.0
USER root
RUN python3 -m pip install wdb
RUN apt-get update && apt-get install python3-dev default-libmysqlclient-dev build-essential -y
RUN python3 -m pip install mysqlclient
USER odoo
