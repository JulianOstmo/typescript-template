#!/bin/bash -i

shopt -s expand_aliases

if [[ $1 == "audit" ]]; then
    docker run -it --rm -v ${INIT_CWD}:/code ibmcom/detect-secrets:latest audit .secrets.baseline
elif [[ $1 == "exclude" ]]; then
    docker run --rm -v ${INIT_CWD}:/code ibmcom/detect-secrets:latest scan --update .secrets.baseline --exclude-files
elif [[ $1 == "update-baseline" ]]; then
    docker run --rm -v ${INIT_CWD}:/code ibmcom/detect-secrets:latest scan --update .secrets.baseline
else
    docker run --rm -v ${INIT_CWD}:/code ibmcom/detect-secrets-hook:latest --baseline .secrets.baseline
fi
