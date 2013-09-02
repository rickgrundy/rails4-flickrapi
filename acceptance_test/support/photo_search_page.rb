class PhotoSearchPage < PageModels::Base
  def url
    search_photos_path
  end
  
  def verify!
    should have_content 'Flickr photo search'
    should_not have_content 'Search results'
  end
  
  def search_for(query)
    fill_in :q, with: query
    click_button 'Search'
  end
end