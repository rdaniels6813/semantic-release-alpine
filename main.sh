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

semantic-release
