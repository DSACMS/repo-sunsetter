#!/usr/bin/env bats

setup() {
  SCRIPT="$BATS_TEST_DIRNAME/../../actions/fetch-tier/fetch-tier.sh"
  export GITHUB_OUTPUT="$BATS_TEST_TMPDIR/github_output.txt"
}

@test "fails when code.json file is missing" {
  run bash "$SCRIPT" "$BATS_TEST_TMPDIR/none.json"

  [ "$status" -eq 1 ]
  [[ "$output" == *"File not found"* ]]
}

@test "fails when JSON is invalid" {
  json_file="$BATS_TEST_TMPDIR/code.json"
  printf '{ invalid json\n' > "$json_file"

  run bash "$SCRIPT" "$json_file"

  [ "$status" -eq 1 ]
  [[ "$output" == *"Invalid JSON"* ]]
}

@test "fails when maturityModelTier is absent" {
  json_file="$BATS_TEST_TMPDIR/code.json"
  printf '{"name":"demo"}\n' > "$json_file"

  run bash "$SCRIPT" "$json_file"

  [ "$status" -eq 1 ]
  [[ "$output" == *"maturityModelTier not found"* ]]
}

@test "writes tier to GITHUB_OUTPUT on success" {
  run bash "$SCRIPT" "$BATS_TEST_DIRNAME/../fixtures/code.json"

  [ "$status" -eq 0 ]
  echo "$GITHUB_OUTPUT"
  grep -q '^TIER=3$' "$GITHUB_OUTPUT"
}