<div id="foot"></div>

</div><!--/container-->

<script type="text/javascript" src="includes/slimstat/_js/jquery-1.3.2.min.js"></script>

<script type="text/javascript" src="includes/javascript/scrollabletable.js"></script>
<script type="text/javascript" src="includes/javascript/jscrollable.js"></script>

<script type="text/javascript">
<!--

// jQuery(document).ready(function() {
//	jQuery('table.scroller').Scrollable(200, 500);
//});


var jDocument;
var jTitle;

function setTitleBackground() {
	if (parseInt(jDocument.scrollTop()) < 20) {
		jTitle.css('background-image', 'none');
	} else {
		jTitle.css('background-image', 'url(\'./_img/title.png\')');
	}
}

$(function() {
	jDocument = $(document);
	jTitle = $('#title');
	
	$('a.toggle').click(function() {
		var toggle = $(this);
		if (toggle.css('background-position').indexOf('-15') > -1) {
			toggle.css('background-position', '0 0');
		} else {
			toggle.css('background-position', '-15px 0');
		}
		var id = toggle.attr('id');
		// alert(id);
		if (id != '') {
			$('ul.detail_'+id).toggle();
		}
		return false;
	});
	
	$(window).scroll(function() {
		setTitleBackground();
	});
	setTitleBackground();
});
//-->
</script>
</body>
</html>