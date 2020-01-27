<template>
  <div class="home-container">
    <app-header></app-header>
  </div>
</template>

<script>
import Header from "./Header";
export default {
  components: {
    "app-header": Header
  }
};
</script>

<style scoped>
.home-container {
  background-image: url("/assets/homeSplash.jpg");
  width: 100%;
  height: 100%;
  background-repeat: no-repeat;
  background-size: 100% 100%;
}
</style>