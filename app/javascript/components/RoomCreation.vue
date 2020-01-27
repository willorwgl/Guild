<template>
  <form action="#" class="new-room-form">
    <input type="text" class="name-input" v-model="$v.name.$model" placeholder="New room" @keyup.enter="create"/>
    <i class="fas fa-plus create-room-btn" @click="create"></i>
  </form>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
import { required, minLength } from "vuelidate/lib/validators";
export default {
  data() {
    return {
      name: ""
    };
  },
  validations: {
    name: {
      required,
      minLength: minLength(2)
    }
  },
  computed: {
    ...mapGetters(["getCharacterGuild"])
  },
  methods: {
    ...mapActions(["createGuildRoom"]),
    create() {
      this.$v.touch;
      if (!this.$v.$invalid) {
        this.createGuildRoom({
          room: this.$data,
          guildId: this.getCharacterGuild.id
    
        }).then(() => {
            this.name = ""
        });

      }
    }
  }
};
</script>
<style scoped>
.new-room-form {
  height: 90px;
  padding: 20px 0 25px;
  box-sizing: border-box;
  display: flex;
  justify-content: space-between;
  align-items: center;
    border-top: 1px solid #40444b;
}

.name-input {
  background-color: #40444b;
  border: none;
  height: 44px;
  border-radius: 10px;
  outline: none;
  width: 190px;
  padding: 8px 12px;
  font-size: 18px;
  color: white;
  box-sizing: border-box;
}

.create-room-btn {
  font-size: 24px;
  color: white;
  cursor: pointer;
}
</style>