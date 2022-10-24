#!/bin/sh

if ! command -v inotifywait > /dev/null; then
  echo "inotifywait not installed." && exit 1
fi

if ! command -v rsync > /dev/null; then
  echo "rsync not installed." && exit 1
fi

if ! [ -d $HOME/.kube ]; then
  echo "Directory not found: \$HOME/.kube" && exit 1
fi

if ! [ -d "{{ win_home }}/.kube" ]; then
  echo "Directory not found: {{ win_home }}/.kube" && exit 1
fi

while inotifywait -q -q -e modify,move,create,delete $HOME/.kube $HOME/.kube/kubens; do
  if [ -d $HOME/.kube ] && [ -d "{{ win_home }}/.kube" ]; then
    rsync --ignore-missing-args -qavu \
      $HOME/.kube/kubens \
      $HOME/.kube/config \
      $HOME/.kube/kubectx \
      "{{ win_home }}/.kube"
  fi
done
