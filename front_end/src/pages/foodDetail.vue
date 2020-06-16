
<template>
  <div>
    <div class="page-header clear-filter" filter-color="orange">
      <parallax
        class="page-header-image"
        style="background-image:url('img/bg5.jpg')"
      >
      </parallax>
      <div class="container">
        <div class="photo-container">
          <img :src="food.img" alt="" />
        </div>
        <h3 class="title">{{food.name}}</h3>
        <p class="category">{{food.maker}}</p>
        <n-button type="primary" @click="addMyFood(food.code)">꿀꺽</n-button>
        <div class="content">
          <div class="social-description">
            <h2>{{food.count}}</h2>
            <p>Click</p>
          </div>
          <div  class="social-description">
            <badge type="danger" v-for="warnMaterial in warnMaterials" :key="warnMaterial">{{warnMaterial}}</badge>
            <p>Warn</p>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <h4 class="title">알러지 유발 성분</h4>
        <h5 class="description">
          <badge type="warning" v-for="a in allergys" :key="a">{{a}}</badge>
        </h5>
        
        <h4 class="title">전성분</h4>
        <h5 class="description">
          <badge type="primary" v-for="m in materials" :key="m">{{m}}</badge>
        </h5>
        
        <div style="display: none">
				<div id="carbo">{{food.carbo}}</div>
				<div id="protein">{{food.protein}}</div>
				<div id="fat">{{food.fat}}</div>
				<div id="sugar">{{food.sugar}}</div>
				<div id="natrium">{{food.natrium}}</div>
				<div id="chole">{{food.chole}}</div>
				<div id="fattyacid">{{food.fattyacid}}</div>
				<div id="transfat">{{food.transfat}}</div>
				</div>

        <div id="piechart"></div>
        
        
      </div>
    </div>
  </div>


</template>


<script>

import http from "../http-common";
import {Tabs, TabPane,Badge,Button} from '@/components';
import MainFooter from '@/layout/MainFooter';
export default {
  name: "main",
  bodyClass: 'profile-page',
  data() {
    return {
      upHere: false,
      food: [],
      allergys:[],
      materials:[],
      warnMaterials: [],
      chk:[],
      loading: true,
      errored: false,

    };
  },
  components:{
    Tabs,
    TabPane,
    Badge,
    'n-button' : Button
  },
  methods: {
    getFood(code) {
      http
        .get("/fooddetail/"+code
        )
        .then(response => {this.food = response.data.food , this.warnMaterials = response.data.warnMaterials, this.materials = response.data.food.material.split(","), this.allergys = response.data.food.allergy.split(" ")})
        .catch(() => {
          this.errored = true;
        })
        .finally(() => (this.loading = false));
    },
    addMyFood(code) {
      http
        .post("/addMyFood/"+code
        )
        .then(response => {
          if(response.data == 'SUCS'){
            alert("추가 성공");
          }
        
        } )
        .catch(() => {
          this.errored = true;
        })
        .finally(() => (this.loading = false));

        
    },
    
  },

  mounted() {
    this.getFood(this.$route.query.code);
  }
};
</script>
