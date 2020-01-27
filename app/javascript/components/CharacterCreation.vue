<template>
  <div class="character-creation">
    <audio src="/assets/character_creation.mp3" autoplay loop></audio>
    <audio src="/assets/horde_battlecry.mp3" ref="horde"></audio>
    <audio src="/assets/alliance_battlecry.ogg" ref="alliance"></audio>

    <div class="top">
      <div class="select-gender">
        <i class="fas fa-mars male" @click="gender = 'male'"></i>
        <i class="fas fa-venus female" @click="gender = 'female'"></i>
      </div>
      <div class="wow-classes ">
         <img
        v-for="className in availableClasses"
        :key="className"
        @click="selectClass(className)"
        :src="`/assets/class_icons/${className}.png`"
        class="wow-class"
      />
      </div>
      <div class="select-realm-container">
        <select class="select-realm" @change="selectRealm">
        <option v-for="realmName in availableRealms" :value="realmName" :key="realmName" :selected="realm === realmName">{{realmName}}</option>
      </select>
      </div>

    </div>

    <div class="middle">
      <div class="alliance-races">
        <img
          v-for="raceName in availableRaces.alliance"
          :key="raceName"
          @click="selectRace(raceName)"
          :src="`/assets/race_icons/${raceName}.png`"
          class="wow-race"
        />
      </div>
      <div class="model-container">
        <img :src="`assets/models/${currentModel}.gif`" class="character-model" />
      </div>

      <div class="horde-races">
        <img
          v-for="raceName in availableRaces.horde"
          :key="raceName"
          @click="selectRace(raceName)"
          :src="`/assets/race_icons/${raceName}.png`"
          class="wow-race"
        />
      </div>
    </div>
    <div class="bottom">
      <input type="text" v-model="$v.characterName.$model" class="name-input" placeholder="Character name" @keyup.enter="create"/>
    </div>
  </div>
</template>
<script>
import * as WOW from "../wow";
import { required, minLength } from "vuelidate/lib/validators";
import { mapActions } from "vuex";

export default {
  data() {
    return {
      availableClasses: WOW.classes,
      wowclass: null,
      race: null,
      gender: null,
      faction: null,
      realm: null,
      characterName: "",
      availableRealms: WOW.realms
    };
  },
  methods: {
    ...mapActions(["createCharacter"]),
    selectClass(className) {
      this.wowclass = className;
      if (this.wowclass === "paladin" && this.faction === "horde") {
        this.faction = "alliance";
        this.race = WOW.playableRaces.alliance.paladin.sample();
      }
      if (this.wowclass === "shaman" && this.faction === "alliance") {
        this.faction = "horde";
        this.race = WOW.playableRaces.horde.shaman.sample();
      }
      const availableRaces = WOW.playableRaces[[this.faction]][[this.wowclass]];
      if (!availableRaces.includes(this.race)) {
        this.race = availableRaces.sample();
      }
    },
    selectRace(raceName) {
      this.race = raceName;
      if (this.faction === "horde" && !WOW.races.horde.includes(this.race)) {
        this.faction = "alliance";
      }
      if (
        this.faction === "alliance" &&
        !WOW.races.alliance.includes(this.race)
      ) {
        this.faction = "horde";
      }
    },
    create(e) {
      this.$v.$touch();
      if (!this.$v.$invalid) {
        this.createCharacter(this.$data).then(res => {
          this.$router.push("/characters");
        });
      }
    },
    selectRealm(e) {
      this.realm = e.target.value
    }
  },
  watch: {
    faction() {
      const horde = this.$refs.horde;
      const alliance = this.$refs.alliance;
      if (this.faction === "horde") {
        if (alliance.currentTime > 0) {
          alliance.pause();
          alliance.currentTime = 0;
        }

        horde.play();
      } else {
        if (horde.currentTime > 0) {
          horde.pause();
          horde.currentTime = 0;
        }
        alliance.play();
      }
    }
  },
  computed: {
    availableRaces() {
      return {
        alliance: WOW.playableRaces.alliance[[this.wowclass]],
        horde: WOW.playableRaces.horde[[this.wowclass]]
      };
    },
    currentModel() {
      if (this.wowclass && this.gender && this.race) {
        return this.race + this.gender + this.wowclass;
      }
      return null;
    }
  },
  validations: {
    characterName: {
      required,
      minLength: minLength(3)
    }
  },
  mounted() {
    this.gender = WOW.genders.sample();
    this.faction = WOW.factions.sample();
    this.wowclass = WOW.playableClasses[[this.faction]].sample();
    this.race = WOW.playableRaces[[this.faction]][[this.wowclass]].sample();
    this.realm = WOW.realms.sample();
  }
};
</script>
<style scoped>
.wow-class,
.wow-race {
  width: 70px;
  height: 70px;
  cursor: pointer;
}

.wow-classes {
  display: flex;
  justify-content: center;
  flex: 1 1 auto;
}
.top {
  padding-top: 5px;
  display: flex;
}

.character-creation {
  background-image: url("/assets/character_creation.jpg");
  background-size: 100% 100%;
  background-repeat: no-repeat;
  height: 100%;
}

.middle {
  display: flex;
  flex: 1 1 auto;
}

.alliance-races,
.horde-races {
  display: flex;
  flex-direction: column;
  justify-content: center;
  min-width: 70px;
}

.alliance-races {
  margin-left: 50px;
}

.horde-races {
  margin-right: 50px;
}

.model-container {
  flex: 1 1 auto;
  display: flex;
  justify-content: center;
}

.bottom {
  display: flex;
  justify-content: center;
  height: 40px;
}


.name-input {
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
}

.male {
  color: #194260;
  cursor: pointer;
}

.female {
  color: #FB9AAC;
  cursor: pointer;
}

.select-gender {
  font-size: 48px;
  display: flex;
  margin-left: 50px;
  width: 100px;
  align-items: center;
  justify-content: space-evenly;
}

.select-realm-container {
  width: 100px;
  margin-right: 50px;
  display: flex;
  align-items: center;
}

.select-realm {
  font-size: 12px;
  outline: none;
  background: none;
  color: white;
  height: 40px;
  font-weight: 600;
}
</style>