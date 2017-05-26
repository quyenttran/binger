before do
  if logged_in?
    @user = User.find(session[:id])
  end
end

get '/users/register' do
  if logged_in?
    redirect "/users/#{@user.id}/profile"
  end
  @user = User.new
  erb :'/users/register'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect "/"
  else
    @errors = ["Something went wrong with registration!"]
    erb :'/users/register'
  end
end

get '/users/login' do
  erb :'/users/login'
end

post '/users/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    session[:id] = @user.id
    redirect "/"
  else
    @error_message = "Invalid Credentials"
    status 401
    erb :'/users/login'
  end
end

get '/users/logout' do
  session.delete(:id)
  redirect '/'
end

get '/profiles/:id' do
  @user = User.find(params[:id])
  erb :'/users/profile'
end

get '/users/:id/profile' do
  @user = User.find(params[:id])
  if session[:id] != params[:id].to_i
    erb :'users/login'
  else
    erb :'users/profile'
  end
end
