def search_response(search)
  RestClient.get "https://simple.wikipedia.org/w/api.php?action=query&prop=extracts&format=json&exintro=&titles=#{search.split.join('%20')}&redirects"
end

def extract_summary(response)
  page_keys = JSON.parse(response)['query']['pages'].keys
  JSON.parse(response)['query']['pages'][page_keys[0]]['extract'] || "<p>Nothing found!</p>"
end
