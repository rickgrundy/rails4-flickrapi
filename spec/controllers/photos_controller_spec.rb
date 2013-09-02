require_relative "../spec_helper"

describe PhotosController do
  describe "searching for photos" do
    QUERY = 'Manta ray'
    
    before(:each) do
      allow(Flickr).to receive(:search).with(QUERY, PhotosController::PER_PAGE).and_return(@photos = double)
    end
    
    context "without a query" do
      before(:each) { get :search }
      
      it 'renders the search page' do
        expect(response).to render_template 'search'
      end
      
      it 'does not assign photos' do
        expect(assigns :photos).to be nil
      end
    end
    
    context "with a query" do
      before(:each) do
        get :search, q: QUERY
      end
      
      it 'renders the search page' do
        expect(response).to render_template 'search'
      end
      
      it 'assigns @photos' do
        expect(assigns :photos).to be @photos
      end     
    end
  end
end