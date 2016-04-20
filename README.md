# git-post

git pull request hook

## Usage

.gitconfig

```gitconfig
[alias]
	current = "!git symbolic-ref --short HEAD"
	post = "!git-post"
```

## Description

pull request to origin:HEAD from current branch
