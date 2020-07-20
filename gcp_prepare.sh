#!/bin/sh
source .env

gcloud iam service-accounts create ps-elixir-releases \
--project=${GCP_PROJECT} \
--description="deploy elixir release" \
--display-name="ps-elixir-releases"

gcloud projects add-iam-policy-binding ${GCP_PROJECT} \
--member serviceAccount:ps-elixir-releases@${GCP_PROJECT}.iam.gserviceaccount.com \
--role='roles/storage.admin'

gcloud projects add-iam-policy-binding ${GCP_PROJECT} \
--member serviceAccount:ps-elixir-releases@${GCP_PROJECT}.iam.gserviceaccount.com \
--role='roles/logging.logWriter'

gcloud iam service-accounts get-iam-policy \
ps-elixir-releases@${GCP_PROJECT}.iam.gserviceaccount.com