FROM alpine:3.6

COPY bump-semver.sh /usr/local/bin/
COPY bump-git-semver.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/bump-semver.sh /usr/local/bin/bump-git-semver.sh
RUN apk add --no-cache bash ca-certificates curl jq git