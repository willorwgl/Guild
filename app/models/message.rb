# == Schema Information
#
# Table name: messages
#
#  id           :bigint           not null, primary key
#  body         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  character_id :integer          not null
#  room_id      :integer
#
# Indexes
#
#  index_messages_on_character_id  (character_id)
#

class Message < ApplicationRecord 

    validates :body, presence: true

    belongs_to :room
    belongs_to :character

end
