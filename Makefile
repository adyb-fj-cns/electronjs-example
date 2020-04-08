all: build run test

build:
	pack build electronjs-example-api --path ./api

run: 
	docker run -d \
		-p 5000:5000 \
		-e PORT=5000 \
		--name electronjs-example-api \
		electronjs-example-api

stop:
	docker stop electronjs-example-api

test:
	docker run -it --rm --net=host \
		-v $$PWD/taurus:/bzt-configs \
		blazemeter/taurus test.yml -o modules.console.disable=true

test-with-gui:
	docker run -it --rm --net=host \
		-v $$PWD:/bzt-configs \
		blazemeter/taurus \
		test.yml