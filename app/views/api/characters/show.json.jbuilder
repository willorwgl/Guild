
json.set! @character.id do
    json.extract! @character, :id, :faction, :realm, :race, :wowclass, :characterName, :gender
end