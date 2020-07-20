#!/bin/sh
gcloud iam service-accounts create ps-elixir-releases \
--project=my-gcp-project \
--description="deploy elixir release" \
--display-name="ps-elixir-releases"

gcloud projects add-iam-policy-binding my-gcp-project \
--member serviceAccount:ps-elixir-releases@my-gcp-project.iam.gserviceaccount.com \
--role roles/storage.admin