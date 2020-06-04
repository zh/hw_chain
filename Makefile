VERSION := $(shell echo $(shell git describe --tags) | sed 's/^v//')
COMMIT := $(shell git log -1 --format='%H')

ldflags = -X github.com/cosmos/cosmos-sdk/version.Name=HelloChain \
	-X github.com/cosmos/cosmos-sdk/version.ServerName=hcd \
	-X github.com/cosmos/cosmos-sdk/version.ClientName=hccli \
	-X github.com/cosmos/cosmos-sdk/version.Version=$(VERSION) \
	-X github.com/cosmos/cosmos-sdk/version.Commit=$(COMMIT) 

BUILD_FLAGS := -ldflags '$(ldflags)'

all: install

install: go.sum
	go install -mod=readonly $(BUILD_FLAGS) ./cmd/hwd
	go install -mod=readonly $(BUILD_FLAGS) ./cmd/hwcli

go.sum: go.mod
		@echo "--> Ensure dependencies have not been modified"
		go mod verify
