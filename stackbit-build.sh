#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST __STACKBIT_WEBHOOK_URL__/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=__STACKBIT_PULL_API_URL__
curl -s -X POST __STACKBIT_WEBHOOK_URL__/ssgbuild > /dev/null
gatsby build
curl -s -X POST __STACKBIT_WEBHOOK_URL__/publish > /dev/null
