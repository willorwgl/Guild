class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :body, null: false
      t.integer :character_id, null: false, index: true
      t.timestamps
    end
  end
end
