#! /bin/sh

# shellcheck disable=SC2068
container_id=$(docker run -id -w=/workspace $@ kirinnee/ubuntu-nix:2.3.13)

cleanup() {
	echo "Clean up containers removing containers..."
	docker stop "${container_id}"
	docker rm "${container_id}"
}
trap cleanup EXIT

docker cp . "$container_id:/workspace"
docker exec -ti -e TERM=xterm-256color "${container_id}" bash
