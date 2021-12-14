PWD = $(shell pwd)
# parameters:
# in: the input file, sans extension (e.g. blinky or *)
build:
	tinygo build -target=arduino -scheduler=tasks -o ./$(in).build.bin ./$(in).go

flash:
	tinygo flash -target=arduino -scheduler=tasks ./$(in).go

build-docker:
	docker run --rm -v $(PWD):/src tinygo/tinygo:0.21.0 tinygo build -target=arduino -scheduler=tasks -o /src/$(in).build.bin /src/$(in).go

setup-docker:
	docker pull tinygo/tinygo:0.21.0