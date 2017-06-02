get '/' do
  erb :index
end

get '/login' do
  @user = User.new
  erb :'sessions/login'
end

post '/login' do
  user_params = params[:user]
  puts user_params

  @user = User.authenticate(user_params[:username], user_params[:password])
  puts @user.inspect
  if @user
    session[:id] = @user.id
    redirect "users/#{current_user.id}"
  else
    status 422
    @user=User.new
    erb :'sessions/login'
  end
end

get '/logout' do
  erb :'sessions/logout_form'
end

delete '/logout' do
  session.clear
  redirect :'/'
end
