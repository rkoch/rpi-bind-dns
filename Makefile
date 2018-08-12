all: build

build:
	@docker build --tag=lauster/rpi-bind-dns .
