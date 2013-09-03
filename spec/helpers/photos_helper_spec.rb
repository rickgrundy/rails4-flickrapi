require_relative '../spec_helper'

describe PhotosHelper do
  before(:each) do
    @photo = double(title: 'Photo of a starfish')
  end

  describe 'image tags for photos' do
    it 'uses FlickRaw medium for search results' do
      expect(FlickRaw).to receive(:url_m).with(@photo).and_return 'http://flickr.com/photo_medium.jpg'
      tag = search_result_image_tag@photo
      tag.should == image_tag('http://flickr.com/photo_medium.jpg', alt: 'Photo of a starfish')
    end
    
    it 'uses FlickRaw 1024 for full size viewer' do
      expect(FlickRaw).to receive(:url_b).with(@photo).and_return 'http://flickr.com/photo_1024.jpg'
      tag = full_size_image_tag @photo
      tag.should == image_tag('http://flickr.com/photo_1024.jpg', alt: 'Photo of a starfish')
    end
  end
end