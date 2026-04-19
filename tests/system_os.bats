#!/usr/bin/env bats
# Tests for getOS (scripts/util.sh) and search utility

setup() {
  MOCK_BIN="$(mktemp -d)"
  export MOCK_BIN
  export _ORIG_PATH="$PATH"
  export PATH="$MOCK_BIN:/usr/bin:/bin"

  cd "$BATS_TEST_DIRNAME/.."
  source scripts/util.sh
}

teardown() {
  export PATH="$_ORIG_PATH"
  rm -rf "$MOCK_BIN"
}

# ── getOS ─────────────────────────────────────────────────────────────────
@test "getOS returns Mac on Darwin" {
  uname() { echo "Darwin"; }
  run getOS
  [ "$output" = "Mac" ]
}

@test "getOS returns Lin on Linux" {
  uname() { echo "Linux"; }
  run getOS
  [ "$output" = "Lin" ]
}

@test "getOS returns Win on Cygwin" {
  uname() { echo "Cygwin"; }
  run getOS
  [ "$output" = "Win" ]
}

@test "getOS returns Win on MINGW64" {
  uname() { echo "MINGW64_NT-10.0"; }
  run getOS
  [ "$output" = "Win" ]
}

@test "getOS returns unknown for unrecognized kernel" {
  uname() { echo "FreeBSD"; }
  run getOS
  [ "$output" = "unknown" ]
}

# ── search ────────────────────────────────────────────────────────────────
@test "search returns true when text is found in file" {
  echo "if [ -f ~/.bashrc ]; then source ~/.bashrc; fi" > "$MOCK_BIN/profile"
  run search "source" "$MOCK_BIN/profile"
  [ "$output" = "true" ]
}

@test "search returns true for another string in file" {
  echo "hello world" > "$MOCK_BIN/profile"
  run search "hello" "$MOCK_BIN/profile"
  [ "$output" = "true" ]
}

@test "search returns false when text is not in file" {
  echo "hello world" > "$MOCK_BIN/profile"
  run search "foobar" "$MOCK_BIN/profile"
  [ "$output" = "false" ]
}
