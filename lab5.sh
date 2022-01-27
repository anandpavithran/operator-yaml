#!/bin/bash

##################
#RUN AS ROOT USER
##################
echo Enter your name:
read var1
oc login -u admin -p redhat https://api.ocp4.example.com:6443
oc new-project weboperator-$var1
cd /root/web/deploy/
oc create -f /root/web/deploy/service_account.yaml
oc adm policy add-cluster-role-to-user cluster-admin -z web
oc create -f /root/web/deploy/crds/web.operator.io_webs_crd.yaml
oc create -f /root/web/deploy/operator.yaml

