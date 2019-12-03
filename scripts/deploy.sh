#!/bin/bash

deploy_main(){
  local version
  local domain

  version=$(cat .release-version)
  domain=trellis.getto.systems/git/post

  deploy_to $domain
}
deploy_to(){
  local target
  target=$1; shift

  aws s3 cp \
    --acl private \
    --cache-control "public, max-age=31536000" \
    --recursive \
    dist s3://$target/$version
}

deploy_main
