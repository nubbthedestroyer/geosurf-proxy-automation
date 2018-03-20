FROM debian:8

ADD install-deps.sh .
ADD loop.sh .

RUN chmod +x *.sh

RUN ./install-deps.sh

ADD etc/sarg/* /etc/sarg/
ADD etc/squid/* /etc/squid/
ADD etc/squid3/* /etc/squid3/

CMD ./loop.sh