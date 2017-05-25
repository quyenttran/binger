# require 'rest-client'
# require 'json'

# headers = {
#     content_type: :json,
#     accept: :json,
#   }

#   response = RestClient.get "api.openweathermap.org/data/2.5/forecast?q=London,us&mode=json&APPID=#{ENV["OPEN_WEATHER_API_KEY"]}", headers
#   # { name: response[:name], humidity: response[:humidity], temp: response[:temp] }.to_json
# # puts response[:list]
# def to_fahrenheit(temp)
#   temp * (9/5.0) - 459.67
# end

# # puts response[:list][:main][:temp]
# var = JSON.parse(response) # var is a hash

# temp = to_fahrenheit(var["list"][0]["main"]["temp"].to_i) # temp in F
# puts "#{temp} degrees fahrenheit"
# humidity = var["list"][0]["main"]["humidity"] # humidity
# puts "#{humidity}\% humidity "
# weather = var["list"][0]["weather"][0]["description"] #weather
# puts "#{weather} today"
# wind = var["list"][0]["wind"]["speed"]
# puts "Wind of #{wind}mph"
