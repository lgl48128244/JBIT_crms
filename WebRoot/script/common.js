function reload(){
	window.location.reload();
}
function help(msg){
	alert('欢迎使用'+msg);
}

function to(url){
	window.location.href=url;
}
function back(){
	history.go(-1);
}
function save(url){
	alert('保存成功！');
	to(url);
}
function del(url){
	if (window.confirm("确认删除？")){
		window.location.href = url;
	}
}
function setCurTime(oid){
	var now=new Date();
	var year=now.getYear();
	var month=now.getMonth()+1;
	if(month<10){
		month = "0"+month;
	}
	var day=now.getDate();
	if(day<10){
		day = "0"+day;
	}
	var timeString = year+"年"+month+"月"+day+"日";
	var oCtl = document.getElementById(oid);
	oCtl.value = timeString;
}