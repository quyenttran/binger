key = ENV['MUSIXMATCHER_API_KEY']

# New
post '/tabs/new' do
  api = APIHelper.new(key)

  lyrics = api.get_lyrics(params['artist'], params['song'])
  puts lyrics
  erb :'/tabs/new', locals: { lyrics: lyrics }
end

get '/tabs/new' do
  erb :'/tabs/new'
end

# Create
post '/tabs' do

end

