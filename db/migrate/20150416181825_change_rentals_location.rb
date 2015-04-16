class ChangeRentalsLocation < ActiveRecord::Migration
  def change
    remove_column :rentals, :location
    add_column :rentals, :formatted_address, :string
    add_column :rentals, :zip_code, :string
    add_column :rentals, :lat, :string
    add_column :rentals, :long, :string
  end
end
