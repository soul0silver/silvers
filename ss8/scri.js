alert('Unsafe Conection.');
let a="JavaScript";
console.log(a);
let mes=true
if (mes) console.log("aaaaa")
if (window.localStorage){
          console.log('JavaScript support LocalStorage')
}
//undefined kieu du lieu ko xac dinh khi khai bao let var chua gan giá trị
//kiểu object
let obj=null
console.log(typeof(obj))
console.log(Number.MAX_VALUE)
//Nan Not a Number
console.log('t'/2)
//string
var s='javaS'
s[4]='s'
console.log(s)
//Object type
let studentObject={
          fName:'Nguyen',
          lName:'Dat'
}
console.log(studentObject.fName)
console.log(studentObject.lName)
//contact detail
let contact={
          fName:'Nguyen',
          lName:'Dat',
          email:'0wtfwtf0@gmail.com',
          phone:'0325826525',
          address:{
                    street:'trường chinh',
                    commune: 'PM',
                    provine:'',
                    district:''
          }
};
//truy cập bằng dấu . hoặc[]
//kiểm tra sự tồn tại
//tên thuộc tính in tên đóio tượng
console.log('age' in contact)
let month=3;
if ()