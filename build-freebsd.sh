#!/bin/bash
PKG_NAME="github.com/ArtalkJS/Artalk"
BIN_NAME="./bin/artalk-freebsd.moe"
VERSION=$(git describe --tags --abbrev=0)
COMMIT_HASH=$(git rev-parse --short HEAD)

go mod tidy
go build \
    -ldflags "-s -w -X $PKG_NAME/internal/config.Version=$VERSION \
    -X $PKG_NAME/internal/config.CommitHash=$COMMIT_HASH" \
    -o $BIN_NAME \
    $PKG_NAME
