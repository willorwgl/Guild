

import axios from "axios"

 export const fetchGuildRooms = (guildId) => {
    return axios.get(`/api/wowguilds/${guildId}/rooms`)
 }


 export const createGuildRoom = (room, guildId) => {
    return axios.post(`/api/wowguilds/${guildId}/rooms`, {
        room
    })
 }