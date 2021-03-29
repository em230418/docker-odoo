FROM itprojectsllc/odoo-docker:9.0
USER root
RUN python -m pip install wdb jedi==0.17.2
USER odoo
