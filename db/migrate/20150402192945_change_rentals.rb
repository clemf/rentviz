class ChangeRentals < ActiveRecord::Migration
  def change
    change_column :rentals, :threetaps_id, :string
    change_column :rentals, :external_id, :string
    change_column :rentals, :price, :string
  end
end
