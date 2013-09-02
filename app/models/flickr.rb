class Flickr
  def self.configure(api_key, api_secret)
    FlickRaw.api_key = api_key
    FlickRaw.shared_secret = api_secret
  end
  
  def self.search(query, count, page=1)
    flickr.photos.search(text: query, per_page: count, page: page)
  end
  
  def self.get_photo(id)
    raise 'Not implemented'
  end
end