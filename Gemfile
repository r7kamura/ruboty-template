source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rake'
gem 'rubocop'
gem 'ruboty-slack_rtm'
gem 'ruboty-tweet', github: 'Pegasus204/ruboty-tweet'
