#!/usr/bin/env bash

set -e

echo "initializing git repository"
git init
git add .gitignore Cargo.toml src/
git commit -m 'initial commit'

echo "creating 'nix' branch"
git checkout -b nix
git rm -rf .gitignore Cargo.toml src/
git add shell.nix envrc deploy.sh
git commit --amend -m 'add nix files'

echo "creating worktree for nix files"
git checkout master
git worktree add .nix/ nix
rm -rf shell.nix envrc deploy.sh

echo "deploying nix files"
./.nix/deploy.sh

echo "creating environment"
direnv allow
lorri shell &
wait
