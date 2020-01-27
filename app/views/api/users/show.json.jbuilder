json.extract! @user, :id, :username


selected  = nil

json.characters do   
    @user.characters.each do |character|
        selected = character if character.selected
        json.set! character.id do
            json.extract! character, :faction, :realm, :race, :wowclass, :characterName, :gender, :id
        end
    end
end

if (selected)
    json.selectedCharacter do
        json.set! selected.id do 
            json.extract! selected, :faction, :realm, :race, :wowclass, :characterName, :gender, :id
        end
    end
end
