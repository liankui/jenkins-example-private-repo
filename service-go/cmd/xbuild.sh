#!/usr/bin/env bash
#env CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-X github.com/anbantech/abfuzz/service-go/pkg/constant.GitHash=$(git rev-list -1 HEAD) -X github.com/anbantech/abfuzz/service-go/pkg/constant.GitBranch=$(git branch --show-current) -X 'github.com/anbantech/abfuzz/service-go/pkg/constant.BuildTime=$(date "+%Y-%m-%d %H:%M:%S %Z")'"
#go generate
env CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build
