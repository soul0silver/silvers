$(document).ready(function () {
          $('input[name="username"]').on('input',function(){
                    uname=$('input[name="username"]').val();
                    const min=3,max=25;
                    if (uname==="")
                    $('.error1').text("Cannot blank");
                    else if (uname.length<3||uname.length>25) $('.error1').text("user name must include 3-25 charactors");
                    else $('.error1').text("");
          });
          $('input[name="email"]').on('input',function(){
                    e=$('input[name="email"]').val();
                    const re=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                    if (e=="")
                    $('.error1').text("Cannot blank");
                    else if (!re.test(e)) $('.error2').text("email is not valid");
                    else $('.error2').text("");
          });
          $('input[name="password"]').on('input',function(){
                    pass=$('input[name="password"]').val();
                    const re=new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
                   
                    if (pass=="")
                    {$('.error3').text("Cannot blank");$('#er3').css("height","15px");}
                    else if (!re.test(pass)) 
                    {
                              $('.error3').text("password must have at least 8 characters that include at least 1 lowercase"+"character, 1 uppercase character, 1 number, and 1 special character in (!@#$%^&*)");
                              $('#er3').css("height","40px");
                    }
                    else {$('.error3').text("");$('#er3').css("height","15px");}

          });
          $('input[name="repeat-password"]').on('input',function(){
                    pass=$('input[name="password"]').val();
                    repass=$('input[name="repeat-password"]').val();
                   
                    if (pass!=repass)
                    {$('.error4').text("Not match");
                    }
                    else if (pass===repass){$('.error4').text("");}

          });

})