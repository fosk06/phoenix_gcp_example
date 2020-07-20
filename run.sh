#!/bin/sh
gcloud compute instances create hello_world_instance \
    --image-family debian-10 \
	--image-project debian-cloud \
    --machine-type n1-standard-1 \
    --scopes "userinfo-email,cloud-platform" \
    --metadata release-url=gs://ps_build_artifacts/api_v2_ex/gcp-0.1.0.tar.gz,release-name=gcp,release-version=0.1.0,startup-script-url=gs://ps_build_artifacts/api_v2_ex/instance-startup.sh \
    --zone europe-west1-c \
    --tags http-server,https-server \
	--service-account=api-v2-storage@prestashop-data-integration.iam.gserviceaccount.com