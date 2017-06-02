get '/users' do
end

get '/users/new' do
  @user = User.new
  erb :'users/form'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    puts @errors
    erb :'users/form'
  end
end

get '/users/:id' do
  if !logged_in? then redirect '/login' end
  erb :'users/show', :locals => {user: current_user}
end

get '/users/:id/edit' do
  if !logged_in? then redirect '/login' end
  @user = current_user
  erb :'users/form'
end

put '/users/:id' do
  if !logged_in? then redirect '/login' end
  @user = current_user
  @user.assign_attributes(params[:user])
  @user.password=(params[:user][:password])
  @user.save
  redirect "/users/#{@user.id}"
end

delete '/users/:id' do
  if !logged_in? then redirect '/login' end
end
