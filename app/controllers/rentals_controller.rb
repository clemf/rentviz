class RentalsController < ApplicationController

  def index
    @rentals = Rental.order("timestamp DESC").page params[:page]
  end

  def new
    @rental = Rental.new
  end


end
