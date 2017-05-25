get '/cities' do
 erb :'city'
end

post '/cities' do
  @city = params[:name]
   headers = {
    content_type: :json,
    accept: :json
  }
  response = RestClient.get "api.openweathermap.org/data/2.5/forecast?q=#{@city},us&mode=xml", headers
  { name: response[:name], humidity: response[:humidity], temp: response[:temp] }.to_json
  # @city = City.new(name: response[:name], )
  # redierct 'cities/:id'
end
