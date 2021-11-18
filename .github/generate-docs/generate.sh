#!/bin/bash

# Clear existing documentation
rm -f docs/variables/*

# Generate variable documentation
generate-schema-doc --config-file ./.github/generate-docs/config.json defaults/schemas docs/variables/
