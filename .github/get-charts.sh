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

get_chart_index_github() {
  local index_url="$1"
  local github_repo="$2"
  local namespace="$3"
  if [[ $(basename $index_url) != "index.yaml" ]]; then
    export index_url=$(echo "$index_url" | sed -E 's%/?(index\.yaml)?$%/index.yaml%')
  fi
  echo "index_url: $index_url"
  curl -o /tmp/index.yaml -L "$index_url"
  head -n10 /tmp/index.yaml
  if head -n50 /tmp/index.yaml | grep -E '^apiVersion:' ; then
    echo '[sed] s%https://github.com/\('$github_repo'/releases\)%'$CHART_BASE_URL'/github/\1%'
    sed -i 's%https://github.com/\('$github_org'/helm-charts/releases\)%'$CHART_BASE_URL'/github/\1%' /tmp/index.yaml
    $ALIOSS cp -f /tmp/index.yaml \
      "oss://${OSS_BUCKET}/${namespace}/index.yaml" \
      --meta "content-type:text/plain; charset=utf-8"
    grep "$CHART_BASE_URL" /tmp/index.yaml | head -n5
  fi
}

main() {
  setup_alioss
  # setup_yq
  local yml="$CHARTS_CONFIG"
  local num=$(yq e '.repos | length' $yml)
  for ((i=0; i<$num; i++)); do
    local gtihub_url=$(yq e .repos[${i}].url $yml)
    local gtihub_repo=$(yq e .repos[${i}].repo $yml)
    local chart_namespace=$(yq e .repos[${i}].namespace $yml)
    get_chart_index_github "$github_url" "$github_repo" "$chart_namespace"
  done
}

main
