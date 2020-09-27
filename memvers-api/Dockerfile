FROM node:11
MAINTAINER SPARCS Memvers Team <memvers@sparcs.org>

RUN apt-get update
RUN apt-get install -y git sudo vim ldap-utils
RUN mkdir -p /SPARCS/mail/aliases.d/
RUN git clone https://github.com/sparcs-kaist/memvers-api.git
WORKDIR /memvers-api
RUN npm install

# In prod server, it uses postgresql
RUN npm install mysql2
COPY ./local_config.js /memvers-api/config/local_config.js

COPY ./postfix.conf /postfix.conf
RUN debconf-set-selections /postfix.conf
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y postfix
RUN rm /postfix.conf
RUN sed -i 's/smtpd_use_tls=yes/smtpd_use_tls=no/g' /etc/postfix/main.cf
RUN echo 'luser_relay = root@localhost' >> /etc/postfix/main.cf
RUN echo 'local_recipient_maps =' >> /etc/postfix/main.cf

CMD /bin/bash
