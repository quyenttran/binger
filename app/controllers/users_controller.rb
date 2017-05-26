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
    if request.xhr?
      content_type :json
      nav_html = erb :'users/_nav', layout: false
      {to_html: "<h1>Welcome back, #{user.username}!</h1>", nav: nav_html}.to_json
    else
      redirect to "/"
    end
  else
    @error_messages = 'Your username or password was incorrect.'
    if request.xhr?
      content_type :json
      nav_html = erb :'users/_nav', layout: false
      form_html = erb :'users/login', layout: false, locals: {errors: @error_messages}
      {to_html: form_html, nav: nav_html}.to_json
    else
      erb :'/users/login'
    end
  end
end

get '/users/logout' do
  session[:user_id] = nil

  if request.xhr?
    nav_html = erb :'users/_nav', layout: false
    {nav: nav_html}.to_json
  else
    redirect '/'
  end
end

get '/users/:id' do
  if current_user
    @user = current_user
    @searches = @user.searches.order('updated_at DESC').limit(20)

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
    if request.xhr?
      content_type :json
      nav_html = erb :'users/_nav', layout: false
      {to_html: "<h1>Welcome, #{user.username}!</h1>", nav: nav_html}.to_json
    else
      redirect "/"
    end
  else
      @error_messages = user.errors.full_messages
      if request.xhr?
        content_type :json
        nav_html = erb :'users/_nav', layout: false
        form_html = erb :'users/new', layout: false, locals: {errors: @error_messages}
        {to_html: form_html, nav: nav_html}.to_json
      else
        erb:'users/new'
      end
  end
end

