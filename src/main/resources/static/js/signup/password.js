function checkPassword() {
    var password=document.getElementById('password').value;

    if(document.getElementById('password').value !='' && document.getElementById('password2').value!='') {
        if(document.getElementById('password').value == document.getElementById('password2').value) {
            document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('check').style.color='#57a9ef';
        }
    } else{
        document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
        document.getElementById('check').style.color='#fb6ad2';
    }

}