#!/bin/sh
source .env

gcloud compute instances create hello-world-instance \
    --image-family debian-10 \
	--image-project debian-cloud \
    --machine-type n1-standard-1 \
    --scopes "userinfo-email,cloud-platform" \
    --metadata release-url=gs://ps_elixir_releases/gcp-0.1.0.tar.gz,release-name=gcp,release-version=0.1.0,startup-script-url=gs://ps_elixir_releases/instance-startup.sh,secret-key-base=${SECRET_KEY_BASE} \
    --zone europe-west1-c \
    --tags http-server,https-server \
	--service-account=ps-elixir-releases@${GCP_PROJECT}.iam.gserviceaccount.com

# gcloud compute instances delete hello-world-instance --quiet

# gcloud compute instances get-serial-port-output hello-world-instance \
#   --port 1 \
#   --zone europe-west1-c

gcloud compute instances describe hello-world-instance \
  --format='get(networkInterfaces[0].accessConfigs[0].natIP)'