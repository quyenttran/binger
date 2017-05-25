require 'json'

module LyricsHelpers

  include JSON

  def parse_response(rseponse)
    JSON.parse
  end

  def extract_lyrics

  end

end

helpers LyricsHelpers
