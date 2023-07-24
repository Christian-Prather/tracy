#!/bin/sh

new_major=${MAJOR}
new_minor=${MINOR}
new_patch=${PATCH}
new_version="$new_major.$new_minor.$new_patch"

version_header="../public/common/TracyVersion.hpp"

major=$(grep -o -E 'Major = [0-9]+' "$version_header" | awk -F '= ' '{print $2}')
minor=$(grep -o -E 'Minor = [0-9]+' "$version_header" | awk -F '= ' '{print $2}')
patch=$(grep -o -E 'Patch = [0-9]+' "$version_header" | awk -F '= ' '{print $2}')

version="${major}.${minor}.${patch}"

echo "Old version $version"

# # the extension is required for macOS's outdated sed
sed -i -E "s/(Major = [0-9]+)/Major = $new_major/g" $version_header
sed -i -E "s/Minor = [0-9]+/Minor = $new_minor/g" $version_header
sed -i -E "s/Patch = [0-9]+/Patch = $new_patch/g" $version_header

echo "New version $new_version"