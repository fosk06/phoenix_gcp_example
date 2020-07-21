#!/bin/sh
source .env

# delete instance
gcloud compute instances delete hello-world-instance

# delete bucket
gsutil rm -r gs://ps_elixir_releases/


# delete service account

gcloud iam service-accounts delete ps-elixir-releases \
--project=${GCP_PROJECT}

