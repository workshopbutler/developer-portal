#!/usr/bin/env bash

# building docs
mkdocs build

# creating a folder for API
mkdir site/api

# building API
cd api/
aglio -i api.md -o ../site/api/index.html
