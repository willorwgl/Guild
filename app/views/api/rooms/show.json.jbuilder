
json.set! @room.id do
    json.extract! @room, :name, :guild_id, :id

    json.messages({})
end
