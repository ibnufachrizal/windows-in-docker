#!/usr/bin/env bash

set -eu
set -o pipefail
cd "$(dirname "$0")"


RELEASE="$1"
BUILD="msjpq/windows-kvm-build:latest"
IMAGE="msjpq/windows-kvm:$RELEASE"


docker build -t "$BUILD" . -f "build/Dockerfile"
docker build -t "$IMAGE" . -f "release/$RELEASE/Dockerfile"


if [[ $# -gt 1 ]]
then
  docker push "$build"
  docker push "$IMAGE"
fi

