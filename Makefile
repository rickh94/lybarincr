GOCMD=go
GOBUILD=$(GOCMD) build
GORUN=$(GOCMD) run
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
BINARY_NAME=lybarincr
BINARY_UNIX=$(BINARY_NAME)_unix

all: deps test build

travis: deps test build cov

build:
	$(GOBUILD) -o $(BINARY_NAME) -v

test:
	$(GOTEST) -v ./...

cov:
	$(GOTEST) -race -coverprofile=coverage.txt -covermode=atomic ./...

clean:
	$(GOCLEAN)
	rm -f $(BINARY_NAME)
	rm -f $(BINARY_UNIX)


deps:
	$(GOGET) github.com/spf13/cobra
