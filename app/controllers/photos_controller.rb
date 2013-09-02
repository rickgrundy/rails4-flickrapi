class PhotosController < ApplicationController
  PER_PAGE = 20
  
  def search
    @photos = Flickr.search(params[:q], PER_PAGE) if params[:q]
  end
end