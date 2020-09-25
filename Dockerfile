FROM odoo:11.0
USER root
RUN python3 -m pip install wdb
RUN python3 -m pip install simplejson
RUN python3 -m pip install python-gitlab
RUN python3 -m pip install markdownify
RUN python3 -m pip install requests-toolbelt
RUN python3 -m pip install bigbluebutton-api-python
USER odoo
