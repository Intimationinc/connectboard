.PHONY: all fmt lint vet test coverage sec vuln doc mocks

fmt:
	gofmt -w .
	goimports -w .

lint:
	golangci-lint run

vet:
	go vet ./...

test:
	go test ./...

coverage:
	go test -cover ./...

sec:
	gosec ./...

vuln:
	govulncheck ./...

doc:
	godoc -http=:6060

mocks:
	mockgen -source=yourpkg/yourinterface.go -destination=mocks/mock_yourinterface.go

all: fmt lint vet test sec vuln
