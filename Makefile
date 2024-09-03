ifneq (,$(wildcard .env))
    include .env
    export
endif

build:
	docker build -t velnae28/hadoop-base:${VERSION} ./base
	docker build -t velnae28/hadoop-namenode:${VERSION} ./namenode
	docker build -t velnae28/hadoop-datanode:${VERSION} ./datanode
	docker build -t velnae28/hadoop-resourcemanager:${VERSION} ./resourcemanager
	docker build -t velnae28/hadoop-nodemanager:${VERSION} ./nodemanager
	docker build -t velnae28/hadoop-historyserver:${VERSION} ./historyserver
	docker build -t velnae28/hadoop-submit:${VERSION} ./submit

push:
	docker push velnae28/hadoop-base:${VERSION}
	docker push velnae28/hadoop-namenode:${VERSION}
	docker push velnae28/hadoop-datanode:${VERSION}
	docker push velnae28/hadoop-resourcemanager:${VERSION}
	docker push velnae28/hadoop-nodemanager:${VERSION}
	docker push velnae28/hadoop-historyserver:${VERSION}
			docker push velnae28/hadoop-submit:${VERSION}

run:
	docker network create docker-hadoop || true
	docker compose up ${params} --remove-orphans
	@echo 'Running docker-hadoop'

stop:
	docker compose down
	@echo 'Stopping docker-hadoop'

down:
	docker compose down
	@echo 'Downing docker-hadoop'

wordcount:
	docker build -t hadoop-wordcount ./submit
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} velnae28/hadoop-base:${VERSION} hdfs dfs -mkdir -p /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} velnae28/hadoop-base:${VERSION} hdfs dfs -copyFromLocal -f /opt/hadoop-3.2.1/README.txt /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-wordcount
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} velnae28/hadoop-base:${VERSION} hdfs dfs -cat /output/*
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} velnae28/hadoop-base:${VERSION} hdfs dfs -rm -r /output
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} velnae28/hadoop-base:${VERSION}	 hdfs dfs -rm -r /input
