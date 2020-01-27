<template>
  <div>
    <div class="room-messages">
        <message v-for="message in getRoomMessages(roomId)" :key="message.id" :message="message"> </message>
    </div>
    <new-message :roomId="roomId"></new-message>
    </div>
</template>

<script>
import MessageCreation from "./MessageCreation";
import { mapGetters } from "vuex";
import Message from "./Message";
export default {
  props: ["roomId"],
  components: {
    "new-message": MessageCreation,
    Message
  },
  computed: {
    ...mapGetters(["getRoomMessages", "getGuildCharacter"])
  }
};
</script>

<style scoped>
.room-messages {
    flex: 1 1 auto;
    overflow-y: auto;
    height: 0px;
}

</style>