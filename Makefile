build/app: src/main.cr build_dir
	docker-compose run --rm app crystal build --static --progress -o build/app src/main.cr

.PHONY: build_dir
build_dir:
	[[ -d build ]] || mkdir build

.PHONY: run
run: build/app
	exec build/app
