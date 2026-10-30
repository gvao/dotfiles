#!/usr/bin/zsh

PATHFROM="$HOME/dotenv/i3/config"
PATHTO="$HOME/.config/i3/config"

function removeConfigFile() {
  rm "$PATHTO"
}

function createLink (){
  mkdir -p "$(dirname "$PATHTO")" && ln -s "$PATHFROM" "$PATHTO" && echo "created link to i3 config"
}

function init() {
  [[ -r "$PATHTO" ]] \
    && removeConfigFile \
    || createLink;
}

init
