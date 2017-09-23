

window.onload=function(){
	/*写说说*/
	$(".headerCont").find("button").click(function(){
		$(".container").css("display","none");
		$("#writeRecord").css("display","block");
	});
	$("#recordResert").click(function(){
		$("#writeRecord").css("display","none");
		$(".container").css("display","block");
	});


	$("#recordSubmit").click(function(){
		var myDate = new Date();
		var year = myDate.getFullYear();
		var month = myDate.getMonth()+1;
		var day = myDate.getDate();
		var hours = myDate.getHours();
		var minter = myDate.getMinutes();
		var second = myDate.getSeconds(); 
		var theTime = year+"/"+month+"/"+day+"/"+hours+":"+minter+":"+second;
		$("#submitTime").val(theTime);
	});

	/*输入标题*/
	$("#recordTitle").focus(function(){
		if($(this).val() == "请在这里输入标题"){
			$(this).val("");
		}
	});
	$("#recordTitle").blur(function(){
		if($(this).val() == ""){
			$(this).val("请在这里输入标题");
		}
	});

	/*如果内容为空，不能提交*/
	$("#recordSubmit").attr({"disabled":"disabled"});
	$("#writeContent").blur(function(){
		/*alert($("#writeContent").val());*/
		if(!$(this).val().trim()){
           $("#recordSubmit").attr({"disabled":"disabled"});
        }
        else{
            $("#recordSubmit").removeAttr("disabled");
        }


	});



/*内容出现*/
	$listDiv = $('.recordContTitle');
    $listLi = $('.list li');
    $listDiv.hover(function() {
    	var listDivH = $(this).height();
    	var recordC = $(this).find(".recordC").height();
        $(this).parent().stop(true).animate({
            height: listDivH+recordC+55
        },
        300).siblings('li').stop(true).animate({
            height: 60
        },
        300);
    });



}