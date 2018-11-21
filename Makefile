.PHONY: build
build:
	docker build -t janus -f Dockerfile .

.PHONY: run
run:
	docker run --rm --name janus --network=host janus || :

.PHONY: exec
exec:
	docker exec -it janus /bin/bash

.PHONY: stop
stop:
	docker stop janus || :

.PHONY: logs
logs:
	docker logs -f janus || :
