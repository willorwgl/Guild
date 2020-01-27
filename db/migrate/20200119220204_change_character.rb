class ChangeCharacter < ActiveRecord::Migration[5.2]
  def change
    rename_column(:characters, :class, :wowclass)
    add_column(:characters, :selected, :boolean, default: false)
  end
end
