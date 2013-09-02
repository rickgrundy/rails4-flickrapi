class PhotosController < ApplicationController
  def search
    @photos = Flickr.search(params[:q]) if params[:q]
  end
end