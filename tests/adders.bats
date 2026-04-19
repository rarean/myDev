#!/usr/bin/env bats
# Tests for scripts/adders.sh — verifies skip-when-installed and install paths

setup() {
  MOCK_BIN="$(mktemp -d)"
  export MOCK_BIN
  export _ORIG_PATH="$PATH"
  export PATH="$MOCK_BIN:/usr/bin:/bin"

  cd "$BATS_TEST_DIRNAME/.."
  source scripts/chkers.sh
  source scripts/util.sh
  source scripts/adders.sh
}

teardown() {
  export PATH="$_ORIG_PATH"
  rm -rf "$MOCK_BIN"
}

# ── addJq ─────────────────────────────────────────────────────────────────
@test "addJq upgrades when already installed" {
  chkJq()  { echo true; }
  brew() { echo "brew $*"; }
  run addJq
  [ "$output" = "brew upgrade jq" ]
}

@test "addJq installs when not present and brew available" {
  chkJq()  { echo false; }
  chkBrew() { echo true; }
  # Return empty for "ls --versions" (simulates not installed), echo otherwise
  brew() { [[ "$1" == "ls" ]] && return 0 || echo "brew $*"; }
  run addJq
  [ "$output" = "brew install jq" ]
}

# ── addHelm ───────────────────────────────────────────────────────────────
@test "addHelm upgrades when already installed" {
  chkHelm() { echo true; }
  brew() { echo "brew $*"; }
  run addHelm
  [ "$output" = "brew upgrade helm" ]
}

@test "addHelm installs when not present and brew available" {
  chkHelm() { echo false; }
  chkBrew() { echo true; }
  brew() { [[ "$1" == "ls" ]] && return 0 || echo "brew $*"; }
  run addHelm
  [ "$output" = "brew install helm" ]
}

# ── addKubectl ────────────────────────────────────────────────────────────
@test "addKubectl upgrades when already installed" {
  chkKubectl() { echo true; }
  brew() { echo "brew $*"; }
  run addKubectl
  [ "$output" = "brew upgrade kubectl" ]
}

@test "addKubectl installs when not present and brew available" {
  chkKubectl() { echo false; }
  chkBrew()    { echo true; }
  brew() { [[ "$1" == "ls" ]] && return 0 || echo "brew $*"; }
  run addKubectl
  [ "$output" = "brew install kubectl" ]
}

# ── addMvn ────────────────────────────────────────────────────────────────
@test "addMvn upgrades when already installed" {
  chkMvn() { echo true; }
  brew() { echo "brew $*"; }
  run addMvn
  [ "$output" = "brew upgrade maven" ]
}

@test "addMvn installs when not present and brew available" {
  chkMvn()  { echo false; }
  chkBrew() { echo true; }
  brew() { [[ "$1" == "ls" ]] && return 0 || echo "brew $*"; }
  run addMvn
  [ "$output" = "brew install maven" ]
}

# ── addAwsIam ─────────────────────────────────────────────────────────────
@test "addAwsIam upgrades when already installed" {
  chkAwsIam() { echo true; }
  brew() { echo "brew $*"; }
  run addAwsIam
  [ "$output" = "brew upgrade aws-iam-authenticator" ]
}

@test "addAwsIam installs when not present and brew available" {
  chkAwsIam() { echo false; }
  chkBrew()   { echo true; }
  brew() { [[ "$1" == "ls" ]] && return 0 || echo "brew $*"; }
  run addAwsIam
  [ "$output" = "brew install aws-iam-authenticator" ]
}

# ── addAwsCli ─────────────────────────────────────────────────────────────
@test "addAwsCli returns immediately when already installed" {
  chkAwsCli() { echo true; }
  run addAwsCli
  [ "$status" -eq 0 ]
  [ -z "$output" ]
}
