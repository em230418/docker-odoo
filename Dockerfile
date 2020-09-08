FROM odoo:11.0
USER root
RUN python3 -m pip install wdb
RUN python3 -m pip install simplejson
RUN python3 -m pip install paramiko
RUN python3 -m pip install oauthlib
RUN python3 -m pip install acme-tiny
RUN python3 -m pip install IPy
USER odoo
