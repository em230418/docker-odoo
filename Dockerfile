FROM odoo:12.0
USER root
#RUN python3 -m pip install wdb
RUN python3 -m pip install python-telegram-bot==12.8 PyGithub py-trello
USER odoo
