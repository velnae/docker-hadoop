FROM velnae28/hadoop-base:1.0-hadoop3.4-java11

LABEL authors.contact01="Emerson NV <velnae.28@gmail.com" \
authors.contact02="Ivan Ermilov <ivan.s.ermilov@gmail.com"

COPY WordCount.jar /opt/hadoop/applications/WordCount.jar

ENV JAR_FILEPATH="/opt/hadoop/applications/WordCount.jar"
ENV CLASS_TO_RUN="WordCount"
ENV PARAMS="/input /output"

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
