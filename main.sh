#! /bin/sh
if [ ".npmrc" ]; then
  cp .npmrc ~/
fi
if [ "$PLUGINS" != "" ]; then
  npm install --ignore-scripts -g $PLUGINS
fi
if [ "~/.npmrc" ]; then
  rm ~/.npmrc
fi
if [ "$PLUGINS" != "" ]; then
  npm rebuild -g $PLUGINS
fi

semantic-release
