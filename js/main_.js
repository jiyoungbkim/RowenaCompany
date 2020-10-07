
/*주메뉴*/
var $devWith;
$(document).ready(function() {

/* 디바이스 사이즈 체크 */
$devWith=$("body").width();
$(window).resize(function(){
	$devWith=$("body").width();
	if($devWith<=768){
		$(".gnblist ul").stop().slideUp('fast');
		$(".item1, .item2").show();
		$("#newbooks-news h2 img").each(function(){
			if($(this).attr("src").indexOf("_over.gif")<0) $(this).attr("src",$(this).attr("src").replace(".gif","_over.gif"));
		});
	}else{
		$("#newbooks-news h2 a:eq(0)").parent().next().show();
		$("#newbooks-news h2 a:eq(1)").parent().next().hide();
		
		$("#newbooks-news h2 a").eq(0).html('<img src="images/tit_newbook_over.gif" alt="새로나온 책" />');
		$("#newbooks-news h2 a").eq(1).html('<img src="images/tit_news.gif" alt="새로나온 소식" />');
	}
})

	if($devWith<=768){
		$("#newbooks-news h2 img").each(function(){
			if($(this).attr("src").indexOf("_over.gif")<0) $(this).attr("src",$(this).attr("src").replace(".gif","_over.gif"));
		});
	}

	$(".gnblist > li > a").bind("mouseover focus",function() {
		  if($devWith <=768) return false;
			$(".gnblist ul").hide();
			$(this).next().show();

			$(".gnblist > li > a").each(function() {
				$(this).css('height','29px');
				$(this).css('background','none');
			})
			$(this).css('height','32px');
			$(this).css('background','url("images/over_icon.gif") no-repeat center bottom');

			$(".gnblist").height("60px");
	});

	$(".gnblist").mouseleave(function(){
			$(".gnblist").height("32px");
			$(".gnblist ul").stop().slideUp(50);
			$(".gnblist > li > a").each(function() {
				$(this).css('height','29px');
				$(this).css('background','none');
			})
	})

	/*전체메뉴*/
	$(".allmenu_view a").click(function(e){
		e.preventDefault();
		$(".allmenu_view").slideUp(10,function(){
			$("#allMenu_box").slideDown("slow");
		})
	});

	$(".all_close").click(function(e){
		e.preventDefault();
		$("#allMenu_box").slideUp("slow",function(){
			$(".allmenu_view").slideDown(50);
		})
	});

	/*roll_book*/
	/*var book_loc = 0 ;
	var book_w;
	$(".next").click(function(){
		book_w = parseInt($("#recomm_book").css('width'));
		$("#book_frame").stop().animate({ left :-book_w} , 'slow');

		$(".secondactive").attr('src',$(".secondactive").attr('src').replace('_out.png','_over.png'));
		$(".firstactive").attr('src',$(".firstactive").attr('src').replace('_over.png','_out.png'));
	});
	
	//$("#recomm_book").bind("click",function(){$(".next").click()});	
	$("#recomm_book").bind("swipeleft",function(){$(".next").trigger("click");});
	$("#recomm_book").bind("swiperight",function(){$(".prev").trigger("click");});


	$(".prev").click(function(){
			$("#book_frame").stop().animate({ left : 0} , 'slow');
			$(".secondactive").attr('src',$(".secondactive").attr('src').replace('_over.png','_out.png'));
			$(".firstactive").attr('src',$(".firstactive").attr('src').replace('_out.png','_over.png'));
	});*/


	/*탭메뉴*/
	$(".t1 a").bind("focus click",function() {
		if($devWith <=768) return false;
		$(".item1, .item2").hide();
		$(this).parent().next().show();

		$("#newbooks-news h2 img").each(function(){
			$(this).attr("src",$(this).attr("src").replace("_over.gif",".gif"));
		});
		$btnImg=$(this).children("img");
		$btnImg.attr("src",$btnImg.attr("src").replace(".gif","_over.gif"));
	})

	$(".t2 a").bind("focus click",function() {
		if($devWith <=768) return false;
		$(".item1, .item2").hide();
		$(this).parent().next().show();

		$("#newbooks-news h2 img").each(function(){
		$(this).attr("src",$(this).attr("src").replace("_over.gif",".gif"));
		});
		$btnImg=$(this).children("img");
		$btnImg.attr("src",$btnImg.attr("src").replace(".gif","_over.gif"));
	})
	/*$video=$("#videoWrap video").clone(true)
	$("#videoWrap").empty();
	$("#videoWrap").html($video);*/
});

/*idpw*/
function formGuide(idName,fileName){
		$myElement=$(idName);
		$imgSrc="images/"+fileName;

		$myElement.css("background","url("+$imgSrc+") no-repeat left top");
		
		$myElement.focus(function(){
				$(this).css({
					"background":"none",
					"borderColor":"#c00"
				});
		});

		$myElement.blur(function(){
			switch($(this).attr("id")){
				case "id": $imgSrc="id_bg.jpg";
				break;
				case "pw": $imgSrc="pw_bg.jpg";
				break;
				case "sbox": $imgSrc="tbox_bg.gif";
				break;
			}
			if($(this).val()==""){
					$(this).css({
						"background":"url(images/"+$imgSrc+") no-repeat left top",
						"borderColor":"#ccc"
					});
			}
		});
}

$(document).ready(function() {
		 formGuide("#id","id_bg.jpg");
		 formGuide("#pw","pw_bg.jpg");
		 formGuide("#sbox","tbox_bg.gif");

	//	new Swipe($("#book_frame"));
})