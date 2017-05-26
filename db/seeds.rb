require 'dotenv'
require 'rest-client'
require 'json'
Dotenv.load

def get_channels
  online_channels = RestClient.get('http://api-public.guidebox.com/v2/channels?type=online&limit=1000', headers={Authorization: ENV['GUIDEBOX_KEY']})
  JSON.parse(online_channels)
end

channels = get_channels
channels["results"].each do |result|
  Channel.create(name: result["name"], guidebox_id: result["id"], artwork_url: result["artwork_304x171"])
end
