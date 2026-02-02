---
title: Repository Archival Checklist
labels: archive
---

# CMS.gov Repository Archival Checklist

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

## Issues Management
- [ ] Review all open issues
  - [ ] Close all fixed issues
  - [ ] Comment on unresolved issues to provide context
  - [ ] Apply appropriate labels to issues
  - [ ] Close issues as `won't fix` where applicable

## Security Review
- [ ] Review repository for secrets and keys
- [ ] Check for any Personal Identifiable Information (PII)
- [ ] Remove or redact any sensitive information found

## Repository Access
- [ ] Review and audit committer access permissions
- [ ] Remove access for users who no longer need it

## Cleanup
- [ ] Delete all inactive branches
- [ ] Remove any unnecessary files or artifacts

---

**Note:** Once all items are checked off, the repository is ready for archival.