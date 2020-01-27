class Api::MessagesController < ApplicationController



    def create
        room = Room.find(params[:room_id])
        message = room.messages.new(message_params)
        if message.save 
            response = {}
            response[message.id] = {id: message.id, body: message.body, character_id: message.character_id, updated_at: message.updated_at }
            RoomChannel.broadcast_to room, response 
        end
    end


    private 
    def message_params 
        params.require(:message).permit(:body, :character_id)
    end
    
end