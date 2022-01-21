FROM node:16-alpine3.15
RUN apk update && apk add git
RUN npm install -g semantic-release@19 \
  @semantic-release/commit-analyzer@9 \
  @semantic-release/release-notes-generator@10 \
  @semantic-release/github@8 \
  @semantic-release/npm@9 \
  @semantic-release/exec@6 \
  @semantic-release/changelog@6 \
  @semantic-release/git@10 \
  @semantic-release/gitlab@7
RUN apk add --update make \
  && rm -rf /var/cache/apk/*
COPY *.sh /
RUN chmod +x /main.sh