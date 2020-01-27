import Vue from "vue"
import App from "../components/App.vue"
import Vuelidate from "vuelidate"
import Router from "../routes"
import {
    store
} from "../store/store"



Vue.use(Vuelidate)


new Vue({
    el: "#root",
    store,
    router: Router,
    render: h => h(App)
})



