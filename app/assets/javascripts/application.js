// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require activestorage
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .



// bookmarkアクション
$(function(){

	// タブ切り替え
	$('#tab-contents .tab[id != "tab-all"]').hide();
	$('#tab-menu a').on('click', function() {
		$("#tab-contents .tab").hide();
		$("#tab-menu .active").removeClass("active");
		$(this).addClass("active");
		$($(this).attr("href")).show();
		return false;
	});

	// top戻るボタン
	$('#back a').on('click',function(){
		$('body, html').animate({
			scrollTop:0
		}, 300);
		return false;
	});

	// bookmarkアクション
	$(document).on("ajax:success", ".bm", function(e) {console.log(e)
		if ($('.' + e.detail[0]).hasClass('bookmark-1')) {
			$('.' + e.detail[0]).removeClass('bookmark-1').addClass('bookmark-0')
			$('.' + e.detail[0]).parent().attr('data-method','post');
		} else {
			$('.' + e.detail[0]).removeClass('bookmark-0').addClass('bookmark-1')
			$('.' + e.detail[0]).parent().attr('data-method','delete');
		}
	});

	// DM非同期送信
	$(document).on("ajax:success", "#posts", function(e) {console.log(e)
		$('#messages-area').html(e.detail[2]["response"]);
		$('textarea').val('');

		// メッセ時送信後、最下部までスクロールさせる
		var element = document.getElementById("last");
		var positionY = element.offsetTop;
		console.log(positionY);
		// 　element.scrollTo(0, positionY);
		$('#messages-area').animate({scrollTop: positionY});
		// $('#messages-area').scrollTop(positionY);
		// var positionY = $('#last').offset().top;
		// $('#messages-area').scrollTop(positionY);

		// var targetOffset = $('#last').offset().top;
		// $('#messages-area').animate({scrollTop: targetOffset});
	})
	


	// DM非同期送信　　部分テンプレートで上手くいかなかったやつ。
	// $("#messages-area").html("<%= j(render 'messages/messages',messages:@messages) %>")
	// $("textarea").val('')
});

