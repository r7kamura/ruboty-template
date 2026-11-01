# ruboty-template

A template to start your own [ruboty](https://github.com/r7kamura/ruboty) bot.

It runs with the built-in shell adapter on your machine, and with [ruboty-slack_events](https://github.com/tomoasleep/ruboty-slack_events) (Slack Socket Mode) in production.

## Requirements

- Ruby 3.3 or later
- Or Docker

## Run locally

```bash
bundle install
bundle exec ruboty
```

This starts ruboty with the shell adapter. Try `ruboty ping` or `ruboty help`, and type `exit` to quit.

## Add plugins

Add handler or brain plugins to `Gemfile`, then run `bundle install`.

```ruby
gem "ruboty-cron"
gem "ruboty-redis"
```

See the [ruboty README](https://github.com/r7kamura/ruboty#readme) for available plugins.

## Connect to Slack

ruboty-slack_events receives messages over [Socket Mode](https://docs.slack.dev/apis/events-api/using-socket-mode), so you don't need a public URL.

1. Create a new app at https://api.slack.com/apps, choose "From an app manifest", and paste the manifest below.
2. In "Basic Information", under "App-Level Tokens", create a token with the `connections:write` scope. This is `SLACK_APP_TOKEN` (`xapp-...`).
3. Install the app to your workspace. Copy the "Bot User OAuth Token" from "OAuth & Permissions". This is `SLACK_TOKEN` (`xoxb-...`).
4. Invite the bot to a channel with `/invite @ruboty`.

```yaml
display_information:
  name: ruboty
features:
  bot_user:
    display_name: ruboty
    always_online: true
oauth_config:
  scopes:
    bot:
      - channels:history
      - chat:write
      - users:read
settings:
  event_subscriptions:
    bot_events:
      - message.channels
  socket_mode_enabled: true
```

To use it in private channels too, add the `groups:history` scope and the `message.groups` event.

Then copy `.env.example` to `.env`, fill in the tokens, and run:

```bash
RUBOTY_ENV=production bundle exec ruboty --dotenv
```

`RUBOTY_ENV=production` loads the `production` group in `Gemfile`, which contains the Slack adapter. To use another chat service, replace `ruboty-slack_events` with its adapter.

### Environment variables

| Name | Description |
| --- | --- |
| `RUBOTY_ENV` | Gemfile group to load. Use `production` to load the Slack adapter. |
| `RUBOTY_NAME` | Name the bot responds to (default: `ruboty`). |
| `SLACK_TOKEN` | Bot User OAuth Token (`xoxb-...`). |
| `SLACK_APP_TOKEN` | App-level token with `connections:write` (`xapp-...`). |

## Deploy

ruboty is a single long-running process. It needs no inbound port, so any host that keeps a process or container running will do.

### Docker

```bash
docker build -t ruboty .
docker run --env-file .env ruboty
```

The image sets `RUBOTY_ENV=production`.

### Without Docker

Run `RUBOTY_ENV=production bundle exec ruboty --dotenv` under a process manager such as systemd, and have it restart on failure.

If you use a plugin that stores memory, add a brain such as [ruboty-redis](https://github.com/r7kamura/ruboty-redis) so it survives restarts.
