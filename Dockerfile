FROM docker:26.0.1-dind AS builder

ENV TZ=Europe/Moscow

RUN apk --update --no-cache add wget vim bash curl
WORKDIR /opt
RUN mkdir sources
RUN  git clone https://github.com/docker/docker-bench-security.git ./docker-bench-security
RUN chmod 0766 /opt/docker-bench-security/docker-bench-security.sh

RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin latest
RUN curl  -sSfL https://raw.githubusercontent.com/trufflesecurity/trufflehog/main/scripts/install.sh | sh -s -- -b /usr/local/bin

