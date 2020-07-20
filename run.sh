#!/bin/sh
gcloud compute instances create hello-world-instance \
    --image-family debian-10 \
	--image-project debian-cloud \
    --machine-type n1-standard-1 \
    --scopes "userinfo-email,cloud-platform" \
    --metadata release-url=gs://ps_elixir_releases/gcp-0.1.0.tar.gz,release-name=gcp,release-version=0.1.0,startup-script-url=gs://ps_elixir_releases/instance-startup.sh \
    --zone europe-west1-c \
    --tags http-server,https-server \
	--service-account=my-gcp-project.iam.gserviceaccount.com