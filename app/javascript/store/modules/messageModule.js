
import * as MessageUtil from "../api/messageUtil"
import { merge } from "lodash"

const messageModule = {
    getters: {
        getRoomMessages: (state, getters, rootState) => (roomId) => {
            return rootState.roomModule.guildRooms[[roomId]].messages
        }
    },
    mutations: {
        addMessage(state, {rootState, roomId, message}) {
            rootState.roomModule.guildRooms[[roomId]].messages = merge({}, rootState.roomModule.guildRooms[[roomId]].messages, message)
        },
        // addCharacter(state, {rootState}) {
                
        // }
    },
    actions: {
        createMessage({commit}, {roomId, message}) {
            return MessageUtil.createMessage(roomId, message)
        },
        receiveMessage({commit, rootState}, {roomId, message}) {
            // if (!rootState.guildModule.guildCharacters[[Object.values(message)[0].character_id]]) {
                // commit("addCharacter", {rootState})
            
            commit("addMessage", {rootState, roomId, message})
        }
    }
}


export default messageModule;