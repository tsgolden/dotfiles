# Stop and remove containers matching the given string
stopcontainers() {
	docker ps --filter name="$1" -aq | xargs docker stop
}

# Stop and remove containers matching the given string
rmcontainers() {
	docker ps --filter name="$1" -aq | xargs docker stop | xargs docker rm
}

