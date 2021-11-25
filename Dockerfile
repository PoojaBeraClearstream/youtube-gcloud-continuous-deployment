# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM ubuntu:18.04

RUN apt-get update && \
    apt-get -y install curl \
    iputils-ping \
    tar \
    jq \
    python

ARG GH_RUNNER_VERSION="2.263.0"
WORKDIR /runner
RUN curl -o actions.tar.gz --location "https://github.com/actions/runner/releases/download/v${GH_RUNNER_VERSION}/actions-runner-linux-x64-${GH_RUNNER_VERSION}.tar.gz" && \
    tar -zxf actions.tar.gz && \
    rm -f actions.tar.gz && \
    ./bin/installdependencies.sh

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
#ENTRYPOINT ["/bin/bash]
#ENTRYPOINT ["./entrypoint.sh"]

CMD ["/entrypoint.sh"]
#CMD ["./bin/Runner.Listener", "run", "--startuptype", "service"]