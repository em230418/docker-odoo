FROM odoo:13.0
USER root
#RUN python3 -m pip install wdb
RUN python3 -m pip install python-slugify
RUN python3 -m pip install email_validator
RUN python3 -m pip install boto3
RUN python3 -m pip install google-api-python-client
RUN python3 -m pip install pretty_bad_protocol
USER odoo
