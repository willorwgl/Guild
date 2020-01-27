class Api::CharactersController < ApplicationController


    def create 
        @character = current_user.characters.new(character_params)
        if @character.save
            render :show
        else
            render json: {message: "Invalid post"}, status: 422
        end

    end

    def select 
        characters = current_user.characters
        characters.each do |character|
            character.update({selected: false}) if character.selected 
        end
        @character = characters.find(params[:id])
        if @character.update({selected: true})
            render :show
        end
    end

    def index 
        @characters  = Wowguild.includes(:characters).find(params[:wowguild_id]).characters
        render :index
    end



    private 
    def character_params
        params.require(:character).permit(:faction, :gender, :characterName, :race, :wowclass, :realm)
    end
end