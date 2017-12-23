# git-post

pull request to origin

```bash
git create-feature-branch "my awesome module"

git commit -m "some changes"

git create-work-branch "add awesome feature"
```

- limitation: only for GitHub or BitBucket

###### Table of Contents

- [Requirements](#requirements)
- [Usage](#usage)
- [License](#license)


<a id="requirements"></a>
## Requirements

- GNU bash, version 4.3.48(1)-release (x86_64-alpine-linux-musl)
- git version 2.14.2
- [git-pub](https://github.com/sanzen-sekai/git-pub)


<a id="usage"></a>
## Usage

to install git-post, clone into your bash-scripts directory, and export PATH

```bash
INSTALL_DIR=path/to/scripts/git-post

git clone https://github.com/sanzen-sekai/git-post.git $INSTALL_DIR

export PATH=$INSTALL_DIR/bin:$PATH
```

- requirements: you have to install [git-pub](https://github.com/sanzen-sekai/git-pub)


### git create-work-branch

create branch and create pull request

```bash
git create-work-branch "add some feature

- reason" #=>
  git checkout -b add-some-feature &&
  git commit -m "add some feature

  - reason" &&
  git pub &&
  git post
```

#### setup token

you have not configured access token, git-post prompt to enter your access token

- GitHub: [create Personal access token](https://github.com/settings/tokens) (allow public_repo) and enter access token
- BitBucket: create OAuth consumer key (allow create pull request) and enter client_id and secret then access URL, and paste code

### git post

pull request to origin

```bash
git post "subject

body" #=>
  create pull request
    title: subject
    description: subject\n\nbody
```

### git create-feature-branch

create branch to origin (you must have permission to write origin)

```bash
git create-feature-branch "my awesome module" #=>
  git checkout -b feature-my-awesome-module &&
  git commit -m "my awesome module" &&
  git pub &&
  git push origin <PARENT_BRANCH>
```

- PARENT_BRANCH: base branch of current-branch


<a id="license"></a>
## License

git-post is licensed under the [MIT](LICENSE) license.

Copyright &copy; since 2016 shun.fix9@gmail.com
