<template>
  <div class="guild-recruitment">
    <create-guild class="top"></create-guild>
    <div class="guilds bottom">
      <div v-for="guild in getGuilds" :key="guild.id" class="guild" :class="guild.faction">
          <div class="guild-top">
              <span class="guild-name">
            {{guild.name}}
            </span> 
            <span>type:</span>
            <span class="guild-type">
                 {{guild.guildtype}}
            </span>
            <span>description: </span>
            <span class="guild-description">
                {{guild.description}}
            </span>

   
          </div>
        
        <button class="guild-bottom join-btn"
          v-if="!getCharacterGuild && guild.faction === getSelectedCharacter.faction"
          @click.prevent="joinGuild({'guildId': guild.id, 'characterId': getSelectedCharacter.id})"
        >Join guild</button>
      </div>
    </div>
  </div>
</template>
<script>
import { mapActions, mapGetters } from "vuex";
import GuildCreation from "./GuildCreation";
export default {
  computed: {
    ...mapGetters(["getSelectedCharacter", "getGuilds", "getCharacterGuild"])
  },
  methods: {
    ...mapActions(["fetchGuilds", "joinGuild"]),
  },
  components: {
    "create-guild": GuildCreation
  },
  mounted() {
    this.fetchGuilds(this.getSelectedCharacter.realm);
  }
};
</script>
<style scoped>
.top {
  height: 200px;
  background-color: #2f3136;
box-shadow: 0 4px 5px -5px black;
}

.guild-recruitment {
  display: flex;
  flex-direction: column;
  flex: 1 1 auto;
}

.bottom {
  flex: 1 1 auto;
  background-color: #36393f;
}
.guilds {
    display: flex;
    justify-content: center;
    padding: 20px;
    flex-wrap: wrap
}
.guild {
    border-radius: 5px;
    width: 200px;
    height: 250px;
    margin: 5px;
    padding: 10px 8px;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    align-items: center;
    color: white;
}

.guild span  {
    text-align: center;
}

.horde {
    background-image: url("/assets/horde.jpg");
    background-size: 100% 100%;
    background-repeat: no-repeat;
}

.alliance {
    background-image: url("/assets/alliance.png");
    background-size: 100% 100%;
    background-repeat: no-repeat;
}

.guild-name {
    color: white;
    font-size: 24px;
}

.guild-description, .guild-type {
    color: white;
    word-wrap: break-word;
    width: 190px;
}

.guild-top {
    display: flex;
    flex-direction: column;
    align-items: center;
    flex: 1 1 auto;
}

.join-btn {
    width: 100px;
    height: 20px;
}


</style>