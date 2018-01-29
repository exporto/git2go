default: test

test: build-libgit2
	go run script/check-MakeGitError-thread-lock.go
	go test .

install: build-openssl build-libssh2 build-libgit2
	./script/set-flags.sh go install .

build-libgit2:
	./script/build-libgit2-static.sh

build-libssh2:
	./script/build-libssh2-static.sh

build-openssl:
	./script/build-openssl-static.sh