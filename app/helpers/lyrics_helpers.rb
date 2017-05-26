require 'json'

module LyricsHelpers

  include JSON

  def create_lyric(tab, lyric)
    Lyric.create(lyric: lyric)
  end

  def print_lyrics(lyrics)
    printout = ''
    lyrics.split(' ').each { |lyric| printout.concat(' ' + print(lyric)) }
    printout
  end

  private

  def print(lyric)
    if lyric.downcase == lyric
      "<span class='lyric_lyric'>#{lyric}</span>"
    else
      "<br><span class='lyric_lyric'>#{lyric}</span>"
    end
  end

  # def print_stanza

  # end


end

helpers LyricsHelpers
