class CreateCreatures < ActiveRecord::Migration[7.1]
  def change
    create_table :creatures do |t|
      t.string :planet_location
      t.string :name
      t.text :details
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
