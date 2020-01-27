


class Api::RoomsController < ApplicationController 


    def create
        guild = Wowguild.find(params[:wowguild_id])
        @room = guild.rooms.new(room_params)
        if @room.save
            render :show
        else
            render json: {error: "Room is invalid"}, status: 422
        end
    end

    def index 
        @rooms = Wowguild.find(params[:wowguild_id]).rooms.includes(:messages)
        render :index
    end


    private
    def room_params 
        params.require(:room).permit(:guild_id, :name)
    end

end