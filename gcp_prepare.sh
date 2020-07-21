#!/bin/sh
source .env

# create bucket
gsutil mb -p ${GCP_PROJECT} -c STANDARD -l europe-west1 -b on gs://ps_elixir_releases/

# create service account

gcloud iam service-accounts create ps-elixir-releases \
--project=${GCP_PROJECT} \
--description="deploy elixir release" \
--display-name="ps-elixir-releases"

# add rôles to service account
gcloud projects add-iam-policy-binding ${GCP_PROJECT} \
--member serviceAccount:ps-elixir-releases@${GCP_PROJECT}.iam.gserviceaccount.com \
--role='roles/storage.admin'

gcloud projects add-iam-policy-binding ${GCP_PROJECT} \
--member serviceAccount:ps-elixir-releases@${GCP_PROJECT}.iam.gserviceaccount.com \
--role='roles/logging.logWriter'

# display service account roles
gcloud iam service-accounts get-iam-policy \
ps-elixir-releases@${GCP_PROJECT}.iam.gserviceaccount.com