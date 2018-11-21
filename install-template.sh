#!/usr/bin/env bash

# Make sure wget in installed
if ! [ -x "$(command -v wget)" ]; then
		echo 'Error: wget is not installed.' >&2
		exit 1
fi

# Ask for hooks path
echo "Where shall I put the template file? (absolute path)"
read templateFilePath

if [ ! -d "$templateFile" ]; then
		echo 'Error: Path provided does not exist!'
		exit 1
fi

# Download latest template file
cd $templateFilePath

wget https://raw.githubusercontent.com/Gurran/git-template/master/commit-template

git config --global commit.template $templateFilePath/commit-template

