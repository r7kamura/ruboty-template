source "https://rubygems.org"

gem "ruboty"

# Chat adapter used in production (RUBOTY_ENV=production).
# Without it, ruboty falls back to the built-in shell adapter.
group :production do
  gem "ruboty-slack_events"
end

# Add handler plugins here, for example:
# gem "ruboty-cron"
# gem "ruboty-redis"
