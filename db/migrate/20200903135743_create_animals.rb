class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :scientific_name
      t.string :status
      t.string :population
      t.text :facts
      t.string :img_url

      t.timestamps
    end
  end
end
