# == Schema Information
#
# Table name: rooms
#
#  id       :bigint           not null, primary key
#  name     :string           not null
#  guild_id :integer          not null
#
# Indexes
#
#  index_rooms_on_guild_id  (guild_id)
#

class Room < ApplicationRecord 

    validates :name, :guild_id, presence: true

    belongs_to :guild, class_name: "Wowguild", foreign_key: :guild_id

    has_many :messages
end
