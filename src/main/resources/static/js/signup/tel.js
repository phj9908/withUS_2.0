//이메일주소 가져오기
$("#fir_number").blur(function(){
    number();
});

$("#sec_number").change(function(){
    number();
});

function number() {
    const zero = $("#zero").text();
    const middle1 = $("#middle1").text();
    const first = $("#fir_number").val();
    const middle2 = $("#middle2").text();
    const second = $("#sec_number").val();
    if(first != "" && second != "") {
        $("#mbr_tel").val(zero+middle1+first+middle2+second);
    }
};