<template>
  <header class="home-header">
    <div class="left">
      <img src="/assets/app_logo.png" class="app-logo" />
      <span class="app-name">Guild</span>
    </div>
    <div class="right">
      <router-link to="/login" class="header-btn">Login</router-link>
      <router-link to="/signup" class="header-btn">Signup</router-link>
    </div>
  </header>
</template>

<script>
export default {};
</script>

<style scoped>
.left {
  display: flex;
  align-items: center;
}
.home-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 8px;
}
.app-name {
  font-size: 24px;
  color: white;
}
.app-logo {
  width: 50px;
  height: 50px;
  margin-right: 5px;
}
.signup-btn,
.login-btn {
  text-decoration: none;
  opacity: 1;
  padding: 10px 8px;
}

.header-btn {
  height: 30px;
  margin-left: 10px;
  background-color: #646569;
  color: white;
  border-radius: 5px;
  padding: 8px 10px;
  box-sizing: border-box;
  cursor: pointer;
  text-decoration: none;
}
</style>


