let id = (id) => document.getElementById(id);

let classes = (classes) => document.getElementsByClassName(classes);

let username = id("username"),
    email = id("email"),
    password = id("password"),
    form = id("form"),
    errorMsg = classes("error"),
    successIcon = classes("success-icon"),
    failureIcon = classes("failure-icon");

form.addEventListener("submit", (e) => {
    e.preventDefault();

    engine(username, 0, "Username cannot be black");
    engine(email, 1, "Email cannot be black");
    engine(passsword, 2, "Password cannot be black");
});

let engine = (id, serial, message) => {
    if (id.value.trim() === "") {
        errorMsg[serial].innerHTML = message;
        id.style.border = "2px solid red";

        // icons
        failureIcon[serial].style.opacity = "1";
        successIcon[serial].style.opacity = "0";
    }else{
        errorMsg[serial].innerHTML = "";
        id.style.border = "2px solid green";

        // icon
        failureIcon[serial].style.opacity = "0";
        successIcon[serial].style.opacity = "1";
    }
};