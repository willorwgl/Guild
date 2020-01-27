import Home from "./components/Home"
import Login from "./components/Login"
import Signup from "./components/Signup"
import CharacterCreation from "./components/CharacterCreation"
import CharacterSelection from "./components/CharacterSelection"
import GuildHome from "./components/GuildHome"
import { store } from "./store/store"
import VueRouter from "vue-router"
import Vue from "vue"


Vue.use(VueRouter)

const isAuthenticated = (to, from, next) => {
    if (store.state.currentUser) {
        if (store.state.characters) {
            if (store.state.selectedCharacter) {
                next("/guild")
            } else {
                next("/characters")
            }
        } else {
            next("/characters/create")
        }
    } else {
        next()
    }
}


const routes = [{
        path: "",
        component: Home,
        beforeEnter: isAuthenticated
    },
    {
        path: "/login",
        component: Login,
        beforeEnter: isAuthenticated
    },
    {
        path: "/signup",
        component: Signup,
        beforeEnter: isAuthenticated
    },
    {
        path: "/characters/create",
        component: CharacterCreation,
        meta: { requiresLogin: true }
    },
    {
        path: "/characters",
        component: CharacterSelection,
        meta: { requiresLogin: true }
    },
    {
        path: "/guild",
        component: GuildHome,
        meta: { requiresLogin: true }
    }
]

const router = new VueRouter({
    routes
})

router.beforeEach((to, from, next) => {
    if (to.matched.some(route => route.meta.requiresLogin) && !store.state.currentUser) {
        next("/")
    } else {
        next()
    }
})

export default router