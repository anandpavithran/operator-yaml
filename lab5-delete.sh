#!/bin/bash

##################
#RUN AS ROOT USER
##################
echo Enter project name:
read var1
oc login -u admin -p redhat https://api.ocp4.example.com:6443
oc project $var1
oc delete crd webs.web.operator.io
oc delete project $var1 
oc delete project example-web
oc adm policy remove-cluster-role-from-user cluster-admin -z web
