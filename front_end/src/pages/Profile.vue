<template>
<div>
<div class="page-header clear-filter" filter-color="orange">
<parallax
class="page-header-image"
style="background-image:url('img/bg5.jpg')"
>
</parallax>
<div class="container">
<h3 v-text="info.id" class="title"></h3>
<p v-text="info.name" class="category"></p>
<div class="content">
<div class="social-description">
<h2 v-text="info.email"></h2>
<p>E-mail</p>
</div>
<div class="social-description">
<h2 v-text="allergys.length"></h2>
<p>알레르기 수</p>
</div>
<div class="social-description">
<h2 v-if="info.flag==1">관리자</h2>
<h2 v-else>회원</h2>
<p>등급</p>
</div>
</div>
<p v-text="info.allergy" class="category"></p>
</div>
</div>
<div class="section">
<div class="container">
<div class="button-container">
<router-link to="/update" class="btn btn-primary btn-round btn-lg">프로필 수정</router-link>
<div class="btn btn-primary btn-round btn-lg" @click="profile()">내 섭취 정보</div>
<template v-if="info.flag==1">
<a href="#button" class="btn btn-primary btn-round btn-lg" @click="userInfo()">유저 리스트</a>
</template>
<div class="btn btn-primary btn-round btn-lg" @click="selfDelete()">탈 퇴</div>
</div>

<template v-if="foodData!=null">
<h3 class="title">내 섭취 정보</h3>
<div class="section section-about-us">
<div class="container">
<card style="width: 20rem;" class="container" v-for="food in foodData" :key="food.food.code" >
<img slot="image" class="card-img-top" :src="food.food.img" alt="Card image cap">
<div @click="foodDetail(food.food.code)">
<h4 class = "card-title" v-text="food.food.name"></h4>
섭취 횟수 : <p class = "card-title" v-text="food.count"></p>
<n-button type="primary" @click="foodDelete(food.food.code)">삭제하기</n-button>
</div>
</card>
</div>
<ul class="pagination justify-content-center pagination-primary" type="info" >
<li class="page-item prev-page">
<a class="page-link" aria-label="Previous">
<slot name="prev">≪</slot>
</a>
</li>
<li class="page-item" v-for="item in pageSize" :key="item">
<a class="page-link" @click="getProfileFoodPage(item)">{{ item }}</a>
</li>
<li class="page-item page-pre next-page">
<a class="page-link" aria-label="Next">
<slot name="next">≫</slot>
</a>
</li>
</ul>
</div>
</template>
<template v-if="userData!=null">
<h3 class="title">유저 정보</h3>
<div class="section section-about-us">
<div class="container">
<card style="width: 20rem;" class="container" v-for="user in userData" :key="user.id" >
<div>
<h4 class = "card-title" v-text="user.id"></h4>
<p class = "card-title" v-text="user.name"></p>
<p class="card-text" v-text="user.email"></p>
<p class="card-text" v-text="user.allergy"></p>
<n-button type="primary" @click="userDelete(user.id)">탈퇴시키기</n-button>
</div>
</card>
</div>
<ul class="pagination justify-content-center pagination-primary" type="info" >
<li class="page-item prev-page">
<a class="page-link" aria-label="Previous">
<slot name="prev">≪</slot>
</a>
</li>
<li class="page-item" v-for="item in pageSize" :key="item">
<a class="page-link" @click="getProfileUserPage(item)">{{ item }}</a>
</li>
<li class="page-item page-pre next-page">
<a class="page-link" aria-label="Next">
<slot name="next">≫</slot>
</a>
</li>
</ul>
</div>
</template>
</div>
</div>
</div>
</template>
<script>
import http from "../http-common";
import { Tabs, TabPane, Card, Pagination, Button } from '@/components';
export default {
name: 'profile',
bodyClass: 'profile-page',
components: {
Tabs,
TabPane,
Card,
Pagination,
Button
},
data(){
return{
info:[],
allergys:[],
foodData:[],
userData:[],
pageSize:0
}
},
methods:{
getProfileFoodPageNum(){
http
.get("/getProfileFoodPageNum/")
.then(response => {
this.pageSize = response.data;
})
},
getProfileUserPage(page) {
http
.get("/getProfileUserPage/"+page)
.then(response => {
this.userData = response.data.list;
this.pageSize = response.data.pageSize;
this.foodData=null;
})

},


getProfileFoodPage(page) {
http
.get("/getProfileFoodPage/"+page)
.then(response => {
this.foodData = response.data;
this.userData=null;
this.getProfileFoodPageNum();
})
},

foodDetail(code) {
this.$router.push("/foodDetail?code="+code);
},
selfDelete(){
this.userDelete(this.info.id);
http
.get("/logout")
.then(response=>{
this.check = false;
this.$router.push("/");
})
this.$router.push("/");
location.reload();

},
userInfo(){
this.getProfileUserPage(1);
},
userDelete(id){
http
.get("/userDelete/"+id)
.then(response=>{
if(response.status ==200){
this.userInfo();
}
})
},
profile(){
http
.get("/profile")
.then(response=>{
this.userData = null;
this.info = response.data.user;
this.allergys = this.info.allergy.split(',');
this.getProfileFoodPage(1);
})
},
foodDelete(code){
http
.get("/foodDelete/"+code)
.then(response=>{
if(response.status ==200){
this.profile();
}
})
}
},
mounted() {
http
.get("/loginCheck")
.then(response=>{
if(response.status ==204){
this.$router.push("/login");
}else{
this.profile();
}

})

}
};
</script>
<style></style>