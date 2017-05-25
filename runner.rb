require 'httparty'
require 'dotenv/load'
require 'json'

class LyricsGetter

  include HTTParty
  base_uri 'https://api.musixmatch.com/ws/1.1'
  default_params(format: 'json', callback: 'callback')

  def initialize(key)
    self.class.default_params(apikey:key)
  end

  def get_lyrics(options = {})
    self.class.get("/matcher.lyrics.get", options)
  end

end

key = ENV['MUSIXMATCHER_API_KEY']

# response = HTTParty.get('https://api.musixmatch.com/ws/1.1/matcher.lyrics.get?q_track=roxanne&callback=callback&q_artist=sting&format=jsonp' + "&apikey=#{key}")

tvz = { query: { q_track: 'colorado-girl', q_artist: 'townes-van-zandt' } }

lyricsgetter = LyricsGetter.new(key)
coloradogirl = JSON.parse(lyricsgetter.get_lyrics(tvz))
puts coloradogirl['message']['body']['lyrics']['lyrics_body']
