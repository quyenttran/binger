require 'rest-client'
require 'json'

headers = {
    content_type: :json,
    accept: :json,
  }
  response = RestClient.get "api.openweathermap.org/data/2.5/forecast?q=London,us&mode=json&APPID=81eb328690adfdc3ef0464ca1c3dad95", headers
  # { name: response[:name], humidity: response[:humidity], temp: response[:temp] }.to_json
# puts response[:list]

# puts response[:list][:main][:temp]
var = JSON.parse(response) # var is a hash
puts var["list"][0]["main"]["temp"] # temp
puts var["list"][0]["main"]["humidity"] # humidity
