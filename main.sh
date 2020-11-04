#! /bin/sh
if [ -f ".npmrc" ]; then
  cp .npmrc ~/
fi
if [ "$PLUGINS" != "" ]; then
  npm install --ignore-scripts -g $PLUGINS
fi
if [ -f "~/.npmrc" ]; then
  rm ~/.npmrc
fi
if [ "$PLUGINS" != "" ]; then
  npm rebuild -g $PLUGINS
fi
semantic-release | tee semantic-release-output.txt
version=`cat semantic-release-output.txt | grep "The next release version is" | rev | cut -d' ' -f1 | rev`
if [ ! -z "$version" ]
then
  echo "::set-output name=released-version::v$version"
  echo "::set-output name=released-version-number::$version"
fi