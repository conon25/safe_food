<template>
  <navbar
    position="fixed"
    type="primary"
    :transparent="transparent"
    :color-on-scroll="colorOnScroll"
    menu-classes="ml-auto"
  >
    <template slot-scope="{ toggle, isToggled }">
      <router-link v-popover:popover1 class="navbar-brand" to="/">
        Food Manager
      </router-link>
      <el-popover
        ref="popover1"
        popper-class="popover"
        placement="bottom"
        width="200"
        trigger="hover"
      >

      </el-popover>
    </template>
    <template slot="navbar-menu">
      <template v-if = "check">
      <li class="nav-item">
        <router-link  class="nav-link" to = "/productList"  >
          <i class="now-ui-icons arrows-1_minimal-down"></i>
          <p>상품구매</p>
        </router-link>
      </li>
      <li class="nav-item">
        <router-link  class="nav-link" to = "/boardList"  >
          <i class="now-ui-icons arrows-1_minimal-down"></i>
          <p>공지사항</p>
        </router-link>
      </li>
      <li class="nav-item">
        <router-link  class="nav-link" to = "/main"  >
          <i class="now-ui-icons arrows-1_minimal-down"></i>
          <p>상품정보</p>
        </router-link>
      </li>
      <li class="nav-item">
        <router-link  class="nav-link" to = "/worldcup"  >
          <i class="now-ui-icons arrows-1_minimal-down"></i>
          <p>푸드컵</p>
        </router-link>
      </li>
      <li class="nav-item">
        <router-link  class="nav-link" to = "/profile"  >
          <i class="now-ui-icons arrows-1_minimal-down"></i>
          <p>프로필</p>
        </router-link>
      </li>
      <li class="nav-item">
        <a  class="nav-link" @click = "logout()"  >
          <i class="now-ui-icons arrows-1_minimal-down"></i>
          <p>로그아웃</p>
        </a>
      </li>
      </template>
      
      <template v-if = "!check">
        <li class="nav-item">
        <router-link  class="nav-link" to = "/login"  >
          <i class="now-ui-icons arrows-1_minimal-down"></i>
          <p>로그인</p>
        </router-link>
        </li>
      </template>
      
   
    </template>
  </navbar>
</template>

<script>
import http from "../http-common";

import { DropDown, NavbarToggleButton, Navbar, NavLink } from '@/components';
import { Popover } from 'element-ui';
export default {
  name: 'main-navbar',
  props: {
    transparent: Boolean,
    colorOnScroll: Number
  },
  data(){
    return {
      check:false,
      user:[]
    }
  },
  components: {
    DropDown,
    Navbar,
    NavbarToggleButton,
    NavLink,
    [Popover.name]: Popover
  },
  methods:{
    logout(){
      http
      .get("/logout")
      .then(response=>{
          window.console.log(response);
          this.check = false;
          this.$router.push("/");
      })
    }
  },
  mounted() {
    http
    .get("/loginCheck")
    .then(response=>{
      window.console.log(this.check);
      if(response.status ==200){
            this.check = true;
            this.user = response.data
            window.console.log(response);
      }
    })
  }
};
</script>

<style scoped></style>
