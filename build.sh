#!/bin/sh
source .env

docker build \
	--pull \
	--rm \
	-t hello_world:latest \
	--build-arg app_name=hello_world \
	--build-arg release_name=gcp \
	--build-arg secret_key_base=${SECRET_KEY_BASE} \
	--build-arg service_account_filename=service-account.json \
	--build-arg bucket_url=gs://ps_elixir_releases \
	--build-arg build_env=prod \
    .