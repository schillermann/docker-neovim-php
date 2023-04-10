# Dev Docker Image With PHP Intelephense And TypeScript

The docker image is for development with php as backend api and javascript/typescript as frontend client.

## Setup
Go to your local repository folder `docker-neovim-php` and build your docker image
```sh
docker build -t neovim-php .
```

Create docker container from builed image
```sh
docker run --name dev -d neovim-php
```
## Activate Intelephense Premium
If you have bought a [license](https://intelephense.com/) for premium features, you can activate it by creating the `/workspaces/intelephense/licence.txt` file and saving the license key in it.

## Interact
Connect with running docker container
```sh
docker exec -ti dev zsh
```

Stop docker container
```sh
docker stop dev
```

Start docker container
```sh
docker start dev
```
