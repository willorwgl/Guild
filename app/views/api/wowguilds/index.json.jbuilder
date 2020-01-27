
@guilds.each do |guild| 
    json.set! guild.id do
        json.extract! guild, :name, :description, :faction, :guildtype, :realm, :id
    end
end