class PhotoSearchResultsPage < PageModels::Base
  def initialize(query, page=1)
    @query = query
    @page = page
  end
  
  def url
    search_photos_path(q: @query, page: @page)
  end
  
  def verify!
    should have_content "Search results for '#{@query}' (page #{@page})"
  end
  
  def next_page
    click_link "More #{@query} photos"
  end
  
  def should_see_photos(count)
    within('.photo-search-results') { all('.photo').size.should == count }
  end
  
  def click_first_result
    within('.photo-search-results') { find('a:first').click }
  end
  
  def should_be_viewing_larger_image
    find('.larger-image').should be_visible
  end
end