require 'json'

module TabsHelpers

  include JSON

  def create_tab(user_id, song_id, lyrics_string)
    tab = Tab.create(user_id: user_id, song_id: song_id)
  end

  private

end

helpers TabsHelpers
