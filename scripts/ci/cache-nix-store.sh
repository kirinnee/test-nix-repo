#! /bin/sh

# file cache
file_cache="file://${NIX_CACHE_PATH}"

# substitutes
caches="https://cache.nixos.org/"

# add file cache if exist
[ "${NIX_CACHE_PATH}" != '' ] && caches="${caches} ${file_cache}"

# setup environment
nix-env -f ./env.nix -iA 'ci' --substituters "${caches}"

# add files to cache
if [ "${NIX_CACHE_PATH}" != '' ]; then
	nix copy --to "${file_cache}" --all

	# set cache info to 10
	cache_info="$NIX_CACHE_PATH/nix-cache-info"
	if grep -Exq "^Priority: .*$" "${cache_info}"; then
		echo "Priority already set"
	else
		echo "Priority: 10" >>"${cache_info}"
	fi
fi
