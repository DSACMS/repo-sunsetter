#!/usr/bin/env bats

setup() {
  SCRIPT="$BATS_TEST_DIRNAME/../../actions/update-readme/update-readme.sh"
}

@test "inserts archive notice after first top-level heading" {
  workdir="$BATS_TEST_TMPDIR/work"
  mkdir -p "$workdir"

  cat > "$workdir/README.md" <<'EOF'
# Web Dashboard

This is a test project!
EOF

  run env ARCHIVE_NOTICE_TEXT="This repository is archived." bash -c "cd '$workdir' && bash '$SCRIPT'"

  [ "$status" -eq 0 ]
  first_line=$(sed -n '1p' "$workdir/README.md")
  second_line=$(sed -n '2p' "$workdir/README.md")
  third_line=$(sed -n '3p' "$workdir/README.md")
  [ "$first_line" = "# Web Dashboard" ]
  [ "$second_line" = "> [!WARNING]" ]
  [ "$third_line" = "> This repository is archived." ]
}