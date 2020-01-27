<template>
  <div v-if="loaded" class="myguild">
    <div class="myguild-header">
      <div class="header-left">{{getCharacterGuild.name}}</div>
      <div class="header-right">
        <span class="room-name">{{currentRoomId ? getGuildRooms[[currentRoomId]].name : ""}}</span>
        <div class="leave-guild" @click="leave">Leave guild</div>
      </div>
    </div>
    <div class="myguild-container">
      <div class="myguild-left">
        <!-- <new-room></new-room> -->
        <div  class="myguild-room-tabs">
          <room-tab
            v-for="room in getGuildRooms" 
            :key="room.id"
            @click.native="selectRoom(room.id)"
            :roomId="room.id"
            :currentRoomId="currentRoomId"
          ></room-tab>
        </div>
        <create-room></create-room>
      </div>
      <div class="room-container">
      <room
        v-for="room in getGuildRooms"
        v-show="room.id == currentRoomId"
        :key="room.id"
        :roomId="room.id"
        class="myguild-room"
      ></room>
      </div>
 
      <div class="myguild-right">
        <div class="guild-characters">
          <guild-character
            v-for="character in getGuildCharacters"
            :key="character.id"
            :character="character"
          ></guild-character>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapGetters, mapActions } from "vuex";
import Room from "./Room";
import RoomCreation from "./RoomCreation";
import RoomTab from "./RoomTab";
import GuildCharacter from "./GuildCharacter";
export default {
  data() {
    return {
      currentRoomId: null,
      loaded: false
    };
  },
  computed: {
    ...mapGetters([
      "getCharacterGuild",
      "getGuildRooms",
      "getRoomMessages",
      "getGuildCharacters",
      "getSelectedCharacter"
    ])
  },
  methods: {
    ...mapActions(["fetchGuildRooms", "fetchGuildCharacters", "leaveGuild"]),
    selectRoom(roomId) {
      this.currentRoomId = roomId;
    },
    leave() {
      this.leaveGuild(this.getSelectedCharacter.id).then((res) => {
              this.$emit("guild-not-found")
      })

    }
  },
  components: {
    "create-room": RoomCreation,
    room: Room,
    "room-tab": RoomTab,
    "guild-character": GuildCharacter
  },
  mounted() {
    const guild = this.getCharacterGuild;
    if (guild) {
      Promise.all([
        this.fetchGuildRooms(guild.id),
        this.fetchGuildCharacters(guild.id)
      ]).then(() => {
        this.currentRoomId = Object.keys(this.getGuildRooms)[0];
        this.loaded = true;
      });
    } else {
      this.$emit("guild-not-found")
    }
  }
};
</script>
<style scoped>
.myguild-left,
.myguild-right {
  display: flex;
  flex-direction: column;
  background-color: #2f3136;
  box-sizing: border-box;
  min-width: 240px;
  padding: 0 10px;
}
.myguild-container {
  display: flex;
  flex: 1 1 auto;
  overflow: scroll; 
}

.myguild-header {
  min-height: 49px;
  display: flex;
  box-shadow: 0 4px 5px -5px black;
  position: relative;
}

.header-left {
  width: 240px;
  background-color: #2f3136;
  font-size: 18px;
  color: white;
  padding: 0 16px;
  box-sizing: border-box;
  line-height: 49px;
}

.room-name {
  font-size: 18px;
  color: white;
  padding: 0 16px;
  box-sizing: border-box;
}
.header-right {
  display: flex;
  flex-grow: 1;
  justify-content: space-between;
  align-items: center;
  background-color: #36393f;
}

.myguild-room {
  display: flex;
  height: 100%;
  
}

.room-container {
  flex: 1 1 auto;
  background-color: #36393f;
}

.myguild {
  display: flex;
  flex-direction: column;
  flex-grow: 1;
}

.myguild-room {
  display: flex;
  flex-direction: column;
}

.myguild-room-tabs {
  margin-top: 10px;
  flex: 1 1 auto;
  overflow: scroll;
}

.leave-guild {
height: 30px;
  margin-left: 10px;
  background-color: #646569;
  color: white;
  border-radius: 5px;
  padding: 8px 10px;
  box-sizing: border-box;
  cursor: pointer;
  margin-right: 10px;
}








</style>