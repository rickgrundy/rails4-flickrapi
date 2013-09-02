require_relative "../spec_helper"

describe Flickr do
  describe 'configuring the flickraw gem (see initializers/flickr.rb)' do
    it 'sets the api key and shared secret' do
      Flickr.configure('KEY', 'SECRET')
      FlickRaw.api_key.should == 'KEY'
      FlickRaw.shared_secret.should == 'SECRET'
    end
  end
  
  describe 'search' do
    before(:each) do
      @photos_api = double
      # FlickRaw exposes flickr globally (which seems a bit dodgy).
      Object.any_instance.stub(:flickr).and_return double(photos: @photos_api)
    end
    
    it 'returns FlickRaw results for the given query' do
      expect(@photos_api).to receive(:search).with(text: 'Octopus', per_page: 10, page: 1).and_return(@photos = double('photos'))
      Flickr.search('Octopus', 10).should be @photos
    end
    
    it 'supports pagination' do
      expect(@photos_api).to receive(:search).with(text: 'Octopus', per_page: 10, page: 2).and_return(@page2 = double('page2'))
      Flickr.search('Octopus', 10, 2).should be @page2
    end
  end
end