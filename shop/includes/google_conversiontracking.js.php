<?php
/*
******************************************
** snet-shop - (c) by stimme.net        **
** ------------------------------------ **
** modified xtCommerce                  **
** leading developer: Andreas Beyl      **
** contact: info@stimme.net             **
** web: http://www.stimme.net/snet-shop **
** copyright (c) 2010 by stimme.net     **
******************************************

B007 - 31.03.2010 - AB - Bugfixes 2.12
*/

/* -----------------------------------------------------------------------------------------
   $Id: google_conversiontracking.js.php 1116 2005-07-25 19:31:14Z mz $

   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce

   Released under the GNU General Public License
   ---------------------------------------------------------------------------------------*/
?>

<!-- Google Code for Purchase Conversion Page -->
<script language="JavaScript" type="text/javascript">
<!--
var google_conversion_id = <?php echo GOOGLE_CONVERSION_ID; ?>;
var google_conversion_language = "<?php echo GOOGLE_LANG; ?>";
var google_conversion_format = "1";
var google_conversion_color = "666666";
if (1) {
  var google_conversion_value = 1;
}
var google_conversion_label = "Purchase";
//-->
</script>
<?php
//
// ... B007 - begin
//
// ... old
//
//<script language="JavaScript" src="http://www.googleadservices.com/pagead/conversion.js">
//</script>
//<noscript>
//<img height=1 width=1 border=0 src="http://www.googleadservices.com/pagead/conversion/{php_open} echo GOOGLE_CONVERSION_ID; {php_close}/?value=1&label=Purchase&script=0">
//</noscript>
//
// ... new
//
if ($request_type=='NONSSL') { ?>
    <script language="JavaScript" src="http://www.googleadservices.com/pagead/conversion.js"></script>
    <noscript><img height=1 width=1 border=0 src="http://www.googleadservices.com/pagead/conversion/<?php echo GOOGLE_CONVERSION_ID; ?>/?value=1&label=Purchase&script=0" /></noscript>
    <?php
}else{
    ?>
    <script language="JavaScript" src="https://www.googleadservices.com/pagead/conversion.js"></script>
    <noscript><img height=1 width=1 border=0 src="https://www.googleadservices.com/pagead/conversion/<?php echo GOOGLE_CONVERSION_ID; ?>/?value=1.0&label=PURCHASE&script=0" /></noscript>
    <?php
}
//
// ... B007 - end
//
?>