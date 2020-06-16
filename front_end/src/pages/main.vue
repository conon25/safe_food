

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
          <h1 class="title">상품정보</h1>
          <div class="text-center2">
            <form action="">
              <div class="container">
                <div class="text-center2">
              <drop-down class="btn-group">
                  <template slot="title">
                    <button type="button" class="btn btn-danger" v-text="items1">선택</button>
                      <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <span class="sr-only">Toggle Dropdown</span>
                    </button>
                  </template>
                  <h6 class="dropdown-header">옵션</h6>
                  <a class="dropdown-item" href="#" @click="setOption('name')">이름</a>
                  <a class="dropdown-item" href="#" @click="setOption('maker')">제조사</a>
                  <a class="dropdown-item" href="#" @click="setOption('material')">성분</a>
              </drop-down>
                <fg-input  class="col-6" placeholder="Left icon" addon-left-icon="now-ui-icons ui-1_zoom-bold"  v-model = "sinfo" v-on:keyup = "getFoodsByCon(1,sinfo,items1)">
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
          <card style="width: 20rem;" class="container" v-for="f in foods" :key="f.code">
            <img slot="image" class="card-img-top" :src="f.img" alt="Card image cap">
            <div>
              <h5 class="card-title mb-2 text-muted" @click="foodDetail(f.code)" >{{f.name}}</h5>
              <h6 class="card-subtitle mb-2 text-muted">{{f.maker}}</h6>
            </div>
          </card>
      </div>


      <ul class="pagination justify-content-center pagination-primary" type="info" >
        <li class="page-item prev-page">
          <a class="page-link" aria-label="Previous">
            <slot name="prev">«</slot>
          </a>
        </li>
        <li class="page-item" v-for="item in pageSize" :key="item">
          <a v-if="items1 === '' || sinfo === ''" class="page-link" @click="getFoods(item)">{{ item }}</a>
          <a v-else class="page-link" @click="getFoodsByCon(item,sinfo,items1)">{{ item }}</a>
        </li>
        <li class="page-item page-pre next-page">
          <a class="page-link" aria-label="Next">
            <slot name="next">»</slot>
          </a>
        </li>
      </ul>  
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
    setOption(val) {
      if(val == "name"){
        this.items1 = "name";
      }else if(val == "maker"){
        this.items1 = "maker";
      }else if(val == "material"){
        this.items1 = "material";
      }
      
    },
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
    getFoodsByCon(page,sinfo,items1) {
      if(sinfo == '' || sinfo == null){
        http
        .get("/getFoods/"+1
        )
        .then(response => {this.foods = response.data.list , this.pageSize = response.data.pageSize})
        .catch(() => {
          this.errored = true;
        })
        .finally(() => (this.loading = false));
      }else{
        http
        .get("/searchByAsync/"+page+"/"+sinfo+"/"+items1
        )
        .then(response => {this.foods = response.data.list , this.pageSize = response.data.pageSize})
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