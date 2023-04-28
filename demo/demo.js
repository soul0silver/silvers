const user={username:"silver",email:"abc@gmail.com",password:"abcd"};
$(document).ready(function(){
          $('.success-icon').hide();
          $('.fail-icon').hide();
$('input[name="username"]').on('input',function(){
          uname=$('input[name="username"]').val();
          
          if (uname===user.username) 
          {
                    $('.user-r').fadeIn();
                    $('.user-w').hide()
                    $('.error1').hide()
          } else {
                    $('.user-w').fadeIn();
                    $('.user-r').hide();
                    $('.error1').text("undifined username");
          }

       }) ;
$('input[name="email"]').on('input',function(){
          e=$('input[name="email"]').val();
          
          if (e===user.email) 
          {
                    $('.e-r').fadeIn();
                    $('.e-w').hide();
                    $('.error2').hide()
          } else {$('.e-w').fadeIn();$('.e-r').hide();$('.error2').text("undifined email");}
       })  
var pass="";
      $('input[name="password"]').on('input',function () { 
        pass=$('input[name="password"]').val(); 
        $('button').on('click',function(){
         if (pass!=user.password) 
  {  
     $('.error3').text("wrong password");$('.p-w').fadeIn();$('.p-r').hide();   
  }
  else if (pass===user.password) {  
   $('.error3').hide();$('.p-r').fadeIn();$('.p-w').hide();   
}
      });
   });
               

// $('button').on('click',function(){
//                 if (pass==""&& pass!=user.password) 
//          {  
//             $('.error3').text("wrong password");$('.p-w').fadeIn();$('.p-r').hide();   
//          }
         
//          });
})   