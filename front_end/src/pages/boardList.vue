

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
          <h1 class="title">공지사항</h1>
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
                <fg-input  class="col-6" placeholder="Left icon" addon-left-icon="now-ui-icons ui-1_zoom-bold"  v-model = "sinfo" v-on:keydown = "getFoodsByCon(1,sinfo,items1)">
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
        <router-link class="nav-link" to="/addBoard">글쓰기</router-link>
          <div  v-for="b in boards" :key="b.num">
              <card class="card-nav-tabs" header-classes="card-header-success">
                 <blockquote class="blockquote blockquote-primary mb-0" @click="boardDetail(b.num)">
                   <p>{{b.title}}</p>
                   <footer class="blockquote-footer">{{b.author}} <cite title="Source Title">Date : </cite></footer>
                 </blockquote>
              </card>
             
          </div>

          
      
      </div>


            <ul class="pagination justify-content-center pagination-primary" type="info" >
              <li class="page-item prev-page">
                <a class="page-link" aria-label="Previous">
                  <slot name="prev">«</slot>
                </a>
              </li>
              <li class="page-item" v-for="item in pageSize" :key="item">
                <a class="page-link" @click="getBoards(item)">{{ item }}</a>
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
export default {
  name: "boardList",
  data() {
    return {
      upHere: false,
      boards: [],
      pageSize: [],
      loading: true,
      errored: false
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
    getBoards(page) {
      http
        .get("/boardList/"+page)
        .then(response => {this.boards = response.data.list , this.pageSize = response.data.pageSize})
        .catch(() => {
          this.errored = true;
        })
        .finally(() => (this.loading = false));
    },
    boardDetail(num) {
      this.$router.push("/boardDetail/"+num);
    },
    
    
  },

  mounted() {
    http
    .get("/loginCheck")
    .then(response=>{
      if(response.status !=200){
           this.$router.push("/");
      }
    })
    this.getBoards(1);
  }
};
</script>