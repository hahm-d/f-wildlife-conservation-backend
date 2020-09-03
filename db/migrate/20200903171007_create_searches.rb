class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :term
      t.references :user
      t.timestamps
    end
  end
end
