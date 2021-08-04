#! /bin/sh

script="$1"

container_id=$(docker run -id -w=/workspace nixos/nix:latest sh)

cleanup() {
	echo "Clean up containers removing containers..."
	docker stop "${container_id}"
	docker rm "${container_id}"
}

trap cleanup EXIT

# copy current folder and emulate commit
docker cp . "$container_id:/data"
docker exec "${container_id}" /data/scripts/emulate-commit.sh >/dev/null
docker exec "${container_id}" git clone /data /workspace >/dev/null

if [ "${script}" = '' ]; then
	docker exec -ti "${container_id}" ash
else
	docker exec -t "${container_id}" nix-shell --run "./scripts/ci/${script}.sh"
fi
