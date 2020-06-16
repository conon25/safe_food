

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
          <h1 class="title">글작성</h1>
          <div class="text-center2">
          </div>
        </div>
      </div>
    </div>

    <div class="section section-about-us">
      <form action method="post" id="_ffrmForm" name="frmForm" @submit.prevent="addBoard">
        <div class="container">
				<div class="text-center">
					<div class="control-group form-group">
						<div class="controls">
							<input type="text" readonly="readonly"
								v-model="user.id" class="form-control" name="author" 
								required
								data-validation-required-message="Please enter your name.">

							<p class="help-block"></p>
						</div>
					</div>

					<div class="control-group form-group">
						<div class="controls">
              <input type="text" name="title" v-model="title"
								class="form-control" required
								data-validation-required-message="Please enter your email address.">
						</div>
					</div>

					<div class="control-group form-group">
						<div class="controls">

							<textarea style="max-height: 380px; border-left: 1px solid #e3e3e3; border-right: 1px solid #e3e3e3; border-top: 1px solid #e3e3e3;" name="content" v-model="content" class="form-control"
								rows="50" cols="80"></textarea>
						</div>
					</div>

					<div id="success"></div>
					<!-- For success/fail messages -->
				
          <button type="submit" >등록</button>
				</div>
      </div>
		</form>


        
      
    </div>
  </div>
  

</template>

<script>
import http from "../http-common";
import Button from '@/components'
  export default {
  name: "addBoard",
  data() {
    return {
      user:[],
      title:"",
      content:"",
      author:""
    };
  },
  components:{
    'n-button' : Button
  },
  
  methods: {
    addBoard() {
      http
        .post("/addBoard" , {
          title : this.title,
          content : this.content,
          author : this.user.id
        })
        .then(response => {
          
           this.$router.push("/boardList");
        })
        .catch(() => {
          this.errored = true;
        })
        .finally(() => (this.loading = false));
    }   
  },
  mounted() {
    http
    .get("/loginCheck")
    .then(response=>{
      window.console.log(response);
      this.user = response.data;
      if(response.status !=200 || this.user.flag==0){
           this.$router.push("/");
      }
       
    })
   
  }
}
</script>