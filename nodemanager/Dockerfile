FROM velnae28/hadoop-base:1.0-hadoop3.4-java11

LABEL authors.contact01="Emerson NV <velnae.28@gmail.com" \
authors.contact02="Ivan Ermilov <ivan.s.ermilov@gmail.com"

HEALTHCHECK CMD curl -f http://localhost:8042/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8042

CMD ["/run.sh"]
