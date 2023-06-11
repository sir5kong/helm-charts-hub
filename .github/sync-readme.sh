#!/bin/bash

export CHARTS_CONFIG=".github/config/charts.yml"

get_readme_github() {
  local github_repo="$1"
  local chart_namespace="$2"
  local charts_dir="$3"
  local git_repo_url="$github_repo"
  if echo "$github_repo" | grep -Ev '^(ssh|http)'; then
    local git_repo_url="https://github.com/${github_repo}"
  fi
  local chart_tmp_root="/tmp/tmpchart/$chart_namespace"
  rm -rf "$chart_tmp_root"
  mkdir -p "$chart_tmp_root"
  git clone -b main --depth=1 "$git_repo_url" "$chart_tmp_root"
  mkdir -p "docs/${chart_namespace}"
  if [[ -z "$charts_dir" ]]; then charts_dir="charts"; fi
  local charts_tmp_dir="$chart_tmp_root/$charts_dir"
  ls "$charts_tmp_dir" | while read chart ; do
    source_readme="$charts_tmp_dir/$chart/README.md"
    ls -alh "$source_readme"
    cp -f "$source_readme" "docs/${chart_namespace}/${chart}.md"
    repo_name="$(grep -Eo 'helm repo add \S+' "$source_readme" | cut -d " " -f 4)"
    chart_repo_raw="$repo_name/$chart"
    chart_repo_mirror="${repo_name}-mirror/$chart"
    if [[ -z "$chart_repo" ]]; then chart_repo="$chart_namespace"; fi
    sed -i -E 's%(helm repo add \S+) \S+%\1-mirror '$CHART_BASE_URL'%' "$source_readme"
    sed -i -E 's%(helm .+?) '$chart_repo_raw'%\1 '$chart_repo_mirror'' "$source_readme"
    sed -i -E '(\s*)'$chart_repo_raw'%\1'$chart_repo_mirror'' "$source_readme"
  done
  ls -alh "docs/"
  ls -alh "docs/${chart_namespace}/"
}

get_readme_bitnami() {
  local github_repo="https://github.com/bitnami/charts.git"
  local chart_namespace="bitnami"
  local charts_dir="bitnami"
  get_readme_github "$github_repo" "$chart_namespace" "$charts_dir"
}

get_readme_grafana() {
  local github_repo="https://github.com/bitnami/charts.git"
  local chart_namespace="bitnami"
  local charts_dir="bitnami"
  get_readme_github "$github_repo" "$chart_namespace" "$charts_dir"
}

main() {
  local yml="$CHARTS_CONFIG"
  local num=$(yq e '.repos | length' $yml)
  for ((i=0; i<$num; i++)); do
    local github_url=$(yq e .repos[${i}].url $yml)
    local github_repo=$(yq e .repos[${i}].repo $yml)
    local chart_namespace=$(yq e .repos[${i}].namespace $yml)
    get_readme_github "$github_repo" "$chart_namespace"
  done
  get_readme_bitnami
}

main_test() {
  local github_repo='grafana/helm-charts'
  local chart_namespace="grafana"
  local charts_dir="grafana"
  get_readme_github "$github_repo" "$chart_namespace" "$charts_dir"
}

#main
main_test
