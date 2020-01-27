

@rooms.each do |room| 
    
    json.set! room.id do 
        json.extract! room, :name, :guild_id, :id 

        messages = room.messages 
        if (messages.length > 0)
            json.messages do    
                room.messages.each do |message|
                    json.set! message.id do  
                        json.extract! message, :body, :character_id, :room_id, :updated_at, :id
                    end
                end
            end
        else      
            json.messages({})
        end
    end
end
