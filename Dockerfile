# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM ubuntu:latest

RUN apt-get update && \
    apt-get -y install curl \
    iputils-ping \
    tar \
    jq \
    python

ARG GH_RUNNER_VERSION="2.278.0"
WORKDIR /runner
RUN curl -o actions.tar.gz --location "https://github.com/actions/runner/releases/download/v${GH_RUNNER_VERSION}/actions-runner-linux-x64-${GH_RUNNER_VERSION}.tar.gz" && \
    tar -zxf actions.tar.gz && \
    rm -f actions.tar.gz && \
    ./bin/installdependencies.sh

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh -p 80:8080 nginx
#ENTRYPOINT ["/bin/bash]
#ENTRYPOINT ["./entrypoint.sh"]
EXPOSE 8080
CMD ["/runner/entrypoint.sh"]
#CMD ["./bin/Runner.Listener", "run", "--startuptype", "service"]