#!/bin/bash

CLUSTER_NAME=${1:-default}

echo "Starting the configuration of the OTHER cluster '${CLUSTER_NAME}'"

oc new-project hybrid-cloud-demo
oc apply -f openshift/quarkus-backend.yml -n hybrid-cloud-demo
oc set env deployment/hybrid-cloud-backend WORKER_CLOUD_ID=${CLUSTER_NAME} -n hybrid-cloud-demo
oc annotate service hybrid-cloud-backend skupper.io/proxy=http -n hybrid-cloud-demo

skupper init -n hybrid-cloud-demo
skupper connect token.yaml -n hybrid-cloud-demo

echo "The OTHER cluster '${CLUSTER_NAME}' configured"
