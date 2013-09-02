require_relative 'spec_helper'

describe 'searching for photos from Flickr' do
  it 'provides multiple pages of search results' do
    open_page PhotoSearchPage
    search_for 'Whale Shark'
    should_see_page PhotoSearchResultsPage.new('Whale Shark', 1)
    next_page
    should_see_page PhotoSearchResultsPage.new('Whale Shark', 2)
  end
  
  it 'displays a larger image when a search result is clicked' do
    open_page PhotoSearchResultsPage.new('Lionfish')
    click_first_result
    should_be_viewing_larger_image
  end
end