#!/bin/bash

rm mabrouk_repo*

echo "repo-add"
repo-add -n -R mabrouk_repo.db.tar.gz *.pkg.tar.zst
sleep 5

echo "####################################"
echo "Repo Updated!!"
echo "####################################"
