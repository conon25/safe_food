

<template>

  <div class="page-header clear-filter" filter-color="orange">
    
    <div
      class="page-header-image"
      style="background-image: url('img/login.jpg')"
    ></div>
    <div class="content">
     
          <card style="width: 20rem;">
            <h4 class="card-title mb-2 text-muted">{{board.title}}</h4>
            <h6 class="card-subtitle mb-2 text-muted">{{board.author}}</h6>
            <p class="card-text mb-2 text-muted">{{board.content}}</p>

          </card>
    

      
    </div>
    <!-- <main-footer></main-footer> -->
  </div>
</template>


<script>
import http from "../http-common";
import {Card , Button} from '@/components';
import MainFooter from '@/layout/MainFooter';
export default {
  name: "boardDetail",
  data() {
    return {
      upHere: false,
      board : [],
      loading: true,
      errored: false
    };
  },
  components:{
    Card,
    Button,
    MainFooter
  },
  methods: {
    boardDetail(num) {
      http
        .get("/boardDetail/"+num)
        .then(response => { 
          this.board = response.data})
        .catch(() => {
          this.errored = true;
        })
        .finally(() => (this.loading = false));
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
    this.boardDetail(this.$route.query.num);
  }
};
</script>