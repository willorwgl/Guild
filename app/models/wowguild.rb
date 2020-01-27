# == Schema Information
#
# Table name: wowguilds
#
#  id          :bigint           not null, primary key
#  description :string
#  faction     :string           not null
#  guildtype   :string           not null
#  name        :string           not null
#  realm       :string           not null
#
# Indexes
#
#  index_wowguilds_on_name   (name)
#  index_wowguilds_on_realm  (realm)
#

class Wowguild < ApplicationRecord

    REALMS = ["Sulfuras", "Faerlina", "Heartseeker", "Whitemane", "Westfall"]
    TYPES = ["raiding", "pvp", "roleplaying", "social", "leveling"]
    FACTION = ["horde", "alliance"]

    validates :faction, :name, :realm, :guildtype, presence: true
    validates_inclusion_of :faction, in: FACTION
    validates_inclusion_of :guildtype, in: TYPES
    validates_inclusion_of :realm, in: REALMS

    has_many :characters, foreign_key: :guild_id
    has_many :rooms, foreign_key: :guild_id

end
