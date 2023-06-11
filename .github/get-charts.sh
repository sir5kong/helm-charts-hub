#!/bin/bash

export ALIOSS="${HOME}/bin/ossutil"
export YQ="${HOME}/bin/yq"
export CHARTS_CONFIG=".github/config/charts.yml"

setup_alioss() {
  mkdir -p $(dirname $ALIOSS)
  curl -o $ALIOSS -L "https://gosspublic.alicdn.com/ossutil/1.7.1/ossutil64"
  chmod a+rx $ALIOSS
  echo "[exec] $ALIOSS config -e $OSS_EP -i $OSS_KEY_ID -k OSS_KEY_SECRET"
  $ALIOSS config -e $OSS_EP -i $OSS_KEY_ID -k $OSS_KEY_SECRET
}

setup_yq() {
  mkdir -p $(dirname $YQ)
  curl -o $YQ -L "https://github.com/mikefarah/yq/releases/download/v4.34.1/yq_linux_amd64"
  chmod a+rx $YQ
}

get_chart_index() {
  local index_url="$1"
  local namespace="$2"
  if [[ $(basename $index_url) != "index.yaml" ]]; then
    export index_url=$(echo "$index_url" | sed -E 's%/?(index\.yaml)?$%/index.yaml%')
  fi
  echo "index_url: $index_url"
  curl -o /tmp/index.yaml -L "$index_url"
  head -n50 /tmp/index.yaml
  if head -n50 /tmp/index.yaml | grep -E '^apiVersion:' ; then
    sed -i 's%https://github.com/\('$namespace'/helm-charts/releases\)%'$chart_base_url'/github/\1%' /tmp/index.yaml
    $ALIOSS cp -f /tmp/index.yaml \
      "oss://${OSS_BUCKET}/${namespace}/index.yaml" \
      --meta "content-type:text/plain; charset=utf-8"
  fi
}

main() {
  setup_alioss
  # setup_yq
  local yml="$CHARTS_CONFIG"
  local num=$(yq e '.repos | length' $yml)
  for ((i=0; i<$num; i++)); do
    local this_url=$(yq e .repos[${i}].url $yml)
    local this_namespace=$(yq e .repos[${i}].namespace $yml)
    get_chart_index "$this_url" "$this_namespace"
  done
}

main
