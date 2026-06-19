# Kira Stale Bot

[![wemake.services](https://img.shields.io/badge/%20-wemake.services-green.svg?label=%20&logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAABGdBTUEAALGPC%2FxhBQAAAAFzUkdCAK7OHOkAAAAbUExURQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP%2F%2F%2F5TvxDIAAAAIdFJOUwAjRA8xXANAL%2Bv0SAAAADNJREFUGNNjYCAIOJjRBdBFWMkVQeGzcHAwksJnAPPZGOGAASzPzAEHEGVsLExQwE7YswCb7AFZSF3bbAAAAABJRU5ErkJggg%3D%3D)](https://wemake-services.github.io)
[![kira-family](https://img.shields.io/badge/kira-family-pink.svg)](https://github.com/wemake-services/kira)
[![Build Status](https://github.com/wemake-services/kira-stale/actions/workflows/test.yml/badge.svg?branch=master)](https://github.com/wemake-services/kira-stale/actions/workflows/test.yml)
[![Dependencies Status](https://img.shields.io/badge/dependencies-up%20to%20date-brightgreen.svg)](https://github.com/wemake-services/kira-stale/pulls?utf8=%E2%9C%93&q=is%3Apr%20author%3Aapp%2Fdependabot)

Automation for stale GitLab issues, merge requests, and branches.

Part of the [`@kira`](https://github.com/wemake-services/kira) bots family.

`kira-stale` packages a ready-to-run [`gitlab-triage`](https://gitlab.com/gitlab-org/ruby/gems/gitlab-triage)
policy in a Docker image, so teams can keep project queues clean without
rewriting the same repository maintenance rules for every project.

## Features

- [x] Marks stale issues after long inactivity and closes them later
- [x] Validates issue labels and highlights broken label combinations
- [x] Flags issues without descriptions as invalid and closes them automatically
- [x] Detects issues and merge requests without time tracking metadata
- [x] Escalates issue deadlines with `deadline::*` labels
- [x] Copies metadata from linked issues to merge requests
- [x] Marks stale merge requests that need review or follow-up
- [x] Closes invalid merge requests automatically
- [x] Deletes merged, stale branches after a retention period

## Installation

Requirements:

- Docker
- An existing GitLab project
- A GitLab access token with `api` permissions
- The labels expected by the triage policy

```bash
docker pull wemakeservices/kira-stale
```

## Quick Start

Test the policy in dry-run mode first:

```bash
docker run --rm wemakeservices/kira-stale \
  gitlab-triage \
  --dry-run \
  --source-id="your-gitlab-project-int-id" \
  --token="your-gitlab-token-with-api-perm"
```

Run it for real once the output looks correct:

```bash
docker run --rm wemakeservices/kira-stale \
  gitlab-triage \
  --source-id="your-gitlab-project-int-id" \
  --token="your-gitlab-token-with-api-perm"
```

Advanced deployment and scheduling options come from
[`gitlab-triage` docs](https://gitlab.com/gitlab-org/ruby/gems/gitlab-triage).
GitLab's own
[triage policies](https://gitlab.com/gitlab-org/quality/triage-ops/blob/master/policies)
are also a useful reference.

## Required Labels

The bundled policy expects these labels to exist:

- `deadline::soft`
- `deadline::hard`
- `deadline::miss`
- `validation:labels`
- `validation:stale`
- `validation:estimate`
- `validation:invalid`
- `mr::processed`

> Unlike `deadline::*` and `mr::*`, the `validation:*` group intentionally uses
one `:` instead of GitLab scoped labels. Several validation labels can be
present on the same issue or merge request at the same time.

You can use [`kira-setup`](https://github.com/wemake-services/kira-setup)
to create these labels for you.

## Why Use It

We use this bot to keep GitLab projects in a predictable state.
Instead of handling stale items, broken labels, deadline reminders, and cleanup
rules manually, `kira-stale` applies the same policy every time through one
reusable Docker image.

## Related Projects

- [`kira`](https://github.com/wemake-services/kira): the full bots family
- [`kira-setup`](https://github.com/wemake-services/kira-setup): project setup
  and shared labels for new repositories
- [`kira-release`](https://github.com/wemake-services/kira-release): automated
  semantic releases
