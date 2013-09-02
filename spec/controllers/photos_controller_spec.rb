require_relative "../spec_helper"

describe PhotosController do
  describe "searching for photos" do
    QUERY = 'Manta ray'
    
    before(:each) do
      allow(Flickr).to receive(:search).with(QUERY, PhotosController::PER_PAGE, 1).and_return(@photos = double('photos'))
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
      it 'renders the search page' do
        get :search, q: QUERY
        expect(response).to render_template 'search'
      end
      
      it 'assigns @photos' do
        get :search, q: QUERY
        expect(assigns :photos).to be @photos
      end
      
      it 'supports pagination' do
        expect(Flickr).to receive(:search).with(QUERY, PhotosController::PER_PAGE, 2).and_return(@page2 = double('page2'))
        get :search, q: QUERY, page: '2'
        expect(assigns :photos).to be @page2
      end
    end
  end
end