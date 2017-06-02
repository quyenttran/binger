# before '/shows/*' do
#   if !logged_in? then redirect '/login' end
# end

get '/' do
  erb :index
end

# get '/shows' do
#   @shows = Show.all.sort_by(&:date)
#   erb :'shows/index'
# end

get '/shows/form' do
  @by = params[:by]
  if request.xhr?
    erb :'shows/__form', layout: false
  else
    erb :'shows/__form'
  end
end

get '/shows/find' do
  @by = params[:by].downcase
  @val = params[:val]
  @result = search(@by, @val)
  p @result
  puts "\n\n"
  p artwork_for(@result[0]["show_title"])
  if request.xhr?
    erb :'shows/result', layout: false, locals: {result: @result}
  else
    erb :'shows/result', locals: {result: @result}
  end
end

get '/shows/new' do
  # @show = Show.new
  # if request.xhr?
  #   content_type :json
  #   html = erb :'shows/_form', layout: false, locals: { show: @show }
  #   {html: html.to_json
  # else
    erb :'shows/_form', locals: { show: @show }
  # end
end

post '/shows' do
  starts_at = DateTime.parse("#{params[:date]} #{params[:time]}")
  @show = Show.new(params[:show].merge(date: starts_at, creator: current_user))
  if @show.valid?
    @show.save
    # if request.xhr?
    #   "<li><h3><a href='shows/#{Show.id}'>#{Show.name}</a></h3><p>Location: #{Show.location}</p><p>Starts At: #{Show.date}</p></li>"
    # else
      redirect "/shows/#{@show.id}"
    # end
  else
    status 422
    erb :'shows/_form', locals: { show: @show }
  end
end

get '/shows/:id' do |id|
  @show = Show.find(id)
  erb :'/shows/show', locals: { show: @show}
end

get '/shows/:id/edit' do |id|
  @show = Show.find(id)
  if request.xhr?
    content_type :json
    html = erb :'shows/_form', layout: false, locals: { show: @show }
    {html: html}.to_json
  else
    erb :'shows/_form', locals: { show: @show }
  end
end

put '/shows/:id' do
  @show = Show.find(params[:id])
  @show.assign_attributes(params[:show])
  if @show.valid?
    @show.save
    redirect "/shows/#{@show.id}"
  else
    status 422
    erb :'shows/_form', locals: { show: @show }
  end
end

delete '/shows/:id' do
  @show = Show.find(params[:id])
  @show.destroy
    redirect "/"
end
