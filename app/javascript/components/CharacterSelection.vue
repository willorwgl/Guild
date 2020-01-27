<template>
  <div class="character-selection" >
    <div class="right">
      <div class="selection-characters">
        <div
          v-for="character in getCharacters"
          :key="character.id"
          @click="select(character)"
          class="selection-character"
          :class="{selected: character.characterName === selected.characterName}"
        >
          <div class="character-name">{{character.characterName}}</div>
          <div class="character-class">{{character.race}} {{character.wowclass}}</div>
        </div>
      </div>
       <button class="new-character-btn" @click="$router.push('/characters/create')">New Character</button>
       <button class="confirm-btn" @click="confirmSelection">Select Character</button>
    </div>

  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
export default {
  data() {
    return {
      selected: null
    };
  },
  methods: {
    ...mapActions(["selectCharacter"]),
    select(character) {
      this.selected = character;
    },
    confirmSelection() {
      this.selectCharacter(this.selected.id).then(() => {
        this.$router.push("/guild");
      });
    }
  },
  computed: {
    ...mapGetters(["getCharacters", "getSelectedCharacter"]),
    model() {
      return null;
    }
  },
  mounted() {
    this.selected = this.getSelectedCharacter || Object.values(this.getCharacters)[0];
  }
};
</script>

<style scoped>
.selected, .selection-character:hover {
  background: #646569;
}

.character-selection {
  display: flex;
  justify-content: flex-end;
  padding: 20px;
  box-sizing: border-box;
  height: 100%;
  background: url("/assets/selection/warrior.jpeg");
  background-size: 100% 100%;
  background-repeat: no-repeat;
}

.right {
  border: 3px double black;
  border-radius: 5px;
  min-width: 240px;
  display: flex;
  flex-direction: column;
  padding: 5px;
  box-sizing: border-box;
  background-color: #2f3136;
  opacity: 0.6;
}

.selection-characters {
  flex: 1 1 auto;
  overflow: scroll;
}

.new-character-btn, .confirm-btn {
  height: 20px;
  font-weight: 600;
  cursor: pointer;
}

.selection-character {
  border-radius: 5px;
  height: 50px;
  cursor: pointer;
  padding: 8px 10px;
  box-sizing: border-box;
  margin-bottom: 2px;
}

.character-name {
  font-size: 18px;
  color: white;
}
</style>