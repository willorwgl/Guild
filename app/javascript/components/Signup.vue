<template>
<div class="signup-container">
     <form action="#" class="signup-form">
         <div class="signup-message"><span>Create an account</span></div>
        <input type="text" v-model.lazy.trim="$v.username.$model"  placeholder="Username">
        <div class="error" v-if="$v.username.$dirty && !$v.username.required" >Field is required</div>
        <div class="error" v-if="$v.username.$dirty && !$v.username.minLength">Username must have at least {{$v.username.$params.minLength.min}} characters</div>
        <input type="password" v-model.lazy.trim="$v.password.$model" class="password" placeholder="Password">
        <div class="error" v-if="$v.password.$dirty && !$v.password.required">Field is required</div>
        <div class="error" v-if="$v.password.$dirty && !$v.password.strongPassword">Password must be a combination of at least six numbers, letters, and special characters</div> 
        <input type="password" v-model.lazy.trim="$v.confirmPassword.$model" class="confirm-password" placeholder="Confirm password">
        <div class="error" v-if="$v.confirmPassword.$dirty && !$v.confirmPassword.sameAsPassword">Passwords must match</div>
        <button @click.prevent="signup" class="signup">Sign Up</button>
        <router-link to="/login" class="login">Already have an account?</router-link>
    </form>
</div>
   
</template>

<script>
import { required, minLength, sameAs } from 'vuelidate/lib/validators'
import { mapActions, mapGetters } from "vuex"
export default {
    data() {
        return {
            username: "",
            password: "",
            confirmPassword: ""
        }
    },
    methods: {
        ...mapActions(["signupUser"]),
        signup() {
            this.$v.$touch()
            if (!this.$v.$invalid) {
                this.signupUser(this.$data).then((res) => {
                    this.$router.push("/")
                })
            } 
        }
    },
    computed: {
        ...mapGetters(["signupError"])
    },
    validations: {
        username: {
            required,
            minLength: minLength(4)
        },
        password: {
            required,
            strongPassword(password) {
                return /^(?=.*[0-9])(?=.*[!@#$%^&*.])[a-zA-Z0-9!@#$%^&*]{6,16}$/.test(password);
            }
        },
        confirmPassword: {
            sameAsPassword: sameAs("password")
        }
    }
}
</script>

<style scoped>
    .signup-form {
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
        height: 300px;
    }

    .signup-container {
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        background-image: url("/assets/ragnaros.jpg");
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

    .signup-message {
            display: flex;
     color: #ece8e8;
        font-size: 30px;
     justify-content: center;
    margin-top: 20px;
    user-select: none;
    margin-bottom: 15px;
    font-weight: 150;
    }

    .login {
        color:white;
        text-decoration: none;
    }

    .signup {
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