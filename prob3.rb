require 'httparty'
require 'json'

response = HTTParty.get('http://worldtimeapi.org/api/timezone/Europe/London')

if response.code == 200
  time = JSON.parse(response.body)

  current_datetime = time['datetime']

  format_datetime = DateTime.parse(current_datetime).strftime("%Y-%m-%d %H:%M:%S")

  puts "The current time in Europe/London is #{format_datetime}"
else
  puts 'Failed to access time data for Europe/London.'
end
