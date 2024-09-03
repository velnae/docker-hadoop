FROM velnae28/hadoop-base:1.0-hadoop3.4-java11

LABEL authors.contact01="Emerson NV <velnae.28@gmail.com" \
authors.contact02="Ivan Ermilov <ivan.s.ermilov@gmail.com"

HEALTHCHECK CMD curl -f http://localhost:9864/ || exit 1

ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data
RUN mkdir -p /hadoop/dfs/data
VOLUME /hadoop/dfs/data

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 9864

CMD ["/run.sh"]
