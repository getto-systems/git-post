# git-post

pull request to origin

## Usage

```
git post

... pull request to origin (github or bitbucket)
```

## Installation

.gitconfig

```gitconfig
[alias]
	current = "!git symbolic-ref --short HEAD"
	post = "!git-post"
```

.bashrc

```bashrc
export GIT_POST_GITHUB_ACCESS_TOKEN="TOKEN"
```

### github access token setting

1. access personal access tokens: (https://github.com/settings/tokens)
2. setup GIT_POST_GITHUB_ACCESS_TOKEN

## Manual

```
git post [remote-name]
```

* remote-name : destination repository. default = origin

