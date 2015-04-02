class RentalsController < ApplicationController

  def index
    @rentals = Rental.order(:timestamp).page params[:page]
  end

  def new
    @rental = Rental.new
  end


end
