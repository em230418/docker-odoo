FROM odoo:14.0
USER root
RUN python3 -m pip install wdb
RUN apt-get update && apt-get install -y build-essential libssl-dev libffi-dev python3-dev cargo
RUN python3 -m pip install docusign_esign
RUN python3 -m pip install dateparser
USER odoo
