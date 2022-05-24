PROJECT = obada/faucet
CI_COMMIT_REF_SLUG ?= develop
SHELL := /bin/sh

ifeq ($(CI_COMMIT_TAG),)
	FRONTEND_CONTAINER = $(PROJECT)-ui:$(CI_COMMIT_REF_SLUG)
	BACKEND_CONTAINER = $(PROJECT):$(CI_COMMIT_REF_SLUG)
else
	FRONTEND_CONTAINER = $(PROJECT)-ui:$(CI_COMMIT_TAG)
	BACKEND_CONTAINER = $(PROJECT):$(CI_COMMIT_TAG)
endif

frontend/build:
	cd frontend && npm run build

frontend/dev:
	cd frontend && npm run dev --watch

docker/frontend: docker/frontend/build docker/frontend/push

docker/frontend/build:
	docker build \
		-t $(FRONTEND_CONTAINER) \
		-f docker/frontend/Dockerfile \
		.

docker/frontend/push:
	docker push $(FRONTEND_CONTAINER)

docker/backend: docker/backend/build docker/backend/push

docker/backend/build:
	docker build \
		-t $(BACKEND_CONTAINER) \
		-f docker/backend/Dockerfile \
		.

docker/backend/push:
	docker push $(BACKEND_CONTAINER)

docker: docker/backend docker/frontend

certificates: ssh/ssh_key

ssh/ssh_key:
	mkdir -p ssh && docker run \
		-it \
		--rm \
                -v $$(pwd)/ssh:/root/.ssh \
		alpine:3.15 \
		sh -c 'apk add openssh && ssh-keygen -t ed25519 -f $$HOME/.ssh/ssh_key -q -N "" && chown 1000:1000 $$HOME/.ssh/ssh_key'

deploy/inventory:
	docker run \
		-it \
		--rm \
		-w /home/ansible/deployment \
		-v $$(pwd)/deployment/compose:/home/ansible/deployment \
		obada/ansible \
		ansible-playbook inventory-playbook.yml --inventory localhost --connection=local --limit 127.0.0.1

deploy/compose:
	docker run \
		-it \
		--rm \
		-w /home/ansible/deployment \
		-v $$(pwd)/ssh:/home/ansible/.ssh \
		-v $$(pwd)/deployment/compose:/home/ansible/deployment \
		obada/ansible \
		ansible-playbook playbook.yml --inventory ./inventory
