#!/usr/bin/env bash


# Set with the flags "-e", "-u","-o pipefail" cause the script to fail
# if certain things happen, which is a good thing.  Otherwise, we can
# get hidden bugs that are hard to discover.
set -euo pipefail

x86_pkgbuild=$(find ../mabrouk_pkgbuilds/x86_64 -type f -name "*.pkg.tar.zst*")

for x in ${x86_pkgbuild}
do
    mv "${x}" x86_64/
    echo "Moving ${x}"
done

echo "###########################"
echo "Building the repo database."
echo "###########################"

## Arch: x86_64
cd x86_64
rm -f mabrouk_repo*

echo "###################################"
echo "Building for architecture 'x86_64'."
echo "###################################"

## repo-add
## -s: signs the packages
## -n: only add new packages not already in database
## -R: remove old package files when updating their entry
repo-add -n -R mabrouk_repo.db.tar.gz *.pkg.tar.zst

# Removing the symlinks because GitLab can't handle them.
rm mabrouk_repo.db
rm mabrouk_repo.files

# Renaming the tar.gz files without the extension.
mv mabrouk_repo.db.tar.gz mabrouk_repo.db
mv mabrouk_repo.files.tar.gz mabrouk_repo.files

echo "#######################################"
echo "Packages in the repo have been updated!"
echo "#######################################"
