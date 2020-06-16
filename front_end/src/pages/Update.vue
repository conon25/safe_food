<template>
  <div
    class="section section-signup"
    style="background-image: url('img/bg11.jpg'); background-size: cover; background-position: top center; min-height: 700px;"
  >
   <div class="content">
    <div class="container">
      <div class="row">
        <card class="card-signup" header-classes="text-center" color="orange">
          <template>
            <div
              v-text="id"
              class="no-border"
              
            >
            </div>

            <fg-input
              v-model="name"
              class="no-border"
                label="name"
              addon-left-icon="now-ui-icons text_caps-small"
            >
            </fg-input>

            <fg-input
              v-model="email"
              class="no-border"
                label="email"
              addon-left-icon="now-ui-icons ui-1_email-85"
            >
            </fg-input>

            <fg-input class="no-border"
                v-model="pw"
                label="Password"
                value="mypassword"
                type="password">
            </fg-input>

            <input type ="checkbox" id="allergy1" value="대두" v-model="allergys">
            <label for = "allergy1">대두</label>
            <input type ="checkbox" id="allergy2" value="땅콩" v-model="allergys">
            <label for = "allergy2">땅콩</label>
            <input type ="checkbox" id="allergy3" value="우유" v-model="allergys">
            <label for = "allergy3">우유</label>
            <input type ="checkbox" id="allergy4" value="게" v-model="allergys">
            <label for = "allergy4">게</label>
            <input type ="checkbox" id="allergy5" value="새우" v-model="allergys">
            <label for = "allergy5">새우</label>
            <input type ="checkbox" id="allergy6" value="참치" v-model="allergys">
            <label for = "allergy6">참치</label>
            <input type ="checkbox" id="allergy7" value="연어" v-model="allergys">
            <label for = "allergy7">연어</label>
            <input type ="checkbox" id="allergy8" value="쑥" v-model="allergys">
            <label for = "allergy8">쑥</label>
            <input type ="checkbox" id="allergy9" value="소고기" v-model="allergys">
            <label for = "allergy9">소고기</label>
            <input type ="checkbox" id="allergy10" value="닭고기" v-model="allergys">
            <label for = "allergy10">닭고기</label>
            <input type ="checkbox" id="allergy11" value="돼지고기" v-model="allergys">
            <label for = "allergy11">돼지고기</label>
            <input type ="checkbox" id="allergy12" value="복숭아" v-model="allergys">
            <label for = "allergy12">복숭아</label>
            <input type ="checkbox" id="allergy13" value="계란흰자" v-model="allergys">
            <label for = "allergy13">계란흰자</label>

          </template>
          <div class="card-footer text-center">
            <n-button type="neutral" round size="lg" @click="userUpdate()">수정하기</n-button>
          </div>
        </card>
      </div>
    </div>
  </div>
  </div>
</template>

<script>
import { Card, FormGroupInput, Button } from '@/components';
import http from "@/http-common";
export default {
  data(){
    return{
      id:"",
      name:"",
      pw:"",
      email:"",
      allergys:[],
      allergy:""
    }
  },
  components: {
    Card,
    [Button.name]: Button,
    [FormGroupInput.name]: FormGroupInput
  },
  methods:{
    userUpdate(){
      for(var i in this.allergys){
        this.allergy=this.allergy+this.allergys[i]+",";
      }
      if(this.allergy.length>0){
        this.allergy=this.allergy.substr(0,this.allergy.length-1);
      }
       
      window.console.log(this.allergy);
       http
        .post("/userUpdate",{
          id:this.id,
          name:this.name,
          pw:this.pw,
          email:this.email,
          allergy:this.allergy
        })
        .then(response=>{
          if(response.status ==200){
           this.$router.push("/");
           location.reload(); 
          }else{
            alert("아이디 중복");
          }
        })
    }
  },
  mounted(){
    http
    .get("/loginCheck")
    .then(response=>{
      if(response.status ==204){
           this.$router.push("/");
      }else{
          this.id = response.data.id;
          this.name = response.data.name;
        
          this.email=response.data.email;
          this.allergys = response.data.allergy.split(',');
          window.console.log(response);
          window.console.log(this.allergys);
      }
    })
  }
};
</script>
<style></style>
