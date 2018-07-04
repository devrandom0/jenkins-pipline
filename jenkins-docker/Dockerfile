FROM jenkins/jenkins

USER root
RUN \
        curl https://download.docker.com/linux/static/stable/x86_64/docker-18.03.1-ce.tgz --output docker-18.03.1-ce.tgz && \
        tar xzvf docker-18.03.1-ce.tgz && \
        mv docker/docker /usr/local/bin/ && \
        rm docker-18.03.1-ce.tgz

EXPOSE 8080 50000
