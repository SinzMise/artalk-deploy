#!/bin/bash
PKG_NAME="github.com/ArtalkJS/Artalk"
BIN_NAME="./bin/artalk-freebsd.moe"
VERSION=$(wget -qO- https://api.github.com/repos/ArtalkJS/Artalk/tags | gawk -F '["v]' '/name/{print "v"$5;exit}')
COMMIT_HASH=$(git rev-parse --short HEAD)

go mod tidy
go build \
    -ldflags "-s -w -X $PKG_NAME/internal/config.Version=$VERSION \
    -X $PKG_NAME/internal/config.CommitHash=$COMMIT_HASH" \
    -o $BIN_NAME \
    -buildvcs=false \
    $PKG_NAME
