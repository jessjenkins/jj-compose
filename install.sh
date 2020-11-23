#!/usr/bin/env bash

gh="git@github.com:ONSdigital"

services="The-Train
babbage
dp-api-router
dp-bulletin-api
dp-code-list-api
dp-dataset-api
dp-dataset-exporter
dp-dataset-exporter-xlsx
dp-dimension-extractor
dp-dimension-importer
dp-download-service
dp-filter-api
dp-frontend-cookie-controller
dp-frontend-dataset-controller
dp-frontend-filter-dataset-controller
dp-frontend-homepage-controller
dp-frontend-renderer
dp-frontend-router
dp-hierarchy-api
dp-hierarchy-builder
dp-image-api
dp-image-importer
dp-import-api
dp-import-tracker
dp-observation-api
dp-observation-extractor
dp-observation-importer
dp-publishing-dataset-controller
dp-recipe-api
dp-search-api
dp-search-builder
dp-search-query
dp-sessions-api
dp-static-file-publisher
dp-zebedee-content
florence
project-brian
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