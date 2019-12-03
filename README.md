# git-post

pull request to origin

status: production ready

```bash
# some changes
git create-work-branch "add: awesome feature"
```

- limitation: only for GitHub, BitBucket, GitLab

###### Table of Contents

- [Requirements](#requirements)
- [Usage](#usage)
- [License](#license)


## Requirements

- GNU bash
- [getto-systems/git-pub](https://github.com/getto-systems/git-pub)


## Usage

```bash
# some changes
git create-work-branch "add: awesome feature

- change awesome
- change another awesome"
```

This command is short-hand for following commands.

```bash
git checkout -b add-awesome-feature &&
git commit -m "add: awesome feature

- change awesome
- change another awesome" &&
git pub &&
git post
```

- requirements: [getto-systems/git-pub](https://github.com/getto-systems/git-pub)


### setup token

You have not configured access token, git-post prompt to enter your access token.

- GitHub: [create Personal access token](https://github.com/settings/tokens) (allow public_repo) and enter access token
- GitLab: add [Personal Access Tokens](https://gitlab.com/profile/personal_access_tokens) (scope: api) and enter access token
- BitBucket: create OAuth consumer key (allow create pull request) and enter client_id and secret then access URL, and paste code


### feature branch

```bash
git create-feature-branch "my awesome feature"
```

This command is short-hand for following commands.

```bash
git checkout -b feature-my-awesome-module &&
git commit -m "my awesome module" &&
git pub &&
git push origin <PARENT_BRANCH>
```

- PARENT_BRANCH: `git parent`
- requirements: [getto-systems/git-pub](https://github.com/getto-systems/git-pub)


### post pull request

- title: `"subject"`
- description: `"subject\n\nbody"`

```bash
git post "subject

body"
```

- requirements: [getto-systems/git-pub](https://github.com/getto-systems/git-pub)


### Environment Variables

- `${GIT_POST_REMOTE_FORK_NAME:=pub}` : `git post` will push local changes to remote that named "pub". If you want to push to another remote, set `GIT_POST_REMOTE_FORK_NAME`. e.g. `GIT_POST_REMOTE_FORK_NAME=origin`

#### GitLab settings

- `$GITLAB_MERGE_REQUEST_ASSIGNEES` : `git post` will assign yourself. If you want to assign other people, set `GITLAB_MERGE_REQUEST_ASSIGNEES`. e.g. `GITLAB_MERGE_REQUEST_ASSIGNEES=getto,shun-fix9`
- `$GITLAB_REMOVE_SOURCE_BRANCH` : If there is `GITLAB_REMOVE_SOURCE_BRANCH`, `git post` create MR with "remove source branch" option.
- `$GITLAB_ACCESS_TOKEN` : If there is `GITLAB_ACCESS_TOKEN`, `git post` use this token instead of local-saved-token.


### post pull request to branch

```bash
git post "subject" $branch
```

- this command not need to install [getto-systems/git-pub](https://github.com/getto-systems/git-pub)


### Install

to install git-post, clone into your bash-scripts directory, and export PATH

```bash
GIT_POST_INSTALL_PATH=/path/to/install/dir

curl https://raw.githubusercontent.com/getto-systems/git-post/master/bin/setup.sh | bash -s -- $GIT_POST_INSTALL_PATH
export PATH=$PATH:$GIT_POST_INSTALL_PATH/git-post/bin
```


## License

git-post is licensed under the [MIT](LICENSE) license.

Copyright &copy; since 2016 shun@getto.systems
