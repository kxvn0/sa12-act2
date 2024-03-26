require 'httparty'
require 'json'

response = HTTParty.get("https://api.github.com/users/kxvn0/repos")

if response.code == 200
  repos = JSON.parse(response.body)

  if repos.any?
    most_star_repo = repos.max_by { |repo| repo['stargazers_count'] }

    puts "Most Starred Repository:"
    puts "Name: #{most_star_repo['name']}"
    puts "Description: #{most_star_repo['description'] || 'N/A'}"
    puts "Stars: #{most_star_repo['stargazers_count']}"
    puts "URL: #{most_star_repo['html_url']}"
  else
    puts "No repos found for kxvn0."
  end
else
  puts "Failed to fetch repos for kxvn0."
end
