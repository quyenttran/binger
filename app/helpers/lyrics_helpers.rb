require 'json'

module LyricsHelpers

  include JSON

  def create_lyric(tab, lyric)
    Lyric.create(lyric: lyric)
  end

  def print_lyrics(lyrics)
    printout = ""
    lyrics.split(" ").each_with_index { |lyric, index| printout.concat(" " + print(lyric, index)) }
    printout
  end

  private

  def print(lyric, index)
    lyric_val = lyric.gsub('\'','&#39;')
    if lyric.downcase == lyric
      "<div class='lyric-container'><input class='lyric_lyric' name='chords[#{index}]'><label class='lyric_lyric'><input type='hidden' name='lyrics[#{index}]' value='#{lyric_val}'>#{lyric}</label></div>"
    else
      "<br><div class='lyric-container'><input class='lyric_lyric' name='chords[#{index}]'><label class='lyric_lyric'><input type='hidden' name='lyrics[#{index}]' value='#{lyric_val}'>#{lyric}</label></div>"
    end
  end

end

helpers LyricsHelpers
