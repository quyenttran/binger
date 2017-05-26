require 'dotenv'
require 'rest-client'
Dotenv.load

guidebox = RestClient.get('http://api-public.guidebox.com/v2/shows', headers={Authorization: ENV['GUIDEBOX_KEY']})
