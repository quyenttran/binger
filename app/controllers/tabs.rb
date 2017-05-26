# Show
get '/tabs/:id' do
  @tab = Tab.find(params['id'])
  song = @tab.song
  @artist = song.artist.name
  @song = song.name
  erb :'/tabs/show'
end

# New
get '/tabs/new' do
  erb :'/tabs/new'
end

# Create
post '/tabs' do
  artist = Artist.find_or_create_by(name: params['artist'])
  song = Song.find_or_create_by(name: params['song'], artist_id: artist.id)
  artist.save
  tab = Tab.create(user_id: 1, song_id: song.id)
  lyrics = params['lyrics']
  chords = params['chords']
  lyrics.each_with_index do |lyric, index|
    lyric = Lyric.create(lyric: lyrics[index.to_s], chord: chords[index.to_s], tab_id: tab.id)
  end
  redirect '/'
end

