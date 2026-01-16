---
title: Repository Archival Checklist
labels: archive
---

# Repository Archival Checklist

Use this checklist to ensure all necessary tasks are completed before archiving your repository.

## Repository Metadata
In **code.json**:
- [X] Change status to archival
- [X] Add **archived** to **tags**
- [ ] Review all fields to ensure project metadata is correct and accurate.

## Documentation
- [X] Clearly state at the top the README that the project has been deprecated and will no longer be updated.
- [ ] Include suggestions for alternate projects that provide similar functionality (if applicable).
- [ ] Update all project documentation (wikis, websites, and other documentation)
- [ ] If distributed via package managers (e.g., npm, PyPI, RubyGems): update with a deprecation warning that clearly states that the project is no longer being maintained or updated.
- [ ] Review project board
  - [ ] Apply an "archived" label to all columns or cards as necessary
  - [ ] Complete or close any open milestones
- [ ] Review wiki
  - [ ] Add a clear notice to home page about archival status
  - [ ] Check each page for completeness. Mark them as incomplete if necessary

## Issues Management
- [ ] Review all open issues
  - [ ] Close all fixed issues
  - [ ] Comment on unresolved issues to provide context
  - [ ] Apply appropriate labels to issues
  - [ ] Close issues as `won't fix` where applicable

## Pull Requests
- [ ] Review all pull requests.
  - [ ] Merge PRs that have no conflicts and pass all tests
  - [ ] Test and merge any Dependabot PRs that don't fail tests
  - [ ] Comment on any open PRs
  - [ ] Close any `'won't fix` PRs where applicable

## Outbounding / Security Review
- [ ] Review repository for secrets and keys
- [ ] Check for any Personal Identifiable Information (PII)
- [ ] Remove or redact any sensitive information found
- [ ] Review [code quality](https://github.com/DSACMS/repo-scaffolder/blob/main/tier3/checklist.md#code-review)
- [ ] Review [commit history](https://github.com/DSACMS/repo-scaffolder/blob/main/tier3/checklist.md#review-commit-history)
- [ ] Resolve code scanning and security alerts (e.g. Dependabot, CodeQL)
- [ ] Ensure CHANGELOG.md outlines completed work and the project's final state
- [ ] Review releases and tags (if applicable, Maturity Model Tier3+)

#### Communications
- [ ] Review project communication channels
  - [ ] Slack, mailing lists, forums, social media, and any other channels used for communication within the project.
  - [ ] Marketing and other internal teams should also be notified.
- [ ] Known users of the project should also be notified.

## Repository Access
- [ ] Review and audit committer access permissions
- [ ] Remove access for users who no longer need it

## Cleanup
- [ ] Delete all inactive branches
- [ ] Remove any unnecessary files or artifacts

---

**Note:** Once all items are checked off, the repository is ready for archival.
