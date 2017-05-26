get '/cities' do
 erb :'city'
end

post '/cities' do
  @city = params[:name]
  @city.gsub!(" ", "+")
  headers = { content_type: :json, accept: :json }
  @new_city = City.new(get_response(params[:name]))
  if @new_city.save
    if request.xhr?
      content_type :json
      variable = erb(:'_table_partial', layout: false, locals: {city: @new_city})
      { as_html: variable}.to_json
    else
    redirect "/cities/#{@new_city.id}"
    end
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
