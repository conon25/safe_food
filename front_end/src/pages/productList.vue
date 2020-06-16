

<template>
  <div>
    <div class="page-header page-header-small">
      <parallax
        class="page-header-image"
        style="background-image: url('img/bg6.jpg')"
      >
      </parallax>
   
      <div class="content-center">
        <div class="container">
          <h1 class="title">상품구매</h1>
          <div class="text-center2">
            <form action="">
              <div class="container">
                <div class="text-center2">
                  <input type="hidden" style ="VISIBLEITY: hidden; WIDTH: 0px">
                <fg-input  class="col-6" placeholder="Left icon" addon-left-icon="now-ui-icons ui-1_zoom-bold"  v-model = "key" v-on:keyup = "search(key)">
                </fg-input>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    


    <div class="section section-about-us">
      <div class="container">
          <card style="width: 20rem;" class="container" v-for="i in items" :key="i.title">
            <a v-bind:href="i.link" target="_blank">
            <img slot="image" class="card-img-top" :src="i.image" alt="Card image cap">
            </a>
            <div>
              <h5 class="card-title mb-2 text-muted" v-html="i.title" ></h5>
              <h6 class="card-subtitle mb-2 text-muted">{{i.description}}</h6>
              <h6 class="card-subtitle mb-2 text-muted">{{i.lprice}}</h6>
              <h6 class="card-subtitle mb-2 text-muted">{{i.mallName}}</h6>
            </div>
          </card>
      </div>
    </div>
  </div>
  

</template>


<script>
import http from "../http-common";
import {Card , Button, Pagination, DropDown ,FormGroupInput} from '@/components';
import MainFooter from '@/layout/MainFooter';
import { Popover } from 'element-ui';
export default {
  name: "main",
  props: {
    transparent: Boolean,
    colorOnScroll: Number
  },
  data() {
    return {
      upHere: false,
      foods: [],
      pageSize: [],
      loading: true,
      errored: false,
      sinfo:"",
      items1:"",
      items2:'',
      items:[],

    };
  },
  components:{
    Card,
    Button,
    DropDown,
    MainFooter,
    Pagination,
    'fg-input':FormGroupInput

  },
  methods: {
    getFoods(page) {
      http
        .get("/getFoods/"+page
        )
        .then(response => {this.foods = response.data.list , this.pageSize = response.data.pageSize})
        .catch(() => {
          this.errored = true;
        })
        .finally(() => (this.loading = false));
    },
    search(key) {
      
      if(key != null || key != ""){
        http
        .get("/getProducts/"+key
        )
        .then(response => {
          this.items = response.data.items
          window.console.log(response);
          window.console.log(this.items);
        })
        .catch(() => {
          this.errored = true;
        })
        .finally(() => (this.loading = false));
      }
      
    },
    foodDetail(code) {
      this.$router.push("/foodDetail?code="+code);
    }
  },

  mounted() {
    http
    .get("/loginCheck")
    .then(response=>{
      window.console.log(response);
      this.user = response.data;
      if(response.status !=200){
           this.$router.push("/");
      }
    })
    this.getFoods(1);
  }
};
</script>
<style scoped></style>