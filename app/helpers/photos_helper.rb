module PhotosHelper
  def search_result_image_tag(photo)
    image_tag FlickRaw.url_q(photo), alt: photo.title
  end
  
  def full_size_image_tag(photo)
    image_tag FlickRaw.url_b(photo), alt: photo.title
  end
end