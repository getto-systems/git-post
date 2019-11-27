#!/bin/sh

git_post_setup_path=$1

if [ -z "$git_post_setup_path" ]; then
  echo "usage: ./setup.sh /path/to/install"
  exit 1
fi

mkdir -p $git_post_setup_path

if [ ! -d "$git_post_setup_path" ]; then
  echo "FAILED create directory: $git_post_setup_path"
  exit 1
fi

cd $git_post_setup_path

if [ -d git-post/.git ]; then
  echo "update git-post"
  cd git-post
  git pull
else
  git clone https://github.com/getto-systems/git-post.git
fi

export PATH=$PATH:$git_post_setup_path/git-post/bin
