module PhotosHelper
  def search_result_image_tag(photo)
    image_tag FlickRaw.url_m(photo), alt: photo.title
  end
end