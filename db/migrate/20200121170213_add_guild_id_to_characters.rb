class AddGuildIdToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :guild_id, :integer
  end

end
