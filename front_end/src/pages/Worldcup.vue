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
<h1 class="title">FOOD CUP</h1>
<div class="text-center">

</div>
</div>
</div>
</div>
<div class="content-center">
<div class="text-center">

<template v-if="winner==null">
<h3 class="title">{{depth}} 강 {{cnt}}/{{depth/2}}</h3>
<div class="section section-about-us">
<div>
<card style="width: 20rem;">
<img slot="image" class="card-img-top" :src="food1.img" alt="Card image cap" @click="imgclick(1)">
<div>
<h4 class = "card-title" v-text="food1.name"></h4>
</div>
</card>
<card style="width: 20rem;">
<img slot="image" class="card-img-top" :src="food2.img" alt="Card image cap" @click="imgclick(2)">
<div>
<h4 class = "card-title" v-text="food2.name"></h4>
</div>
</card>
</div>
</div>
</template>
<template v-else>
<h3 class="title">1등</h3>
<card style="width: 20rem;">
<img slot="image" class="card-img-top" :src="winner.img" alt="Card image cap">
<div>
<h4 class = "card-title" v-text="winner.name"></h4>
<n-button type="primary" @click="reloadFunc()">다시하기</n-button>
</div>
</card>
</template>
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
food1:[],
food2:[],
cnt:1,
depth:16,
foodData1:[],
foodData2:[],
foodData3:[],
foodData4:[],
winner:null
}
},
components: {
Card,
[Button.name]: Button,
[FormGroupInput.name]: FormGroupInput
},
methods:{
startFunc(){
http
.post("/foodWorldcup")
.then(response=>{
window.console.log(response);
this.foodData1 = response.data;
this.cnt=1;
this.depth=16;
this.foodData2=[];
this.foodData3=[];
this.foodData4=[];
this.food1 = this.foodData1.pop();
this.food2 = this.foodData1.pop();
this.winner=null;
})
},
reloadFunc(){
this.startFunc();
},
imgclick(num){
if(this.depth ==16){
if(num == 1){
this.foodData2.push(this.food1);
}else if(num==2){
this.foodData2.push(this.food2);

}
window.console.log(this.foodData2);
this.cnt++;
if(this.cnt==9){
this.cnt=1;
this.depth = 8;
this.food1 = this.foodData2.pop();
this.food2 = this.foodData2.pop();
}else{
this.food1 = this.foodData1.pop();
this.food2 = this.foodData1.pop();
}
}else if(this.depth ==8){
if(num == 1){
this.foodData3.push(this.food1);

}else if(num==2){
this.foodData3.push(this.food2);
}
this.cnt++;
if(this.cnt==5){
this.cnt=1;
this.depth = 4;
this.food1 = this.foodData3.pop();
this.food2 = this.foodData3.pop();
}else{
this.food1 = this.foodData2.pop();
this.food2 = this.foodData2.pop();
}
}else if(this.depth ==4){
if(num == 1){
this.foodData4.push(this.food1);

}else if(num==2){
this.foodData4.push(this.food2);
}
this.cnt++;
if(this.cnt==3){
this.cnt=1;
this.depth = 2;
this.food1 = this.foodData4.pop();
this.food2 = this.foodData4.pop();
}else{
this.food1 = this.foodData3.pop();
this.food2 = this.foodData3.pop();
}
}else if(this.depth ==2){
if(num == 1){
this.winner = this.food1;
}else if(num==2){
this.winner = this.food2;
}
}

}
},
mounted(){
http
.get("/loginCheck")
.then(response=>{
if(response.status ==204){
this.$router.push("/login");
}else{
this.startFunc();
}
});

}
};
</script>
<style></style>