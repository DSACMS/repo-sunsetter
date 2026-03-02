#!/usr/bin/env bats

setup() {
  SCRIPT="$BATS_TEST_DIRNAME/../../actions/create-issue/download-checklist.sh"

  mock_bin="$BATS_TEST_TMPDIR/bin"
  mkdir -p "$mock_bin"
  cp "$BATS_TEST_DIRNAME/../helpers/mock_wget.sh" "$mock_bin/wget"
  chmod +x "$mock_bin/wget"

  export PATH="$mock_bin:$PATH"
  export MOCK_WGET_LOG="$BATS_TEST_TMPDIR/wget_url.log"
}

@test "tier 0 downloads basic checklist" {
  run env TIER=0 bash "$SCRIPT"

  [ "$status" -eq 0 ]
  grep -q "BASIC_ARCHIVAL_CHECKLIST.md" "$MOCK_WGET_LOG"
  [ -f temp_checklist.md ]
  rm -f temp_checklist.md
}

@test "tier 1 downloads basic checklist" {
  run env TIER=1 bash "$SCRIPT"

  [ "$status" -eq 0 ]
  grep -q "BASIC_ARCHIVAL_CHECKLIST.md" "$MOCK_WGET_LOG"
  [ -f temp_checklist.md ]
  rm -f temp_checklist.md
}

@test "tier 2 downloads comprehensive checklist" {
  run env TIER=2 bash "$SCRIPT"

  [ "$status" -eq 0 ]
  grep -q "COMPREHENSIVE_ARCHIVAL_CHECKLIST.md" "$MOCK_WGET_LOG"
  [ -f temp_checklist.md ]
  rm -f temp_checklist.md
}

@test "tier 3 downloads comprehensive checklist" {
  run env TIER=3 bash "$SCRIPT"

  [ "$status" -eq 0 ]
  grep -q "COMPREHENSIVE_ARCHIVAL_CHECKLIST.md" "$MOCK_WGET_LOG"
  [ -f temp_checklist.md ]
  rm -f temp_checklist.md
}

@test "tier 4 downloads comprehensive checklist" {
  run env TIER=4 bash "$SCRIPT"

  [ "$status" -eq 0 ]
  grep -q "COMPREHENSIVE_ARCHIVAL_CHECKLIST.md" "$MOCK_WGET_LOG"
  [ -f temp_checklist.md ]
  rm -f temp_checklist.md
}

@test "tier -1 uses custom checklist URL argument" {
  custom_url="https://raw.githubusercontent.com/example/custom.md"

  run env TIER=-1 bash "$SCRIPT" "$custom_url"

  [ "$status" -eq 0 ]
  grep -q "$custom_url" "$MOCK_WGET_LOG"
  [ -f temp_checklist.md ]
  rm -f temp_checklist.md
}

@test "fails for unknown tier" {
  run env TIER=5 bash "$SCRIPT"

  [ "$status" -eq 1 ]
  [[ "$output" == *"Unknown tier"* ]]
}
