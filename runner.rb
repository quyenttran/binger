require 'httparty'
require 'dotenv/load'
require 'json'

class LyricsGetter

  include HTTParty
  base_uri 'https://api.musixmatch.com/ws/1.1'
  # default_params =

  def initialize(track, artist, key)
    @options = { query: {
      format: 'json',
      callback: 'callback',
      q_track: track,
      q_artist: artist,
      apikey: key } }
  end

  def get_lyrics
    self.class.get("/matcher.lyrics.get", @options)
  end

end

key = ENV['MUSIXMATCHER_API_KEY']

# response = HTTParty.get('https://api.musixmatch.com/ws/1.1/matcher.lyrics.get?format=jsonp&callback=callback&q_track=roxanne&q_artist=sting' + "&apikey=#{key}")

roxanne = LyricsGetter.new('roxanne', 'sting', key)
roxanne_lyrics = JSON.parse(roxanne.get_lyrics)
puts roxanne_lyrics['message']['body']['lyrics']['lyrics_body']
