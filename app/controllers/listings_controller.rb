class ListingsController < ApplicationController

  # before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  
  def create
    @listing = Listing.new(listing_params)
    @user = current_user
    @listing.user = @user
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def listing_params 
    params.require(:listing).permit(:title, :price, :description)
  end

end
