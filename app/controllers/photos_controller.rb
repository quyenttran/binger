get '/photos' do
  erb :'index'
end

post '/photos' do
  response = HTTParty.get("POST https://vision.googleapis.com/v1/images:annotate")

# request = {
#   "requests":[
#     {"image":
#       {"content":"/9j/7QBEUGhvdG9...image contents...eYxxxzj/Coa6Bax//Z"},
#     "features":[
#       {"type":"LABEL_DETECTION",
#         "maxResults":1}
#     ]}
#   ]
# }.to_json

end
