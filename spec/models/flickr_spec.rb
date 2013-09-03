require_relative '../spec_helper'

describe Flickr do
  before(:each) do
    @photos_api = double
    # FlickRaw exposes 'flickr' globally (which seems a bit dodgy).
    Object.any_instance.stub(:flickr).and_return double(photos: @photos_api)
  end
  
  describe 'configuring the flickraw gem (see initializers/flickr.rb)' do
    it 'sets the api key and shared secret' do
      Flickr.configure('KEY', 'SECRET')
      FlickRaw.api_key.should == 'KEY'
      FlickRaw.shared_secret.should == 'SECRET'
    end
  end
  
  describe 'search' do    
    it 'returns FlickRaw results for the given query' do
      expect(@photos_api).to receive(:search).with(text: 'Octopus', per_page: 10, page: 1).and_return(@photos = double('photos'))
      Flickr.search('Octopus', 10).should be @photos
    end
    
    it 'supports pagination' do
      expect(@photos_api).to receive(:search).with(text: 'Octopus', per_page: 10, page: 2).and_return(@page2 = double('page2'))
      Flickr.search('Octopus', 10, 2).should be @page2
    end
  end
  
  describe 'get photo' do
    it "uses FlickRaw getInfo to return a single photo by it's Flickr ID" do
      expect(@photos_api).to receive(:getInfo).with(photo_id: 999).and_return(@photo = double('photo'))
      Flickr.get_photo(999).should be @photo
    end
  end
end