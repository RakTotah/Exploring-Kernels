run:
	make build && docker run --rm -it -v $pwd:/root/env container

build:
	docker build . -t container