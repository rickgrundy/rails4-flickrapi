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
      @photos_api = double()
      # FlickRaw exposes 'flickr' globally (which seems a bit dodgy).      
      allow(Kernel).to receive(:flickr).and_return double(photos_api: @photos_api)
    end
    
    it 'returns results for the given query' do
      allow(@photos_api).to receive(:search).with(text: 'Octopus').and_return()
    end
  end
end