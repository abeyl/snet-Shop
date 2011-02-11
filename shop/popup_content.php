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

B008 - 14.04.2010 - AB - HTML-Validitaet
*/

/* -----------------------------------------------------------------------------------------
   $Id: popup_content.php 1169 2005-08-22 16:07:09Z mz $   

   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce
   -----------------------------------------------------------------------------------------
   based on:
   (c) 2003	 nextcommerce (content_preview.php,v 1.2 2003/08/25); www.nextcommerce.org
   
   Released under the GNU General Public License 
   ---------------------------------------------------------------------------------------*/

require ('includes/application_top.php');

$content_query = xtDBquery("SELECT
 					*
 					FROM ".TABLE_CONTENT_MANAGER."
 					WHERE content_group='".(int) $_GET['coID']."' and languages_id = '".$_SESSION['languages_id']."'");
$content_data = xtc_db_fetch_array($content_query, true);

//
// ... B008 - begin
//
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php
//
// ... B008 - end
//
?>

<html <?php echo HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo $_SESSION['language_charset']; ?>" /> 
<meta http-equiv="Content-Style-Type" content="text/css" />
<title><?php echo $content_data['content_heading']; ?></title>
<base href="<?php echo (getenv('HTTPS') == 'on' ? HTTPS_SERVER : HTTP_SERVER) . DIR_WS_CATALOG; ?>">
<link rel="stylesheet" type="text/css" href="<?php echo 'templates/'.CURRENT_TEMPLATE.'/stylesheet.css'; ?>" />
</head>
<?php
//
// ... B008 - begin
//
?>
<style type="text/css">
<!--
body { margin: 10px; }
//-->
</style>
<body>
<?php
//
// ... B008 - end
//
?>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="contentsTopics"><?php echo $content_data['content_heading']; ?></td>
  </tr>
</table>
<br>
<table border="0" width="100%" cellspacing="0" cellpadding="2">
          <tr>
            <td class="main">
 <?php

if ($content_data['content_file'] != '') {
	if (strpos($content_data['content_file'], '.txt'))
		echo '<pre>';

	include (DIR_FS_CATALOG.'media/content/'.$content_data['content_file']);

	if (strpos($content_data['content_file'], '.txt'))
		echo '</pre>';
} else {
	echo $content_data['content_text'];
}
?>
<br><br>
<p class="smallText" align="right">
<script type="text/javascript">
<!-- 
document.write("<a href='javascript:window.close()'><?php echo TEXT_CLOSE_WINDOW; ?></a>")
// -->
</script>
<noscript><?php echo TEXT_CLOSE_WINDOW_NO_JS; ?></noscript>
</p>
</td>
          </tr>
        </table>
</body>
</html>