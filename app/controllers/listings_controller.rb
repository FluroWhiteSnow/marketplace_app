class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 
  
  def set_listing
    id = params[:id] 
    @listing = Listing.find(id)
  end
end
