require 'dotenv'
require 'rest-client'
require 'json'
Dotenv.load


def get_shows(channel, genre)
  all_shows = RestClient.get("http://api-public.guidebox.com/v2/shows?channel=#{channel}&genre=#{genre}&limit=250", headers={Authorization: ENV['GUIDEBOX_KEY']})
  JSON.parse(all_shows)
end

def get_channels
  online_channels = RestClient.get('http://api-public.guidebox.com/v2/channels?type=online&limit=1000', headers={Authorization: ENV['GUIDEBOX_KEY']})
  JSON.parse(online_channels)
end

def get_genres
  genres = RestClient.get('http://api-public.guidebox.com/v2/genres', headers={Authorization: ENV['GUIDEBOX_KEY']})
end

channels = get_channels
channels["results"].each do |result|
  Channel.create(name: result["name"], guidebox_id: result["id"], artwork_url: result["artwork_304x171"], short_name: result["short_name"])
end


