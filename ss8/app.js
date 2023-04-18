

function functionUserDefine(){
                    let s=['co 01 chu cai viet hoa','co it nhat 1 so','co it nhat 1 ky tu dac BiquadFilterNode'];
                    let count=[0,0,0];
                    let text="";
                    text=document.getElementById('mess').value;
                    for (let i=0;i<text.length;i++) 
                    if (text[i]>='A'&&text[i]<='Z') count[0]++;
                    else if(text[i]>='0'&&text[i]<='9') count[1]++;
                    else if(text[i]>='!'&&text[i]<='/') count[2]++;       
                    let show=s[0]+'<br>'+s[1]+'<br>'+s[2];
                    for(let i=0;i<=2;i++) if (count[i]>=1) show-=s[i] ;
                    document.getElementById('de').innerHTML=show
};
let res=say('hello');
console.log('res',res);