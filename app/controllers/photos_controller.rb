class PhotosController < ApplicationController
  PER_PAGE = 20
  
  def search
    if params[:q]
      @query = params[:q]
      @page = params[:page] ? params[:page].to_i : 1
      @photos = Flickr.search(@query, PER_PAGE, @page) 
    end
  end
end