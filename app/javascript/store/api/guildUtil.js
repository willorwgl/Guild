import axios from "axios"

export const createGuild = (guild) => {
    return axios.post("/api/wowguilds", {
        guild
    })
}

export const fetchGuilds = (realmName) => {
    return axios.get(`/api/realms/${realmName}/guilds`)
}

export const fetchGuild = (characterId) => {
    return axios.get(`/api/characters/${characterId}/guild`)
}

export const fetchGuildCharacters = (guildId) => {
    return axios.get(`/api/wowguilds/${guildId}/characters`)
}

export const leaveGuild = (characterId) => {
    return axios.delete(`/api/characters/${characterId}/guild/leave`)
}

export const joinGuild = (characterId, guildId) => {
    return axios.post(`/api/characters/${characterId}/guild/${guildId}/join`)
}