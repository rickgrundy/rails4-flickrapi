class PhotoSearchResultsPage < PageModels::Base
  def initialize(query)
    @query = query
  end
  
  def url
    search_photos_path(q: @query)
  end
  
  def verify!
    should have_content "Search results for '#{@query}'"
  end
  
  def should_see_photos(count)
    within('.photo-search-results') { all('.photo').size.should == count }
  end
  
  def click_first_result
    within('.photo-search-results') { click_link 'a:first' }
  end
  
  def should_be_viewing_larger_image
    find('.larger-image').should be_visible
  end
end