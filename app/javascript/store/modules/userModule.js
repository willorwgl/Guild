import * as SessionUtil from "../api/sessionUtils"

const userModule = {
    state: {
        loginError: null,
        signupError: null,
    },
    getters: {
        getCurrentUser(state, getters, rootState) {
            return rootState.currentUser
        }
    },
    mutations: {
        login(state, {
            rootState,
            user
        }) {
            rootState.currentUser = user
            rootState.characters = user.characters
            rootState.selectedCharacter = user.selectedCharacter
            if (state.loginError) state.loginError = null;
            if (state.signupError) state.signupError = null;
        },
        logout(state, {
            rootState
        }) {
            rootState.currentUser = null;
            rootState.characters = null;
            rootState.selectedCharacter = null;
        }
    },
    actions: {
        signupUser({
            commit,
            rootState
        }, user) {
            return SessionUtil.signupUser(user).then((res) => {
                commit("login", {
                    rootState,
                    user: res.data
                })
            }).catch((err) => {
                //not finished
                debugger
                err.response.data.error
            })
        },
        loginUser({
            commit,
            rootState
        }, user) {
            return SessionUtil.loginUser(user).then((res) => {
                commit("login", {
                    rootState,
                    user: res.data
                })
            }).catch((err) => {
                err.response.data.error
            })
        },
        logoutUser({
            commit,
            rootState
        }) {
            return SessionUtil.logoutUser().then(() => {
                commit("logout", {
                    rootState
                })
            })
        }
    }
}



export default userModule;