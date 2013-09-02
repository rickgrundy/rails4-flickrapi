require_relative 'spec_helper'

describe 'searching for photos from Flickr' do
  it 'displays multiple pages of results' do
    open_page PhotoSearchPage
    search_for 'Whale Shark'
    should_see_page PhotoSearchResultsPage.new('Whale Shark')
    (1..10).each { |n| should_link_to_page(n) }
  end
  
  it 'displays a larger image when a search result is clicked' do
    open_page PhotoSearchResultsPage.new('Lionfish')
    click_first_result
    should_be_viewing_larger_image
  end
end