#!/bin/bash -i

shopt -s expand_aliases
if [[ -z ${INIT_CWD} ]]; then
    INIT_CWD=$(pwd)
fi

if [[ $1 == "audit" ]]; then
    docker run -it --rm -v ${INIT_CWD}:/code icr.io/git-defenders/detect-secrets:redhat-ubi audit --report --fail-on-unaudited --fail-on-live --fail-on-audited-real .secrets.baseline
elif [[ $1 == "exclude" ]]; then
    docker run --rm -v ${INIT_CWD}:/code icr.io/git-defenders/detect-secrets:redhat-ubi scan --update .secrets.baseline --exclude-files $2
elif [[ $1 == "update-baseline" ]]; then
    docker run --rm -v ${INIT_CWD}:/code  icr.io/git-defenders/detect-secrets:redhat-ubi scan --update .secrets.baseline
else
    docker run --rm -v ${INIT_CWD}:/code icr.io/git-defenders/detect-secrets-hook:latest --baseline .secrets.baseline $@
fi
