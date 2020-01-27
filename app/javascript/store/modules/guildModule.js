import * as GuildUtil from "../api/guildUtil"
import { merge } from "lodash"
const guildModule = {
    state: {
        guilds: {},
        characterGuild: null,
        guildCharacters: {}
    },
    getters: {
        getGuilds(state) {
            return state.guilds;
        },
        getCharacterGuild(state) {
            return state.characterGuild
        },
        getGuildCharacters(state) {
            return state.guildCharacters
        },
        getGuildCharacter: (state) => (characterId) => {
            console.log(characterId)
            return state.guildCharacters[[characterId]]
        } 
    },
    mutations: {
        addGuild(state, guild) {
            state.guilds = merge({}, state.guilds, guild)
        },
        setGuilds(state, guilds) {
            state.guilds = guilds
        },
        setCharacterGuild(state, guild) {
            state.characterGuild = Object.values(guild)[0]
        },
        setGuildCharacters(state, characters) {
            state.guildCharacters = characters;
        },
        removeCharacterGuild(state) {
            state.characterGuild = null 
            state.guildCharacters = {}
        }
    },
    actions: {
        createGuild({commit}, character) {
            return GuildUtil.createGuild(character).then(res => {
                commit("addGuild", res.data)
                commit("setCharacterGuild", res.data)
            })
        },
        fetchGuilds({commit}, realmName) {
            return GuildUtil.fetchGuilds(realmName).then(res => {
                commit("setGuilds", res.data)
            })
        },
        fetchCharacterGuild({commit, rootGetters}) {
            const characterId = rootGetters.getSelectedCharacter.id
            return GuildUtil.fetchGuild(characterId).then(res => {
                commit("setCharacterGuild", res.data)
            }).catch(() => {

            })
        },
        fetchGuildCharacters({commit}, guildId) {
            return GuildUtil.fetchGuildCharacters(guildId).then((res) => {
                commit("setGuildCharacters", res.data)
            })
        },
        leaveGuild({commit}, characterId) {
            return GuildUtil.leaveGuild(characterId).then((res) => {
                commit("removeCharacterGuild")
            })
        },
        joinGuild({commit}, {characterId, guildId}) {
            return GuildUtil.joinGuild(characterId, guildId).then(res => {
                commit("setCharacterGuild", res.data)
            })
        }
    }
}

export default guildModule;