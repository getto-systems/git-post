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
export PATH=$PATH:path/to/git-post/bin
```

### github access token

1. access personal access tokens: (https://github.com/settings/tokens)

## Manual

```
git post [remote-name]
```

* remote-name : destination repository. default = origin

