# Kira Stale Bot

[![wemake.services](https://img.shields.io/badge/%20-wemake.services-green.svg?label=%20&logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAABGdBTUEAALGPC%2FxhBQAAAAFzUkdCAK7OHOkAAAAbUExURQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP%2F%2F%2F5TvxDIAAAAIdFJOUwAjRA8xXANAL%2Bv0SAAAADNJREFUGNNjYCAIOJjRBdBFWMkVQeGzcHAwksJnAPPZGOGAASzPzAEHEGVsLExQwE7YswCb7AFZSF3bbAAAAABJRU5ErkJggg%3D%3D)](https://wemake.services)
[![kira-family](https://img.shields.io/badge/kira-family-pink.svg)](https://github.com/wemake-services/kira)
[![Build Status](https://travis-ci.org/wemake-services/kira-stale.svg?branch=master)](https://travis-ci.org/wemake-services/kira-stale)
[![Dependencies Status](https://img.shields.io/badge/dependencies-up%20to%20date-brightgreen.svg)](https://github.com/wemake-services/kira-stale/pulls?utf8=%E2%9C%93&q=is%3Apr%20author%3Aapp%2Fdependabot)

Automate routine work with stale GitLab issues and merge requests.

Part of the [`@kira`](https://github.com/wemake-services/kira) bots family.


## Adding new actions

Policy:
1. All actions must be idempotent: multiple runs – the same state
2. All actions must make sense for all projects
3. Dry run your script several times with `--dry-run` flag to make sure it works


## Installation

We use `gitlab-triage` inside.
So, consult [their docs](https://gitlab.com/gitlab-org/gitlab-triage)
about deployment and usage.

You can even have a look at [GitLab's internal policies](https://gitlab.com/gitlab-org/quality/triage-ops/blob/master/policies).

It is possible to use this setup with `.gitlab-ci.yml` and Heroku.

### Labels setup

You will need to create this set of labels:
- `deadline:soft`
- `deadline:hard`
- `deadline:miss`
- `validation:labels`
- `validation:stale`
- `validation:estimate`
- `validation:invalid`
- `notification:first`
- `notification:last`

You can use [`kira-setup`](https://github.com/wemake-services/kira-setup) to create these labels for you.

### Heroku setup

To setup a new Heroku server you will need to:
1. Setup a [scheduler](https://elements.heroku.com/addons/scheduler)
2. Setup all env vars with tokens and ids
3. Enjoy!

Use `worker` process type to run inside a scheduler every 10 minutes.
Make sure to fill all env vars with the correct values.


### GitLab CI setup

You can generate `.gitlab-ci.yml` file to run this script as scheduled events:
1. Use `--init-ci` to generate default `.gitlab-ci.yml` file
2. Enable [scheduled builds in CI](https://docs.gitlab.com/ee/user/project/pipelines/schedules.html)
