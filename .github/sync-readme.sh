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
  export work_dir="$(pwd)"
  rm -rf /tmp/tmpchart
  mkdir -p /tmp/tmpchart
  cd /tmp/tmpchart
  git clone -b main --depth=1 "$git_repo_url"
  mkdir -p "${work_dir}/docs/${chart_namespace}"
  local charts_dir="charts"
  if [[ -z "$charts_dir" ]]; then charts_dir="charts"; fi
  ls "$charts_dir/" | while read chart ; do
    ls -alh "$charts_dir/$chart/README.md"
    cp -f "$charts_dir/$chart/README.md" "${work_dir}/docs/${chart_namespace}/"
  done
  ls -alh "${work_dir}/docs/${chart_namespace}/"
  cd "${work_dir}"
}

get_readme_bitnami() {
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

main
