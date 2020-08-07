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
command_response="`semantic-release`"
echo "$command_response"
version=`echo "$command_response" | grep "The next release version is" | rev | cut -d' ' -f1 | rev`
[ ! -z "$version" ] && echo "::set-output name=released-version::v$version"