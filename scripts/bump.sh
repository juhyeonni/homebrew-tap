#!/bin/sh
# Usage: scripts/bump.sh <version> [zip]
# Writes the version and the zip's SHA-256 into Casks/tabieum.rb. Without a zip it downloads the GitHub release.
set -eu
cd "$(dirname "$0")/.."
repo=juhyeonni/tabieum
version=${1:?usage: scripts/bump.sh <version> [zip]}
zip=${2:-}
if [ -z "$zip" ]; then
  zip=$(mktemp -d)/tabieum.zip
  curl -fL "https://github.com/$repo/releases/download/v$version/tabieum-$version.zip" -o "$zip"
fi
sha=$(shasum -a 256 "$zip" | cut -d' ' -f1)
sed -i '' -e "s/^  version \".*\"/  version \"$version\"/" -e "s/^  sha256 \".*\"/  sha256 \"$sha\"/" Casks/tabieum.rb
echo "tabieum $version $sha"
