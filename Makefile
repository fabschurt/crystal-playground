.PHONY: build
build_images:
	docker-compose build

.PHONY: test
test:
	docker-compose run --rm app crystal spec
