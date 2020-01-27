<template>
  <div class="guild-home">
    <div class="guild-home-sidebar">
      <div class="sidebar-top">
        <img src="/assets/guild_icon.png" class="sidebar-option" @click="selectedTab = 'my-guild'"  />
        <i class="fas fa-search sidebar-option" @click="selectedTab = 'guild-recruit'" ></i>
      </div>
      <div class="sidebar-bottom">
        <i class="fas fa-user-alt sidebar-option" @click="$router.push('/characters')"></i>
        <i class="fas fa-sign-out-alt fa-rotate-180 sidebar-option" @click="logout"></i>
      </div>
    </div>
      <component v-if="loaded" :is="selectedTab" @guild-not-found="selectedTab = 'guild-recruit'"></component>
  </div>
</template>

<script>
import { mapActions } from "vuex";
import GuildCreation from "./GuildCreation.vue";
import GuildRecruitment from "./GuildRecruitment";
import MyGuild from "./MyGuild";
export default {
  data() {
    return {
      loaded: false,
      selectedTab: null
    };
  },
  methods: {
    ...mapActions(["logoutUser", "fetchCharacterGuild"]),
    logout() {
      this.logoutUser().then(() => {
        this.$router.push("/");
      });
    }
  },
  components: {
    "create-guild": GuildCreation,
    "guild-recruit": GuildRecruitment,
    "my-guild": MyGuild
  },
  mounted() {
    this.fetchCharacterGuild().then(res => {
        this.selectedTab = "my-guild"
      this.loaded = true;
    });
  }
};
</script>
 
<style scoped>
.guild-home-sidebar {
  min-width: 72px;
  width: 72px;
  background-color: #23272a;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-between;
}
.guild-home {
  display: flex;
  height: 100%
}

.sidebar-top, .sidebar-bottom{
  justify-content: center;
  align-items: center;
  display: flex;
  flex-direction: column;
}



.sidebar-option {
  width: 40px;
  height: 40px;
  font-size: 36px;
  cursor: pointer;
  margin-top: 3px;
  margin-bottom: 3px;
}


</style>