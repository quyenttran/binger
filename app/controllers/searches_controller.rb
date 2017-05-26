post '/searches' do
  restclient_response = search_response(params[:search])
  @summary_html = extract_summary(restclient_response)

  if request.xhr?
    if current_user
      current_user.searches.create(name: params[:search], content: @summary_html.gsub(/<\/?[^>]*>/, "").strip)
    end
    content_type :json
    {search: @summary_html}.to_json
  else
    erb :index
  end
end
