  def get_response(name)
  response = RestClient.get "api.openweathermap.org/data/2.5/forecast?q=#{@city},us&mode=json&APPID=#{ENV["OPEN_WEATHER_API_KEY"]}", headers
  # { name: response[:name], humidity: response[:humidity], temp: response[:temp] }.to_json
  var = JSON.parse(response)
  temp = to_fahrenheit(var["list"][0]["main"]["temp"].to_i) # temp in F
  humidity = var["list"][0]["main"]["humidity"] # humidity
  weather = var["list"][0]["weather"][0]["description"] #weather
  wind = var["list"][0]["wind"]["speed"]
  weather_data = {name: name, temp: temp, humidity: humidity, weather: weather, wind: wind}
  weather_data
end
