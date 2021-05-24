class ListingsController < ApplicationController

  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def show
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.create(listing_params)
    redirect_to listings_path
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

  def listing_params 
    params.require(:listing).permit(:title, :price, :description)
  end
end
