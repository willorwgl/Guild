import * as CharacterUtil from "../api/characterUtil"
import {
    merge
} from "lodash"

const characterModule = {
    getters: {
        getCharacters(state, getters, rootState) {
            return rootState.characters
        },
        getSelectedCharacter(state, getters, rootState) {
            return rootState.selectedCharacter;
        }
    },
    mutations: {
        add(state, {
            rootState,
            character
        }) {
            rootState.characters = merge({}, rootState.characters, character)
        },
        select(state, {
            rootState,
            character
        }) {
            rootState.guildModule.guildCharacters = {}
            rootState.guildModule.characterGuild = null
            rootState.selectedCharacter = Object.values(character)[0]
        }
    },
    actions: {
        createCharacter({
            commit,
            rootState
        }, character) {
            return CharacterUtil.createCharacter(character)
                .then(res => {
                    commit("add", {
                        rootState,
                        character: res.data
                    })
                })
        },
        selectCharacter({
            commit,
            rootState
        }, characterId) {
            return CharacterUtil.selectCharacter(characterId)
                .then((res) => {
                    commit("select", {
                        rootState,
                        character: res.data
                    })
                })
        }
    },
}

export default characterModule;