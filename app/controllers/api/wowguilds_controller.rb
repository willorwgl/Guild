class Api::WowguildsController < ApplicationController 


    def create
        character = selected_character
        @guild = character.build_guild(guild_params.merge({faction: character.faction, realm: character.realm}))
        if @guild.save
            character.update(guild_id: @guild.id)
            render :show
        else

        end
    end
    
    def index 
        @guilds = Wowguild.where(realm: params[:name])
        render :index
    end

    def show 
        @guild = Character.includes(:guild).find(params[:id]).guild
        if @guild 
            render :show
        else
            render json: {error: "Character is not in a guild"}, status: 404
        end
    end
    
    def leave 
        character  = Character.find(params[:id])
        character.guild_id = nil
        character.save 
    end

    def join 
        character  = Character.find(params[:id])
        @guild = Wowguild.find(params[:guild_id])
        character.guild_id = params[:guild_id]
        character.save 
        render :show
    end


    private
    def guild_params 
        params.require(:guild).permit(:description, :name, :guildtype)
    end

end