def search_response(search)
  RestClient.get "https://simple.wikipedia.org/w/api.php?action=query&prop=extracts&format=json&exintro=&titles=#{search.split.map(&:capitalize).join('%20')}&redirects"
end

def extract_summary(response)
  page_keys = JSON.parse(response)['query']['pages'].keys
  JSON.parse(response)['query']['pages'][page_keys[0]]['extract'] || "<p>Nothing found!</p>"
end

def shorten_content(search)
  search.content.length > 20 ? "  -  #{search.content[0..100]}..." : "  -  No results"
end
