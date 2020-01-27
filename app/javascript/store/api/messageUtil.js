import axios from "axios"


export const createMessage = (roomId, message) => {
    return axios.post(`/api/rooms/${roomId}/messages`, {
        message
    })
}