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
  
  def click_first_result
    within('.results') { click_link 'a:first' }
  end
  
  def should_link_to_page(n)
    within('.pagination') { should have_link n }
  end

  def should_be_viewing_larger_image
    find('.larger-image').should be_visible
  end
end