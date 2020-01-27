<template>
  <div class="room-message">
    <div
      class="message-header"
    >
    <span class="message-sender">{{getGuildCharacter(message.character_id).characterName}}</span> 
    <span class="message-time">
        {{message.updated_at}}
    </span>
    </div>
    <div class="message-body">{{message.body}}</div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  props: ["message"],
  computed: {
    ...mapGetters(["getGuildCharacter"])
  }
};
</script>

<style scoped>
    .room-message {
        padding: 20px;
    }
    .message-sender {
        color: white;
        font-size: 18px;
        margin-right: 5px;
    }
    .message-time {
        font-size: 12px;
    }
    .message-body {
        color: #DCDDDE;
        font-size: 16px;
    }
</style>