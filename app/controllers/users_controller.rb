get '/users/new' do
  if request.xhr?
    content_type :json
    form_html = erb :'users/new', layout: false
    {to_html: form_html}.to_json
  else
    erb :'users/new'
  end
end

get '/users/login' do
  if request.xhr?
    content_type :json
    form_html = erb :'users/login', layout: false
    {to_html: form_html}.to_json
  else
    erb :'users/login'
  end
end

post '/users/login' do
  if User.authenticate(params[:user])
    user = User.find_by(email: params[:user][:email])
    session[:user_id] = user.id
    redirect to "/"
  else
    @error_messages = 'Your username or password was incorrect.'
    erb :'/users/login'
  end
end

get '/users/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/users/:id' do
  if current_user
    @user = current_user
    @searches = @user.searches.order('updated_at DESC').limit(10)
    puts "request is #{request.xhr?}"
    if request.xhr?
      content_type :json
      form_html = erb :'users/show', layout: false, locals: {user: @user, searches: @searches}
      {to_html: form_html}.to_json
    else
      erb :'users/show'
    end
  else
    redirect '/'
  end
end

post '/users' do
  user = User.new_user(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/"
  else
      @error_messages = user.errors.full_messages
      erb:'users/new'
  end
end

