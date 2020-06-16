<template v-if= "id==null" >
  <div class="page-header clear-filter" filter-color="orange">
    <div
      class="page-header-image"
      style="background-image: url('img/login.jpg')"
    ></div>
    <div class="content">
      <div class="container">
        <div class="col-md-5 ml-auto mr-auto">
          <card type="login" plain>
            <div slot="header" class="logo-container">
              <img v-lazy="'img/now-logo.png'" alt="" />
            </div>
            <fg-input
              class="no-border input-lg"
              addon-left-icon="now-ui-icons users_circle-08"
             
              label="ID"
              v-model="id"
            >
            </fg-input>
            <fg-input
              class="no-border input-lg"
              addon-left-icon="now-ui-icons text_caps-small"
              type="password"
              label="Password"
              v-model="pw"
            >
            </fg-input>

            <template slot="raw-content">
              <div class="card-footer text-center">
                <div
                  @click="loginfun()"
                  class="btn btn-primary btn-round btn-lg btn-block"
                  >Login</div
                >
              </div>
              <div class="pull-left">
                <h6>
                  <router-link to="/signupForm" class="link footer-link">Create Account</router-link>
                </h6>
              </div>
              
            </template>
          </card>
        </div>
      </div>
    </div>
    <main-footer></main-footer>
  </div>
</template>
<script>
import http from "../http-common";
import { Card, Button, FormGroupInput } from '@/components';
import MainFooter from '@/layout/MainFooter';


export default {
  name: 'login-page',
  bodyClass: 'login-page',
  data(){
    return{
    id:"",
    pw:"",
    name:"",
    email:"",
    allergy:"",
    flag:0,
    check:false
    }
  },
  components: {
    Card,
    MainFooter,
    [Button.name]: Button,
    [FormGroupInput.name]: FormGroupInput
  },
  methods:{
    loginfun(){
      http
      // .get("/login/"+this.id+"/"+ this.pw )
      .post("/login",{
        id: this.id,
        pw: this.pw

      })
      .then(response => {
          this.id = response.data.id;
          window.console.log(response);
          if(response.status ==200){
            alert("로그인 하였습니다.");
            this.submitted = true;
        
           this.$router.push("/");
           location.reload(); 
          }else{
            alert("로그인을 하지 못했습니다.");
            this.submitted = false;
          }
          
        })
        .catch(()=>{
            this.submitted = false;
        })
    }
  },
  mounted() {
    http
    .get("/loginCheck")
    .then(response=>{
      if(response.status ==200){
           this.$router.push("/");
      }
       
    })
   
  }
};
</script>
<style></style>
