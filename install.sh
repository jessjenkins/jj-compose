#!/usr/bin/env bash

gh="git@github.com:ONSdigital"

services="The-Train
dp-api-router
dp-frontend-renderer
dp-frontend-router
dp-sessions-api
florence
sixteens
zebedee"

mkdir -p repos
pushd repos > /dev/null
  while IFS= read -r repo
  do
    if [ -d "$repo" ]; then
      echo "'$repo' already cloned"
    else
      git clone $gh/$repo.git
    fi
  done <<< "$services"
popd > /dev/null

cp -rvf dockerfiles/* repos/