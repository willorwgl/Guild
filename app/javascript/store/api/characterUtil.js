
import axios from "axios"

export const createCharacter = (character) => {
    return axios.post("/api/characters", {
        character
    })
}

export const selectCharacter = (characterId) => {
    return axios.post(`/api/characters/${characterId}/select`)
}