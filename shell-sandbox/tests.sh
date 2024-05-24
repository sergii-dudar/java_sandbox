#!/bin/sh

intellijView="intellij"
vscodeView="vscode"

typeset -A nameToCommandMap
nameToCommandMap[$intellijView]="intellij-idea-ultimate"
nameToCommandMap[$vscodeView]="code"

getMapValueOrKey() {
  local key="$1"
  local value="${nameToCommandMap[$key]}"
  if [ -z "$value" ]; then
    echo "$key"
  else
    echo "$value"
  fi
}

testFunction() {
  originalCmd=$1
  #for key in "${!nameToCommandMap[@]}"; do
    #originalCmd=$(echo "$originalCmd" | sed "s/$key/${nameToCommandMap[$key]}/")
  #  echo "$key"
  #done

  #for key val in "${(@kv)nameToCommandMap}" ; do
  #  echo "Key: $key, Value: $val"
  #done

  (eval $originalCmd >/dev/null 2>&1 &)

}

echo "$intellijView /home/serhii/serhii.home/work/git.work/ticket-service"
testFunction "$intellijView /home/serhii/serhii.home/work/git.work/ticket-service"
