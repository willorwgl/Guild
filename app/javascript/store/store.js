import Vuex from "vuex"
import Vue from "vue"
import userModule from "./modules/userModule"
import characterModule from "./modules/characterModule"
import guildModule from "./modules/guildModule"
import roomModule from "./modules/roomModule"
import messageModule from "./modules/messageModule"


Vue.use(Vuex)

const createStore = (preloadedState) => {
    return new Vuex.Store({
        state: preloadedState,
        modules: {
            userModule,
            characterModule,
            guildModule,
            roomModule,
            messageModule
        }
    })
}

const preloadedState = {
    currentUser: null,
    characters: null,
    selectedCharacter: null
}

if (window.currentUser) {
    preloadedState.currentUser = window.currentUser
    preloadedState.characters = window.currentUser.characters
    if (window.currentUser.selectedCharacter) {
        preloadedState.selectedCharacter = Object.values(window.currentUser.selectedCharacter)[0]
    }
}


export const store = createStore(preloadedState)