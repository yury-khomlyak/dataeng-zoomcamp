#!/usr/bin/env bash

gcloud config set project $GOOGLE_PROJECT_ID
gcloud auth login --cred-file=$GOOGLE_APPLICATION_CREDENTIALS

terraform -chdir=terraform apply -auto-approve
