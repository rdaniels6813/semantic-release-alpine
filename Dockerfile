FROM node:lts-alpine
RUN apk update && apk add git
RUN npm install -g semantic-release@17.1.1 \
  @semantic-release/commit-analyzer@8.0.1 \
  @semantic-release/release-notes-generator@9.0.1 \
  @semantic-release/github@7.0.7 \
  @semantic-release/npm@7.0.5 \
  @semantic-release/exec@5.0.0 \
  @semantic-release/changelog@5.0.1 \
  @semantic-release/git@9.0.0 \
  @semantic-release/gitlab@6.0.4
RUN apk add --update make \
  && rm -rf /var/cache/apk/*
COPY *.sh /
RUN chmod +x /main.sh