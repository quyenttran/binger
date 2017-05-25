artist = Artist.create(name: 'Townes Van Zandt')
song = Song.create(name: 'Colorado Girl', artist_id: artist.id)
user = User.create(username: 'bobbo', email: 'bobbo@email.com', password: 'password')
tab = Tab.create(song_id: song.id, user_id: user.id)

lyrics = <<-LYRICS
I'm goin' out to Denver
See if I can't find
I'm goin' out to Denver
See if I can't find
That lovin' Colorado girl of mine
The promise in her smile
Shames the mountains tall
The promise in her smile
Shames the mountains tall
She bring the sun to shining
Tell the rain to fall
LYRICS

lyrics.split(' ').each do |lyric|
  Lyric.create(tab_id: tab.id, lyric: lyric)
end
