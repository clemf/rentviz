class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :threetaps_id
      t.string :source
      t.string :category
      t.string :location
      t.integer :external_id
      t.string :external_url
      t.string :heading
      t.string :timestamp
      t.string :body
      t.float :price
    end
  end
end
