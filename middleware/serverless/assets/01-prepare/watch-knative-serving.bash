#!/usr/bin/env bash
while : ;
do
  output=`oc get knativeserving.operator.knative.dev/knative-serving -n knative-serving --template='{{range .status.conditions}}{{printf "%s=%s\n" .type .status}}{{end}}'`
  echo $output
  if [ -z "${output##*'Ready=True'*}" ] ; then break; fi;
  sleep 10
done