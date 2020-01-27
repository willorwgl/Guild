class CreateRealms < ActiveRecord::Migration[5.2]
  def change
    create_table :realms do |t|
      t.string :name, unique: true
    end
  end
end
