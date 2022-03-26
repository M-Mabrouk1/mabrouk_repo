#!/usr/bin/env bash
#set -e

# change a commit comment
# git commit --amend -m "more info"
# git push --force origin


# checking if I have the latest files from github
echo "Checking for newer files online first"
git pull

sh ./build-db.sh
cd x86_64
# Below command will backup everything inside the project folder
cd ..
git add --all .

Give a comment to the commit if you want
echo "####################################"
echo "Write your commit comment!"
echo "####################################"

# input="update"
read input

# Committing to the local repository with a message containing the time details and commit text

git commit -m "$input"

# Push the local files to github

git push -u origin main


echo "################################################################"
echo "###################    Git Push Done      ######################"
echo "################################################################"
