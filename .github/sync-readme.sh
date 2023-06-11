#!/bin/bash

export CHARTS_CONFIG=".github/config/charts.yml"

get_readme_by_github_repo() {
  local chart="$1"
  echo "[env] chart: $chart"
  local source_readme="$charts_tmp_dir/$chart/README.md"
  ls -alh "$source_readme"
  local repo_name="$(grep -Eo 'helm repo add [a-zA-Z0-9_-]+' "$source_readme" | head -n1 | awk '{printf $4}')"
  if echo "$repo_name" | grep -Ev '^[a-zA-Z0-9_-]+$' ; then
    repo_name="$chart_namespace"
  fi
  local chart_repo_raw="$repo_name/$chart"
  local chart_repo_mirror="${repo_name}-mirror/$chart"
  local chart_url_mirror="$CHART_BASE_URL/$chart_namespace"
  echo "[env] repo_name: $repo_name, chart_repo_mirror: $chart_repo_mirror"
  sed -i -E 's%(helm repo add \S+) \S+%\1-mirror '$chart_url_mirror'%' "$source_readme"
  sed -i -E 's%(helm .+?) '$chart_repo_raw'%\1 '$chart_repo_mirror'%' "$source_readme"
  sed -i -E 's%^(\s*)'$chart_repo_raw'%\1'$chart_repo_mirror'%' "$source_readme"
  if [[ "$chart_namespace" == "bitnami" ]]; then
    sed -i -E 's%oci://[^/]+/bitnamicharts/\S*%'$chart_repo_mirror'%' "$source_readme"
    sed -i -E '/^## TL;DR/a\\n使用镜像地址添加仓库: `helm repo add bitnami-mirror '$chart_url_mirror'`' "$source_readme"
  fi
  cp -f "$source_readme" "docs/${chart_namespace}/${chart}.md"
}

get_readme_github() {
  local charts_dir="$1"
  if [[ -z "$charts_dir" ]]; then charts_dir="charts"; fi
  local git_repo_url="$github_repo"
  mkdir -p "docs/${chart_namespace}"
  if echo "$github_repo" | grep -Ev '^(ssh|http)'; then
    local git_repo_url="https://github.com/${github_repo}"
  fi
  local chart_tmp_root="/tmp/tmpchart/$chart_namespace"
  rm -rf "$chart_tmp_root"
  mkdir -p "$chart_tmp_root"
  git clone -b main --depth=1 "$git_repo_url" "$chart_tmp_root"
  local charts_tmp_dir="$chart_tmp_root/$charts_dir"
  local chart=""
  ls "$charts_tmp_dir" | while read chart ; do
    get_readme_by_github_repo "$chart"
  done
  ls -alh "docs/"
  ls -alh "docs/${chart_namespace}/"
}

get_readme_bitnami() {
  export github_repo="https://github.com/bitnami/charts.git"
  export chart_namespace="bitnami"
  local charts_dir="bitnami"
  get_readme_github "$charts_dir"
}

main() {
  local yml="$CHARTS_CONFIG"
  local num=$(yq e '.repos | length' $yml)
  for ((i=0; i<$num; i++)); do
    # local github_url=$(yq e .repos[${i}].url $yml)
    export github_repo=$(yq e .repos[${i}].repo $yml)
    export chart_namespace=$(yq e .repos[${i}].namespace $yml)
    get_readme_github
  done
  get_readme_bitnami
}

main_test() {
  export github_repo='grafana/helm-charts'
  export chart_namespace="grafana"
  local charts_dir="charts"
  get_readme_github "$charts_dir"
}

main
