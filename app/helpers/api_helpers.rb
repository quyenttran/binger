require 'httparty'
require 'json'

class APIHelper

  include JSON
  include HTTParty

  base_uri 'https://api.musixmatch.com/ws/1.1'
  default_params(format: 'json', callback: 'callback')

  def initialize(key)
    self.class.default_params(apikey:key)
  end

  def get_lyrics(artist, song)
    query = {query: {q_artist: artist, q_track: song}}
    payload = get_payload(query)
    extract_lyrics(payload)
  end

  private

  def get_payload(options)
    self.class.get("/matcher.lyrics.get", options)
  end

  def extract_lyrics(payload)
    JSON.parse(payload)['message']['body']['lyrics']['lyrics_body'].remove("******* This Lyrics is NOT for Commercial use *******")
  end

end
