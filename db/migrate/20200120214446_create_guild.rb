class CreateGuild < ActiveRecord::Migration[5.2]
  def change
    create_table :wowguilds do |t|
      t.string :name, null: false, index: true
      t.string :faction, null: false
      t.string :realm, null: false, index: true
      t.string :description
      t.string :type, null: false
    end
  end
end
