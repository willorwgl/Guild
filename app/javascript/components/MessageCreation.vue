<template>
  <div action="#" class="new-message">
    <input type="text" v-model="$v.body.$model" class="message-form" placeholder="Message" @keyup.enter="create" />
    <!-- <button @click.prevent="create">Send Message</button> -->
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import { required } from "vuelidate/lib/validators";
export default {
  props: ["roomId"],
  data() {
    return {
      body: ""
    };
  },
  computed: {
    ...mapGetters(["getSelectedCharacter"])
  },
  methods: {
    ...mapActions(["createMessage"]),
    create() {
      this.$v.$touch();
      if (!this.$v.$invalid) {
        const message = {
          body: this.body,
          character_id: this.getSelectedCharacter.id
        };
        this.createMessage({ roomId: this.roomId, message });
        this.body = ""
      }
    }
  },
  validations: {
    body: {
      required
    }
  }
};
</script>


<style scoped>
.new-message {
    margin: 0 20px;
    padding-top: 20px;
    padding-bottom: 25px;
    min-height: 90px;
    box-sizing: border-box;
    border-top: 1px solid #40444b;
}
.message-form  {
    background-color: #40444b;
    box-sizing: border-box;
    border-radius: 10px;
    height: 44px;
    outline: none;
    width: 100%;
    border: none;
    padding: 8px 12px;
    font-size: 18px;
    color: white;
}

/* .message-input {
    outline: none;
    width: 100%;
    height: 100%;
    background-color: none;
} */
</style>