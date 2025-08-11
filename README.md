# Kira Stale Bot

[![wemake.services](https://img.shields.io/badge/%20-wemake.services-green.svg?label=%20&logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAABGdBTUEAALGPC%2FxhBQAAAAFzUkdCAK7OHOkAAAAbUExURQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP%2F%2F%2F5TvxDIAAAAIdFJOUwAjRA8xXANAL%2Bv0SAAAADNJREFUGNNjYCAIOJjRBdBFWMkVQeGzcHAwksJnAPPZGOGAASzPzAEHEGVsLExQwE7YswCb7AFZSF3bbAAAAABJRU5ErkJggg%3D%3D)](https://wemake-services.github.io)
[![kira-family](https://img.shields.io/badge/kira-family-pink.svg)](https://github.com/wemake-services/kira)
[![test](https://github.com/wemake-services/kira-stale/actions/workflows/test.yml/badge.svg?branch=master&event=push)](https://github.com/wemake-services/kira-stale/actions/workflows/test.yml)

Automate routine work with stale GitLab issues, merge requests and branches.

Part of the [`@kira`](https://github.com/wemake-services/kira) bots family.


## Adding new actions

Policy:
1. All actions must be idempotent: multiple runs – the same state
2. All actions must make sense for all projects
3. Dry run your script several times with `--dry-run` flag to make sure it works


## Installation

We use [`gitlab-triage`](https://gitlab.com/gitlab-org/ruby/gems/gitlab-triage) inside.
So, consult [their docs](https://gitlab.com/gitlab-org/gitlab-triage)
about deployment and usage.

You can even have a look at [GitLab's internal policies](https://gitlab.com/gitlab-org/quality/triage-ops/blob/master/policies).

It is possible to use this setup with `.gitlab-ci.yml` and Heroku.

### Labels setup

You will need to create this set of labels:
- `deadline::soft`
- `deadline::hard`
- `deadline::miss`
- `validation:labels`
- `validation:stale`
- `validation:estimate`
- `validation:invalid`
- `mr::processed`

You can use [`kira-setup`](https://github.com/wemake-services/kira-setup) to create these labels for you.

### Using `docker`

We ship a `docker` image that can be used as:

```bash
docker pull wemake-services/kira-stale:latest

docker run --rm wemake-services/kira-stale \
  gitlab-triage \
  --source-id="your-gitlab-project-int-id" \
  --token="your-gitlab-token-with-api-perm"
```


## License

[MIT](./LICENSE)
