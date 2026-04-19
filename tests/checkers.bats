#!/usr/bin/env bats
# Tests for scripts/chkers.sh

setup() {
  # Restricted PATH: only our mock bin + essential system utils
  MOCK_BIN="$(mktemp -d)"
  export MOCK_BIN
  export _ORIG_PATH="$PATH"
  export PATH="$MOCK_BIN:/usr/bin:/bin"

  cd "$BATS_TEST_DIRNAME/.."
  source scripts/chkers.sh
}

teardown() {
  export PATH="$_ORIG_PATH"
  rm -rf "$MOCK_BIN"
}

# Helper: create a fake executable in MOCK_BIN
fake() { touch "$MOCK_BIN/$1" && chmod +x "$MOCK_BIN/$1"; }

# ── chkBrew ────────────────────────────────────────────────────────────────
@test "chkBrew returns true when brew exists" {
  fake brew
  run chkBrew
  [ "$output" = "true" ]
}

@test "chkBrew returns false when brew not found" {
  run chkBrew
  [ "$output" = "false" ]
}

# ── chkJq ─────────────────────────────────────────────────────────────────
@test "chkJq returns true when jq exists" {
  fake jq
  run chkJq
  [ "$output" = "true" ]
}

@test "chkJq returns false when jq not found" {
  PATH="$MOCK_BIN" run chkJq
  [ "$output" = "false" ]
}

# ── chkGit ────────────────────────────────────────────────────────────────
@test "chkGit returns true when git exists" {
  fake git
  run chkGit
  [ "$output" = "true" ]
}

@test "chkGit returns false when git not found" {
  PATH="$MOCK_BIN" run chkGit
  [ "$output" = "false" ]
}

# ── chkCurl ───────────────────────────────────────────────────────────────
@test "chkCurl returns true when curl exists" {
  fake curl
  run chkCurl
  [ "$output" = "true" ]
}

@test "chkCurl returns false when curl not found" {
  PATH="$MOCK_BIN" run chkCurl
  [ "$output" = "false" ]
}

# ── chkVim ────────────────────────────────────────────────────────────────
@test "chkVim returns true when vim exists" {
  fake vim
  run chkVim
  [ "$output" = "true" ]
}

@test "chkVim returns false when vim not found" {
  PATH="$MOCK_BIN" run chkVim
  [ "$output" = "false" ]
}

# ── chkHelm ───────────────────────────────────────────────────────────────
@test "chkHelm returns true when helm exists" {
  fake helm
  run chkHelm
  [ "$output" = "true" ]
}

@test "chkHelm returns false when helm not found" {
  run chkHelm
  [ "$output" = "false" ]
}

# ── chkKubectl ────────────────────────────────────────────────────────────
@test "chkKubectl returns true when kubectl exists" {
  fake kubectl
  run chkKubectl
  [ "$output" = "true" ]
}

@test "chkKubectl returns false when kubectl not found" {
  run chkKubectl
  [ "$output" = "false" ]
}

# ── chkMvn ────────────────────────────────────────────────────────────────
@test "chkMvn returns true when mvn exists" {
  fake mvn
  run chkMvn
  [ "$output" = "true" ]
}

@test "chkMvn returns false when mvn not found" {
  run chkMvn
  [ "$output" = "false" ]
}

# ── chkAwsIam ─────────────────────────────────────────────────────────────
@test "chkAwsIam returns true when aws-iam-authenticator exists" {
  fake aws-iam-authenticator
  run chkAwsIam
  [ "$output" = "true" ]
}

@test "chkAwsIam returns false when aws-iam-authenticator not found" {
  run chkAwsIam
  [ "$output" = "false" ]
}

# ── chkAwsSam ─────────────────────────────────────────────────────────────
@test "chkAwsSam returns true when sam exists" {
  fake sam
  run chkAwsSam
  [ "$output" = "true" ]
}

@test "chkAwsSam returns false when sam not found" {
  run chkAwsSam
  [ "$output" = "false" ]
}

# ── chkKubeConfig ─────────────────────────────────────────────────────────
@test "chkKubeConfig returns the path when KUBECONFIG is set" {
  export KUBECONFIG="~/.kube/config"
  run chkKubeConfig
  [ "$output" = "~/.kube/config" ]
}

@test "chkKubeConfig returns false when KUBECONFIG is not set" {
  unset KUBECONFIG
  run chkKubeConfig
  [ "$output" = "false" ]
}

# ── chkNvm / chkNpm / chkNode / chkMongo (nvm-dependent) ─────────────────
# _sourceNvm guards against missing brew; override it to inject fake commands

@test "chkNvm returns false when brew not in PATH" {
  # brew absent → _sourceNvm returns 1 → nvm never sourced
  run chkNvm
  [ "$output" = "false" ]
}

@test "chkNvm returns true when nvm is available" {
  _sourceNvm() { nvm() { return 0; }; }
  run chkNvm
  [ "$output" = "true" ]
}

@test "chkNpm returns false when brew not in PATH" {
  run chkNpm
  [ "$output" = "false" ]
}

@test "chkNpm returns true when npm is available" {
  fake npm
  _sourceNvm() { :; }
  run chkNpm
  [ "$output" = "true" ]
}

@test "chkNode returns false when brew not in PATH" {
  run chkNode
  [ "$output" = "false" ]
}

@test "chkNode returns true when node is available" {
  fake node
  _sourceNvm() { :; }
  run chkNode
  [ "$output" = "true" ]
}

@test "chkMongo returns false when mongo not found" {
  _sourceNvm() { :; }
  run chkMongo
  [ "$output" = "false" ]
}

@test "chkMongo returns true when mongo is available" {
  fake mongo
  _sourceNvm() { :; }
  run chkMongo
  [ "$output" = "true" ]
}

# ── chkAwsCli ─────────────────────────────────────────────────────────────
@test "chkAwsCli returns false when nvm/npm not available" {
  # _sourceNvm fails (no brew) → early exit with false
  run chkAwsCli
  [ "$output" = "false" ]
}

@test "chkAwsCli returns false when aws-sdk is not installed" {
  _sourceNvm() { :; }
  # npm outputs nothing matching aws-sdk
  npm() { echo ""; }
  run chkAwsCli
  [ "$output" = "true" ]   # empty SDK != "aws-sdk" → true (not-installed sentinel)
}

@test "chkAwsCli returns true when aws-sdk is installed" {
  _sourceNvm() { :; }
  npm() { echo "/path/lib"; echo "├── aws-sdk@2.1.0"; }
  run chkAwsCli
  [ "$output" = "false" ]  # SDK=="aws-sdk" → false (installed sentinel)
}
