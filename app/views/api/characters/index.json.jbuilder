@characters.each do |character|
        json.set! character.id do
            json.extract! character, :characterName, :faction, :id, :wowclass, :realm, :race
        end
end