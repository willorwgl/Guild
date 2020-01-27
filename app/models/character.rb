# == Schema Information
#
# Table name: characters
#
#  id            :bigint           not null, primary key
#  characterName :string           not null
#  faction       :string           not null
#  gender        :string           not null
#  race          :string           not null
#  realm         :string           not null
#  selected      :boolean          default(FALSE)
#  wowclass      :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  guild_id      :integer
#  user_id       :integer          not null
#
# Indexes
#
#  index_characters_on_characterName  (characterName)
#  index_characters_on_realm          (realm)
#  index_characters_on_user_id        (user_id)
#




class Character < ApplicationRecord

    FACTIONS = ["alliance", "horde"]
    RACES = ["dwarf", "nightelf", "human", "gnome", "tauren", "undead", "orc", "troll"]
    REALMS = ["Sulfuras", "Faerlina", "Heartseeker", "Whitemane", "Westfall"]
    CLASSES = ["druid", "paladin", "rogue", "warrior", "priest", "mage", "hunter", "warlock", "shaman"]
    GENDER = ["male", "female"]

    validates :faction, :gender, :wowclass, :realm, :race, :user_id, presence: true
    validates_inclusion_of :faction, in: FACTIONS
    validates_inclusion_of :race, in: RACES
    validates_inclusion_of :realm, in: REALMS
    validates_inclusion_of :wowclass, in: CLASSES
    validates_inclusion_of :gender, in: GENDER


    belongs_to :user
    belongs_to :guild, class_name: "Wowguild", foreign_key: :guild_id,  optional: true

    def _realm 
        Realm.where({name: self.realm})
    end
end
