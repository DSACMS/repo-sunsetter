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
  title=$(sed -n '1p' "$workdir/README.md")
  warning_banner=$(sed -n '2p' "$workdir/README.md")
  notice=$(sed -n '3p' "$workdir/README.md")
  description=$(sed -n '6p' "$workdir/README.md")
  [ "$title" = "# Web Dashboard" ]
  [ "$warning_banner" = "> [!WARNING]" ]
  [ "$notice" = "> This repository is archived." ]
  echo "fourth_line: $fourth_line"
  [ "$description" = "This is a test project!" ]
}