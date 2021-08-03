#! /bin/sh

script="$1"

dockerVolumeName='nix-test-repo-cache-volume'

docker volume create "${dockerVolumeName}" || true

container_id=$(docker run -e NIX_CACHE_PATH="${NIX_CACHE_PATH}" -id -w=/workspace -v "${dockerVolumeName}:/cache" nixos/nix:latest sh)

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
docker exec "${container_id}" ./scripts/ci/cache-nix-store.sh

if [ "${script}" = '' ]; then
	docker exec -ti "${container_id}" ash
else
	docker exec -t "${container_id}" "./scripts/ci/${script}.sh"
fi
