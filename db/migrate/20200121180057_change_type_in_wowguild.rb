class ChangeTypeInWowguild < ActiveRecord::Migration[5.2]
  def change

    rename_column :wowguilds, :type, :guildtype
  end
end
