#!/bin/bash

export CHARTS_CONFIG=".github/config/charts.yml"
export DOCS_ROOT="docs"

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
  if cat "$source_readme" | grep -Ei '^# .*DEPRECATED' &> /dev/null; then
    head -n5 "$source_readme"
    echo "[info] 跳过 DEPRECATED 文档 $source_readme"
    return
  fi
  local repo_name="$(grep -Eo 'helm repo add [a-zA-Z0-9_-]+' "$source_readme" | head -n1 | awk '{printf $4}')"
  if echo "$repo_name" | grep -Ev '^[a-zA-Z0-9_-]+$' ; then
    repo_name="$CHART_NAMESPACE"
  fi
  local chart_repo_raw="$repo_name/$chart"
  local chart_repo_mirror="${repo_name}/$chart"
  export chart_url_mirror="$CHART_BASE_URL/$CHART_NAMESPACE"
  echo "[env] repo_name: $repo_name, chart_repo_mirror: $chart_repo_mirror"
  sed -i -E 's%^(helm repo add \S+)\s+\S+%\1 '$chart_url_mirror'%' "$source_readme"
  sed -i -E 's%(helm .+?) '$chart_repo_raw'%\1 '$chart_repo_mirror'%' "$source_readme"
  sed -i -E 's%^(\s*)'$chart_repo_raw'%\1'$chart_repo_mirror'%' "$source_readme"
  if [[ "$CHART_NAMESPACE" == "bitnami" ]]; then
    sed -i -E 's%oci://[^/]+/bitnamicharts/\S*%'$chart_repo_mirror'%' "$source_readme"
    write_bitnami_notice_file "/tmp/helm-cmd.tmp"
    sed -i -E '/^## TL;DR/r /tmp/helm-cmd.tmp' "$source_readme"
  fi
  cp -f "$source_readme" "${DOCS_ROOT}/${CHART_NAMESPACE}/${chart}.md"
}

get_readme_github() {
  local charts_dir="$1"
  mkdir -p "${DOCS_ROOT}/${CHART_NAMESPACE}"
  if [[ -z "$charts_dir" ]]; then charts_dir="charts"; fi
  export GIT_REPO_URL="$GITHUB_REPO"
  if echo "$GITHUB_REPO" | grep -Ev '^(ssh|http)'; then
    export GIT_REPO_URL="https://github.com/${GITHUB_REPO}.git"
  fi
  echo "[debug] GIT_REPO_URL: $GIT_REPO_URL"
  local git_tmp_root="/tmp/tmpchart/$CHART_NAMESPACE"
  clone_charts_git_repo "$git_tmp_root"
  export charts_tmp_dir="$git_tmp_root/$charts_dir"
  local chart=""
  ls "$charts_tmp_dir" | while read chart ; do
    get_readme_by_github_repo "$chart"
  done
  gen_mkdocs_index_md "$CHART_NAMESPACE" "${DOCS_ROOT}/$CHART_NAMESPACE"
  # ls -alh "${DOCS_ROOT}/"
  # ls -alh "${DOCS_ROOT}/${CHART_NAMESPACE}/"
}

get_readme_bitnami() {
  export GITHUB_REPO="https://github.com/bitnami/charts.git"
  export CHART_NAMESPACE="bitnami"
  local charts_dir="bitnami"
  get_readme_github "$charts_dir"
}

gen_mkdocs_index_md() {
  local chart_title="$1"
  local chart_home="$2"
  local indexmd="$chart_home/index.md"
  echo -e "# $chart_title\n" > "$indexmd"
  echo -e "Chart 列表:\n" > "$indexmd"
  ls "$chart_home" | while read line ; do
    local chart="$(echo $line | sed 's/\.md//')"
    if [[ "$chart" != "index" ]]; then
      echo "- [$chart](./$chart/)" >> "$indexmd"
    fi
  done
}

gen_chart_list_md() {
  local chart_list_md="$DOCS_ROOT/chart-list.md"
  echo -e "# Chart 列表\n" > "$chart_list_md"
  ls "$DOCS_ROOT" | while read namespace ; do
    local dir="$DOCS_ROOT/$namespace"
    if [[ -d "$dir" ]]; then
      echo -e "\n## $namespace\n" >> "$chart_list_md"
      ls "$dir" | while read line ; do
        local chart="$(echo $line | sed 's/\.md//')"
        if [[ "$chart" != "index" ]]; then
          echo "- [$chart](../$namespace/$chart/)" >> "$chart_list_md"
        fi
      done
    fi
  done
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
    export GITHUB_REPO=$(yq e .repos[${i}].repo $yml)
    export CHART_NAMESPACE=$(yq e .repos[${i}].namespace $yml)
    local charts_dir=$(yq e .repos[${i}].chartsDir $yml)
    if [[ -z "$charts_dir" ]] || [[ "$charts_dir" == "null" ]]; then
      local charts_dir="charts"
    fi
    local skipReadmeSync=$(yq e .repos[${i}].skipReadmeSync $yml)
    if [[ "$skipReadmeSync" == "true" ]]; then
      echo "$CHART_NAMESPACE skipReadmeSync: $skipReadmeSync"
      return
    fi
    get_readme_github "$charts_dir"
  done
  ## get_readme_bitnami
  gen_chart_list_md
}

main_test() {
  export GITHUB_REPO='grafana/helm-charts'
  export CHART_NAMESPACE="grafana"
  local charts_dir="charts"
  get_readme_github "$charts_dir"
}

main
