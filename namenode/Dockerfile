FROM velnae28/hadoop-base:1.0-hadoop3.4-java11

LABEL authors.contact01="Emerson NV <velnae.28@gmail.com" \
authors.contact02="Ivan Ermilov <ivan.s.ermilov@gmail.com"

HEALTHCHECK CMD curl -f http://localhost:9870/ || exit 1

ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name
RUN mkdir -p /hadoop/dfs/name
#VOLUME /hadoop/dfs/name

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 9870

CMD ["/run.sh"]
