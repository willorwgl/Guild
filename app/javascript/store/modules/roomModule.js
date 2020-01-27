
import * as RoomUtil from "../api/roomUtil"
import { merge } from "lodash"

const guildModule = {
    state: {
        guildRooms: {},
        currentRoom: null
    },
    getters: {
        getGuildRooms(state) {
            return state.guildRooms
        },
        getGuildRoom: (state) => (roomId) => {
            return state.guildRooms[[roomId]]
        }
    },
    mutations: {
        addGuildRoom(state, room) {
            state.guildRooms =  merge({}, state.guildRooms, room)
        },
        setGuildRooms(state, rooms) {
            state.guildRooms = rooms
        }
    },
    actions: {
        createGuildRoom({commit}, {room, guildId}) {
            return RoomUtil.createGuildRoom(room, guildId).then(res => {
                commit("addGuildRoom", res.data)
            })
        },
        fetchGuildRooms({commit}, guildId) {
            return RoomUtil.fetchGuildRooms(guildId).then(res => {
                commit("setGuildRooms", res.data)
            })
        }
    }
}

export default guildModule;