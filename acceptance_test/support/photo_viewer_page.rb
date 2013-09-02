class PhotoViewerPage < PageModels::Base
  def initialize(photo_id)
    @photo_id = photo_id
  end
  
  def url
    photo_path @photo_id
  end
  
  def verify!
    should have_selector "h1#photo-#{@photo_id}"
  end
end