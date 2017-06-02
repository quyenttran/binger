require 'rest-client'
require 'json'
require 'netflix_roulette'

module Show

def search(by, val)
  url = "http://netflixroulette.net/api/api.php?#{by}=#{val}"
  uri = URI.encode(url)
  show = RestClient.get(uri)
  JSON.parse(show)
end

def artwork_for(title)
  NetflixRoulette.get_media_poster("#{title}")
end

def year_for(title)
  NetflixRoulette.get_media_release_year("#{title}")
end

def rating_for(title)
  NetflixRoulette.get_media_rating("#{title}")
end

def cast_for(title)
  NetflixRoulette.get_media_cast("#{title}")
end

def category_for(title)
  NetflixRoulette.get_media_category("#{title}")
end

def summary_for(title)
  NetflixRoulette.get_media_summary("#{title}")
end

def director_for(title)
  NetflixRoulette.get_media_director("#{title}")
end

end

helpers Show
