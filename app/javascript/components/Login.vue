<template>
    <div class="login-container">
       
        <form class="login-form" action="#">
             <div class="login-message">Login</div>
            <input type="text" v-model="$v.username.$model" placeholder="Username">
            <!-- <div v-if="$v.username.$dirty && !$v.username.required" class="error">This field is required</div> -->
            <input type="password" v-model="$v.password.$model" placeholder='password'>
            <!-- <div v-if="$v.password.$dirty && !$v.password.required" class="error">This field is required</div> -->
           
            <button @click.prevent="login" class="login">Login</button>
             <router-link to="/signup" class="signup">Create a new account</router-link>
        </form>

    </div>
</template>

<script>
import { required } from "vuelidate/lib/validators"
import { mapActions } from "vuex"
export default {
    data() {
        return {
            username: "",
            password: ""
        }
    },
    validations: {
        username: {
            required
        },
        password: {
            required
        }
    },
    methods: {
        ...mapActions(["loginUser"]),
        login() {
            this.$v.touch
            if (!this.$v.$invalid) {
                this.loginUser(this.$data).then(() => {
                    this.$router.push("/")
                })
            }
        }
    }
}
</script>

<style scoped>
     .login-form {
        display: flex;
        flex-direction: column;
        border-radius: 5px;
          display: flex;
        flex-direction: column;
        padding: 5px;
        box-sizing: border-box;
        background-color: #2f3136;
        opacity: 0.6;
        width: 300px;
        align-items: center;
        height: 270px;
    }

    .login-container {
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        background-image: url("/assets/onyxia.png");
        background-size: 100% 100%;
        background-repeat: no-repeat;
    }


    input {
          height: 30px;
  outline: none;
  border: none;
  background: none;
  box-shadow: 0 4px 5px -5px white;
    color: white;
    font-size: 18px;
    padding: 8px 10px;
    box-sizing: border-box;
    text-align: center;
    margin: 5px 0;
    width: 200px;
    }

    .login-message {
            display: flex;
     color: #ece8e8;
        font-size: 30px;
     justify-content: center;
    margin-top: 20px;
    user-select: none;
    margin-bottom: 15px;
    font-weight: 150;
    }

    .signup {
        color:white;
        text-decoration: none;
    }

    .login {
       width: 200px;
    border-radius: 3px;
    margin: 25px auto 10px auto;
    background-color: #23272a;
    height: 40px;
    color: white;
    font-size: 16px;
    cursor: pointer;
    outline: none;
    }
</style>