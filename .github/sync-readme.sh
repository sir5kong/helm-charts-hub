#!/bin/bash

export CHARTS_CONFIG=".github/config/charts.yml"

write_bitnami_notice_file() {
local tmpfile="$1"
cat > "$tmpfile" <<EOF

> 使用加速地址添加仓库:

\`\`\` shell
helm repo add bitnami "$chart_url_mirror" --force-update
helm update bitnami
\`\`\`

EOF
}

clone_charts_git_repo() {
  # set -x
  local git_tmp_root="$1"
  if [[ -n "$GITHUB_ACTION" ]]; then
    echo "[exec] rm -rf $git_tmp_root"
    rm -rf "$git_tmp_root"
  fi
  mkdir -p "$git_tmp_root"
  if [[ ! -d "$git_tmp_root/.git" ]]; then
    git clone -b main --depth=1 "$GIT_REPO_URL" "$git_tmp_root"
  fi
}

get_readme_by_github_repo() {
  local chart="$1"
  echo "[env] chart: $chart"
  mkdir -p "_tmp"
  local source_readme="_tmp/README.md"
  cp -f "$charts_tmp_dir/$chart/README.md" "$source_readme"
  ls -alh "$source_readme"
  local repo_name="$(grep -Eo 'helm repo add [a-zA-Z0-9_-]+' "$source_readme" | head -n1 | awk '{printf $4}')"
  if echo "$repo_name" | grep -Ev '^[a-zA-Z0-9_-]+$' ; then
    repo_name="$chart_namespace"
  fi
  local chart_repo_raw="$repo_name/$chart"
  local chart_repo_mirror="${repo_name}/$chart"
  export chart_url_mirror="$CHART_BASE_URL/$chart_namespace"
  echo "[env] repo_name: $repo_name, chart_repo_mirror: $chart_repo_mirror"
  sed -i -E 's%^(helm repo add \S+)\s+\S+%\1 '$chart_url_mirror'%' "$source_readme"
  sed -i -E 's%(helm .+?) '$chart_repo_raw'%\1 '$chart_repo_mirror'%' "$source_readme"
  sed -i -E 's%^(\s*)'$chart_repo_raw'%\1'$chart_repo_mirror'%' "$source_readme"
  if [[ "$chart_namespace" == "bitnami" ]]; then
    sed -i -E 's%oci://[^/]+/bitnamicharts/\S*%'$chart_repo_mirror'%' "$source_readme"
    write_bitnami_notice_file "/tmp/helm-cmd.tmp"
    sed -i -E '/^## TL;DR/r /tmp/helm-cmd.tmp' "$source_readme"
  fi
  cp -f "$source_readme" "docs/${chart_namespace}/${chart}.md"
}

get_readme_github() {
  local charts_dir="$1"
  if [[ -z "$charts_dir" ]]; then charts_dir="charts"; fi
  export GIT_REPO_URL="$github_repo"
  mkdir -p "docs/${chart_namespace}"
  if echo "$github_repo" | grep -Ev '^(ssh|http)'; then
    export GIT_REPO_URL="https://github.com/${github_repo}.git"
  fi
  echo "[debug] GIT_REPO_URL: $GIT_REPO_URL"
  local git_tmp_root="/tmp/tmpchart/$chart_namespace"
  clone_charts_git_repo "$git_tmp_root"
  export charts_tmp_dir="$git_tmp_root/$charts_dir"
  local chart=""
  ls "$charts_tmp_dir" | while read chart ; do
    get_readme_by_github_repo "$chart"
  done
  # ls -alh "docs/"
  # ls -alh "docs/${chart_namespace}/"
}

get_readme_bitnami() {
  export github_repo="https://github.com/bitnami/charts.git"
  export chart_namespace="bitnami"
  local charts_dir="bitnami"
  get_readme_github "$charts_dir"
}

init_env() {
  if [[ -z "$GITHUB_ACTION" ]]; then
    export CHARTS_CONFIG="config/charts.yml"
  fi
  if [[ -z "$CHART_BASE_URL" ]]; then
    export CHART_BASE_URL='https://helm-charts.itboon.top'
  fi
}

main() {
  init_env
  local yml="$CHARTS_CONFIG"
  local num=$(yq e '.repos | length' $yml)
  if [[ ! "$num" -ge 1 ]]; then echo "$num"; exit "400"; fi
  for ((i=0; i<"$num"; i++)); do
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
