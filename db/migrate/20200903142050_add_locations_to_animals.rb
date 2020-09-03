class AddLocationsToAnimals < ActiveRecord::Migration[6.0]
  def change
    add_column :animals, :locations, :text, default: ""
  end
end
