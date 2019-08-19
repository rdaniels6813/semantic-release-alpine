FROM node:lts-alpine
RUN apk update && apk add git
RUN npm install -g semantic-release@15.13.18 \
    @semantic-release/commit-analyzer@6.2.0 \
    @semantic-release/release-notes-generator@7.2.1 \
    @semantic-release/github@5.4.2 \
    @semantic-release/npm@5.1.13 \
    @semantic-release/exec@3.3.5 \
    @semantic-release/changelog@3.0.4 \
    @semantic-release/git@7.0.16 \
    # Using my fork since they haven't merged my PR for better handling of assets in gitlab
    rdaniels6813/gitlab#master
RUN apk add --update make \
  && rm -rf /var/cache/apk/*