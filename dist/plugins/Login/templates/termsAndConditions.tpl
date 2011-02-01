{literal}
<script type="text/javascript" src="libs/jquery/jquery.cookie.js"></script>
<script type="text/javascript">
function submitLoginForm() {
	var checked = $('#form_acceptterms').attr('checked');
	if (checked) {
		$.cookie("termsaccepted", 'true', { expires: 365 });
		return true;
	} else {
		$.cookie("termsaccepted", 'false');
		alert('Please accept the Terms and Conditions.');
		return false;
	}
}

function dontAcceptTerms() {
	$('#terms').hide();
	$('#login').show();
	$('#form_acceptterms').attr('checked', false);
}

function acceptTerms() {
	$('#terms').hide();
	$('#login').show();
	$('#form_acceptterms').attr('checked', true);
}

function showTerms() {
	$('#terms').show();
	$('#login').hide();
	return false;
}

$(document).ready(function() {

	// bind events
	$('#acceptButton').click(acceptTerms);
	$('#dontAcceptButton').click(dontAcceptTerms);	
	$('#termsLink').click(showTerms);		
	$('#loginform').submit(submitLoginForm);
	
	// check cookie and check the terms accepted checkbox
	var accepted =	$.cookie("termsaccepted");
	$('#form_acceptterms').attr('checked', accepted == 'true');	

});

</script>
<style type="text/css">
.termsButton {
    color: #224466;
	background-color: #CEE1EF !important;
	-moz-border-radius: 3px 3px 3px 3px;
    border: 1px solid #80B5D0;
    cursor: default;
    font-size: 13px;
    margin: 0;
    padding: 3px 5px;
    text-decoration: none;
}
.termsBoxOuter {
    background-color: #EAF3FA;
	-moz-border-radius: 5px 5px 5px 5px;
    font-weight: bold;
    padding: 16px 16px 10px;
	width:500px; 
	margin: 20px auto;
	display: none;
}
.termsBoxInner {
	height:320px; 
	overflow:auto; 
	background-color: white; 
	border: 1px solid black; 
	margin-top:15px;
	font-weight: normal;
}
.termsButtonsContainer {
	text-align: right; 
	margin-top: 10px;
}
.acceptTermsCheckbox {
	font-weight:normal;
}
</style>
<div id="terms" class="termsBoxOuter">
<h1>Terms and Conditions</h1>
<h3>Please Read Carefully</h3>
<div class="termsBoxInner">
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sagittis faucibus leo ut sollicitudin. Nam hendrerit tempus lectus, id gravida risus laoreet eu. Suspendisse potenti. Phasellus bibendum libero quis eros dictum vel adipiscing mi rhoncus. Ut vel nulla velit, nec pellentesque massa. In vitae nibh nec mi semper tincidunt quis non lorem. Integer convallis tortor dui, vel pellentesque magna. Donec ut erat urna. Nam condimentum, velit quis congue scelerisque, felis elit euismod odio, ut dapibus libero libero ac enim. Sed gravida mattis metus, et lacinia metus euismod sit amet. Ut gravida, neque quis suscipit laoreet, est mi ultricies odio, vel cursus dolor purus eu tellus. Fusce risus ante, porta quis venenatis sit amet, gravida id leo. </p>
<p>Ut nibh neque, vulputate eget interdum quis, aliquet et nulla. Aenean sed posuere lacus. Pellentesque vel dictum urna. Nullam mollis semper elit, sed posuere enim mattis eget. Nullam neque nisl, gravida at pretium a, hendrerit at massa. Nulla eget massa quam. Suspendisse scelerisque eros id erat porttitor eget vestibulum dui dictum. Nulla mattis lacinia placerat. Donec non ante et est rutrum facilisis. Curabitur mauris dolor, euismod nec placerat fermentum, tincidunt sit amet ligula. Phasellus vitae venenatis sapien. Phasellus at enim dui. Aliquam nunc ligula, dapibus eget sagittis et, feugiat eu ante. Quisque at enim lectus. Ut rhoncus lorem nec lorem sodales viverra. Etiam dignissim consectetur arcu vitae tempus. Vivamus aliquet dapibus ipsum, molestie suscipit odio fermentum et. Pellentesque felis erat, posuere posuere adipiscing eu, faucibus ut odio. Vivamus sollicitudin euismod tortor et sollicitudin. </p>
<p>Sed eu nulla magna. Quisque interdum semper lacus. Praesent eu velit ante, nec congue urna. Nam et quam nec ligula blandit porta. Nulla sed libero est, ut interdum nulla. Morbi dictum nulla sit amet orci accumsan sed volutpat erat aliquam. Curabitur vel nunc lectus, sed fermentum nulla. Sed ornare, risus tempus dictum ultricies, augue est aliquam nisl, eu cursus nisl justo vitae nisl. Vivamus elementum, lorem sit amet accumsan vulputate, metus justo sollicitudin purus, nec vulputate ligula sem eu massa. Nullam aliquam tempus tincidunt. Quisque massa enim, congue quis eleifend in, lobortis ut diam. Morbi tincidunt dolor eros, vitae posuere orci. Donec diam erat, consequat a rutrum vitae, luctus quis arcu. </p>
</div>
<p class="termsButtonsContainer">
<input value="Decline" tabindex="-1" id="dontAcceptButton" type="button" class="termsButton">
<input value="Agree" tabindex="-1" id="acceptButton" type="button" class="termsButton">
</p>
</div>
{/literal}
