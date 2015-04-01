class RentalsController < ApplicationController

  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
  def


end
