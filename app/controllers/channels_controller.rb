get '/channels/:id' do
  @channel = Channel.find(params[:id])
  erb :'/channels/show'
end
