class PagesController < ApplicationController

  before_action :authenticate_user!,  only: [:restricted]

  def home
  end

  def restricted
  end

  def about
  end

  def buy
  end

  def sell
  end
end
