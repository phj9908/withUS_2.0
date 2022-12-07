$("#yy").blur(function(){
    number();
});

$("#mm").change(function(){
    number();
});

$("#dd").change(function(){
    number();
});

function number() {
    const yy = $("#yy").val();
    const mm = $("#mm").val();
    const dd = $("#dd").val();
    if(yy != "" && mm != "" && dd != "") {
        $("#mbr_date").val(yy+"-"+mm+"-"+dd);
    }
};