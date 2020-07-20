#!/bin/sh
set -ex
export HOME=/app
rm -rf /app || true
mkdir -p ${HOME}
cd ${HOME}
# get usefull metadatas from instance
RELEASE_URL=$(curl \
    -s "http://metadata.google.internal/computeMetadata/v1/instance/attributes/release-url" \
    -H "Metadata-Flavor: Google")
RELEASE_NAME=$(curl \
    -s "http://metadata.google.internal/computeMetadata/v1/instance/attributes/release-name" \
    -H "Metadata-Flavor: Google")
RELEASE_VERSION=$(curl \
    -s "http://metadata.google.internal/computeMetadata/v1/instance/attributes/release-version" \
    -H "Metadata-Flavor: Google")

# copy release from bucket untar the release and clean
gsutil cp ${RELEASE_URL} ${HOME}
tar -zxf ${RELEASE_NAME}-${RELEASE_VERSION}.tar.gz
rm ${RELEASE_NAME}-${RELEASE_VERSION}.tar.gz
chmod 755 ${HOME}/bin/${RELEASE_NAME}

# run the application
PORT=80 ${HOME}/bin/${RELEASE_NAME} start