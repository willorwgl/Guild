# == Schema Information
#
# Table name: realms
#
#  id   :bigint           not null, primary key
#  name :string
#



class Realm < ApplicationRecord 

    REALMS = ["Sulfuras", "Faerlina", "Heartseeker", "Whitemane", "Westfall"]

    validates :name, presence: true
    validates_inclusion_of :name, in: REALMS

end
