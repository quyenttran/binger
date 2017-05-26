key = ENV['MUSIXMATCHER_API_KEY']

post '/api_requests/new' do
  api = APIHelper.new(key)
  @artist = params['artist']
  @song = params['song']
  lyrics = api.get_lyrics(@artist, @song)
  puts lyrics
  erb :'/tabs/new', locals: { lyrics: lyrics }
end
