class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :characterName, null: false, index: true
      t.string :faction, null: false
      t.string :class, null: false
      t.string :race, null: false
      t.string :gender, null: false
      t.string :realm, null: false, index: true
      t.integer :user_id, null: false, index: true
      t.timestamps 
    end
  end
end
