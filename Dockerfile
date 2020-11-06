FROM odoo:13.0
USER root
RUN python3 -m pip install wdb
RUN python3 -m pip install websocket-client
#RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
#    && echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list \
#    && apt-get -qq update && apt-get -qq install -y --no-install-recommends google-chrome-stable > /dev/null
RUN apt-get -qq update && apt-get install -y chromium
USER odoo
