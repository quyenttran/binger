get '/cities' do
 erb :'city'
end

post '/cities' do
  @city = params[:name]
  @city.gsub!(" ", "+")
   headers = {
    content_type: :json,
    accept: :json
  }
  response = RestClient.get "api.openweathermap.org/data/2.5/forecast?q=#{@city},us&mode=json&APPID=#{ENV["OPEN_WEATHER_API_KEY"]}", headers
  # { name: response[:name], humidity: response[:humidity], temp: response[:temp] }.to_json
  var = JSON.parse(response)
  temp = to_fahrenheit(var["list"][0]["main"]["temp"].to_i) # temp in F
  humidity = var["list"][0]["main"]["humidity"] # humidity
  weather = var["list"][0]["weather"][0]["description"] #weather
  wind = var["list"][0]["wind"]["speed"]

  @new_city = City.new(name: params[:name], temp: temp, humidity: humidity, weather: weather, wind: wind)
  if @new_city.save
    redirect "/cities/#{@new_city.id}"
  else
    status 403
    @error_messages = @new_city.error_messages.full_messages
    erb :'index'
  end
end

get '/cities/:id' do
  @city = City.find_by(id: params[:id])
  erb :'show'
end
