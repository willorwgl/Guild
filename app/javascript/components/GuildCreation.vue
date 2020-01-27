<template>
  <form action="#" v-if="!getCharacterGuild" class="guild-form">
    <input type="text" v-model="$v.name.$model" class="name-input" placeholder="Guild name" />
    <input
      type="text"
      v-model="description"
      class="description-input"
      placeholder="Guild description"
    />
    <select @click="select" class="select-type">
      <option v-for="option in typeOptions" :key="option" :value="option" :selected="option === 'raiding'">{{option}}</option>
    </select>
    <div class="confirm" @click="create">Create Guild</div>
  </form>

  <div v-else class="guild-alt">
    <div class="guild-btn">Go to guild</div>
    <div class="guild-btn" @click="leaveGuild(getSelectedCharacter.id)">Leave Guild</div>
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
import { required, minLength } from "vuelidate/lib/validators";
import * as WOW from "../wow";
export default {
  data() {
    return {
      name: "",
      description: "",
      guildtype: "raiding",
      typeOptions: WOW.guildTypes
    };
  },
  computed: {
    ...mapGetters(["getCharacterGuild", "getSelectedCharacter"])
  },
  methods: {
    ...mapActions(["createGuild", "leaveGuild"]),
    create() {
      this.createGuild(this.$data);
    },
    select(e) {
      this.guildtype = e.target.value;
    }
  },
  validations: {
    name: {
      required,
      minLength: minLength(2)
    }
  }
};
</script>

<style scoped>
.name-input,
.description-input,
.select-type {
  height: 30px;
  outline: none;
  border: none;
  background: none;
  box-shadow: 0 4px 5px -5px white;
  color: white;
  font-size: 18px;
  padding: 8px 10px;
  box-sizing: border-box;
}

.name-input {
  width: 150px;
}

.description-input {
  width: 250px;
}

.guild-form {
  display: flex;
  justify-content: center;
  align-items: center;
}

.confirm, .guild-btn {
  height: 30px;
  margin-left: 10px;
  background-color: #646569;
  color: white;
  border-radius: 5px;
  /* line-height: 30px; */
  padding: 8px 10px;
  box-sizing: border-box;
  cursor: pointer;
}

.guild-alt {
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
}
</style>