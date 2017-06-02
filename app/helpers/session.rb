helpers do
  def current_user
    @current_user ||= User.find_by(id: session[:id])
  end

  def logged_in?
    !current_user.nil?
  end

  def user_form_action(user)
    user.persisted? ? "/users/#{user.id}" : "/users"
  end

end
