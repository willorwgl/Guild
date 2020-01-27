<template>
  <div :class="[isSelected ? 'selected' : '', 'room-tab']">{{getGuildRoom(roomId).name}}</div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
export default {
  props: ["roomId", "currentRoomId"],
  data() {
    return {
      newMessage: 0,
      subscription: null,
      isSelected: null
    };
  },
  computed: {
    ...mapGetters(["getGuildRoom"])
  },
  watch: {
    currentRoomId: {
      handler(newVal) {
        debugger
        this.isSelected = (this.roomId == newVal)
      }
    }
  },
  methods: {
    ...mapActions(["receiveMessage"]),
    roomSetup() {
      function received(data) {
        this.receiveMessage({ roomId: this.roomId, message: data });
        this.newMessage++;
      }
      received = received.bind(this);
      this.subscription = App.cable.subscriptions.create(
        {
          channel: "RoomChannel",
          room_id: this.roomId
        },
        {
          received
        }
      );
    }
  },
  mounted() {
    this.isSelected = (this.roomId == this.currentRoomId)
    this.roomSetup();
  },
  destroyed() {
    App.cable.subscriptions.remove(this.subscription);
  }
};
</script>

<style scoped>
.room-tab {
  font-size: 16px;
  width: 100%;
  box-sizing: border-box;
  cursor: pointer;
  border-radius: 3px;
  padding: 10px 8px;
  margin: 1px 0px;
  color: #8E9297
}

.selected {
  background: #646569;
  color: white;
  font-weight: 600;
}

.room-tab:hover {
  background-color:#646569;

}
</style>>

