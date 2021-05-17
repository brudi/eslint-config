#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

PROJECT=$1
CONFIG=$2

cd packages/"$CONFIG"
yarn link

cd /tmp
rm -rf "$PROJECT"
git clone https://github.com/NiGhTTraX/"$PROJECT".git || echo Repo already exists
cd "$PROJECT"

yarn install
yarn link @brudi/eslint-config-"$CONFIG"
yarn run lint