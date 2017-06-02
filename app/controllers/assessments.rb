# before '/potlucks/*' do
#   if !logged_in? then redirect '/login' end
# end

# get '/' do
#   redirect '/potlucks'
# end

# get '/potlucks' do
#   @potlucks = Potluck.all.sort_by(&:date)
#   erb :'potlucks/index'
# end

# get '/potlucks/new' do
#   @potluck = Potluck.new
#   if request.xhr?
#     content_type :json
#     html = erb :'potlucks/_form', layout: false, locals: { potluck: @potluck }
#     {html: html}.to_json
#   else
#     erb :'potlucks/_form', locals: { potluck: @potluck }
#   end
# end

# post '/potlucks' do
#   starts_at = DateTime.parse("#{params[:date]} #{params[:time]}")
#   @potluck = Potluck.new(params[:potluck].merge(date: starts_at, creator: current_user))
#   if @potluck.valid?
#     @potluck.save
#     # if request.xhr?
#     #   "<li><h3><a href='potlucks/#{potluck.id}'>#{potluck.name}</a></h3><p>Location: #{potluck.location}</p><p>Starts At: #{potluck.date}</p></li>"
#     # else
#       redirect "/potlucks/#{@potluck.id}"
#     # end
#   else
#     status 422
#     erb :'potlucks/_form', locals: { potluck: @potluck }
#   end
# end

# get '/potlucks/:id' do |id|
#   @potluck = Potluck.find(id)
#   erb :'/potlucks/show', locals: { potluck: @potluck}
# end

# get '/potlucks/:id/edit' do |id|
#   @potluck = Potluck.find(id)
#   if request.xhr?
#     content_type :json
#     html = erb :'potlucks/_form', layout: false, locals: { potluck: @potluck }
#     {html: html}.to_json
#   else
#     erb :'potlucks/_form', locals: { potluck: @potluck }
#   end
# end

# put '/potlucks/:id' do
#   @potluck = Potluck.find(params[:id])
#   @potluck.assign_attributes(params[:potluck])
#   if @potluck.valid?
#     @potluck.save
#     redirect "/potlucks/#{@potluck.id}"
#   else
#     status 422
#     erb :'potlucks/_form', locals: { potluck: @potluck }
#   end
# end

# delete '/potlucks/:id' do
#   @potluck = Potluck.find(params[:id])
#   @potluck.destroy
#     redirect "/"
# end
