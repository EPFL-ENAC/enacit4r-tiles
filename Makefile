run:
	docker compose build --parallel --pull
	docker compose up -d --remove-orphans --force-recreate db
	sleep 5
	docker compose up -d --remove-orphans --force-recreate martin
	docker compose up -d --remove-orphans --force-recreate nginx
	docker compose up -d --remove-orphans --force-recreate reverse-proxy

stop:
	docker compose stop

UID := $(shell id -u)
GID := $(shell id -g)

generate-selfsigned-cert:
	cd cert && OWNER="${UID}.${GID}" docker compose up --remove-orphans
