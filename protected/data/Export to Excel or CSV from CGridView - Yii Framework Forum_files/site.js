/**
// This file contains an implementation of JavaScript module mechanism.
// This file must be included before any other module file.
//
// A new module can be declared using the following template:
// -------------------------------------------------------------------

// module is named in namespace format. The root must be yiisite.
// Within the module, you can access method/property of other modules
// via syntax "site.x.y.z", assuming there is a module named "site.x.y".
site.sample = (function($) {
	var pub = {
		// public functions and properties should be declared in this block

		// an optional jquery selector. module.init() will be called only
		// when $(trigger).length>0 or trigger is not declared.
		trigger: 'jquery-selector',
		init : function() {
			// code that needs to run in document ready function go below
			// use trigger described above to do selective init
		}
	};

	// private functions and properties should be declared below
	// You may use "pub.xyz" to access any public method/property declared in "pub"

	return pub;
})(jQuery);

// -------------------------------------------------------------------
*/

jQuery(document).ready(function($) {
	// call the init() method of every module
	var init = function(module) {
		if($.isFunction(module.init) && (module.trigger==undefined || $(module.trigger).length)) {
			module.init();
		}
		$.each(module, function() {
			if($.isPlainObject(this)) {
				init(this);
			}
		});
	};
	init(site);
});

// the root module
var site = (function($) {
	var pub = {
		baseUrl : '',	// application base URL. set in main layout
		loginUrl : '/login/',  // application login URL. set in main layout

		previewMarkdown : function(container, url, content) {
			var $content=$(container+' .jqmContent');
			$content.addClass('g-loading').html('Please wait...');
			$(container).jqmShow();
			$.post(url,{'content':content},function(data){
				$content.removeClass('g-loading').html(data);
			});
		},

		init : function() {
			$('a.global-search').click(function(){
				$(this).parents('form')[0].submit();
				return false;
			});

			$('.g-login').click(function(){
				var currentUrl=$(this).attr('rel') ? $(this).attr('rel') : window.location.href;
				$.post(site.baseUrl+'/site/returnUrl', {
						url: currentUrl
					}, function() {
						window.location=site.loginUrl;
					});
				return false;
			});

			$('.g-markdown-preview').click(function(){
				var target=$(this).attr('rel');
				if(target!='' && $(target).length) {
					$('.markItUpButton.preview a',$(target).parent()).click();
				}
				else {
					$('.markItUpButton.preview a').click();
				}
				return false;
			});

			$('.widget-voter .vote a').click(function(){
				var $a=$(this);
				if($a.hasClass('voted'))
					return false;
				$a.addClass('voting');
				$.post($a.attr('href'),function(data){
					$a.removeClass('voting');
					if(data!=false) {  // vote succeeded
						var $ul=$a.parent().parent();
						$('li.up a span',$ul).text(data[1]);
						$('li.down a span',$ul).text(data[0]-data[1]);
						$('a',$ul).removeClass('voted');
						$a.addClass('voted');
					}
				},'json');
				return false;
			});

			$('.widget-follower a').live('click',function(){
				var $a=$(this);
				if($a.hasClass('g-login'))
					return;
				$.post($a.attr('href'),function(data){
					$a.parent().replaceWith(data);
				});
				return false;
			});

			$('.commentdelete').live('click', function(){
				var $container=$(this).parent().parent();
				var commentid=$('.cid',$container).attr('id').substring(1);
				$.post($(this).attr('href'),{id:commentid}, function(data){
					$container
						.css('background','#febfbf')
						.animate({height:20}, 'slow',function(){$container.html('<p>'+data+'</p>');});
					setTimeout(function(){
						$container.slideUp('slow');
					},2000);
				});
				return false;
			});

			$('.commentedit').live('click', function(){
				var $form=$('#comment-form');
				var $container=$(this).parent().parent();
				var commentid=$('.cid',$container).attr('id').substring(1);

				$.post($(this).attr('href'),{id:commentid}, function(data){
					$('#comment_id',$form).val(data.id);
					$('#comment_title',$form).val(data.title).focus();
					$('#comment_content',$form).val(data.content);
				},'json');

				$('input[type="submit"]',$form).val('Update');
				$container.html($form.parent());
				$('#add-comment, .prompt').toggle();

				return false;
			});
		},

		keepAlive : function()
		{
			window.setInterval(function()
			{
				$.get(site.baseUrl + '/site/keepAlive/');
			}, 300000);
		}

	};

	return pub;
})(jQuery);
