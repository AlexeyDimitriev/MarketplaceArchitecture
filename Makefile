TARGET ?= app

USER_IMAGE := user-service
USER_CONTAINER := user-service-temp
PORT := 8080

build-user-service:
	docker build -t $(USER_IMAGE) -f docker/Dockerfile.user-service .

run-docker-user-service:
	make build-user-service
	docker run --rm -d -p $(PORT):8080 --name $(USER_CONTAINER) $(USER_IMAGE)

stop-docker-user-service:
	docker stop $(USER_CONTAINER)

docker-user-service-health-check:
	make run-docker-user-service
	curl -sf http://localhost:$(PORT)/health || (echo "Health check failed" && exit 1)
	make stop-docker-user-service
