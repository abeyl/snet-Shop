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

E017 - 10.11.2010 - AB - Tabellenprefix
*/

/* --------------------------------------------------------------
   $Id: slimstat.php 2009-12-15 12:49:44Z siekiera $   

   commerce:SEO - ein Projekt von Webdesign-Erfurt.de
   http://www.commerce-seo.de
   http://www.xt-shopservice.de

   Copyright (c) 2009 xt-shopservice.de
   --------------------------------------------------------------
   
   Released under the GNU General Public License 
   --------------------------------------------------------------*/

require('includes/application_top.php');

if(isset($_GET['del']) && $_GET['del']=='1') {
        //
        // ... E017 - begin
        //
        // ... old
        //
	//xtc_db_query("TRUNCATE `slimstat_visits` ");
	//xtc_db_query("TRUNCATE `slimstat_hits` ");
	//xtc_db_query("TRUNCATE `slimstat_cache` ");
        //
        // ... new
        //
	xtc_db_query("TRUNCATE `xtc_slimstat_visits` ");
	xtc_db_query("TRUNCATE `xtc_slimstat_hits` ");
	xtc_db_query("TRUNCATE `xtc_slimstat_cache` ");
        //
        // ... E017 - end
        //
	$messageStack->add('Die Datenbankfelder wurden geleert und zur&uuml;ckgesetzt.', 'success');
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html <?php echo HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo $_SESSION['language_charset']; ?>" />
<title><?php echo TITLE; ?></title>
<link rel="stylesheet" type="text/css" href="includes/stylesheet.css" />
<script type="text/javascript" src="includes/general.js"></script>
<link rel="stylesheet" href="includes/slimstat/_css/screen.css" type="text/css" />
<!--[if lt IE 8]><link rel="stylesheet" href="includes/slimstat/_css/ie.css" type="text/css" /><![endif]-->
</head>
<body>
<?php require(DIR_WS_INCLUDES . 'header.php'); ?>
<div id="wrapper">
<table class="outerTable" cellpadding="0" cellspacing="0">
  <tr>
    <td class="columnLeft2" width="<?php echo BOX_WIDTH; ?>" valign="top">
    	<table border="0" width="<?php echo BOX_WIDTH; ?>" cellspacing="1" cellpadding="1" class="columnLeft">
			<?php require(DIR_WS_INCLUDES . 'column_left.php'); ?>
		</table>
	</td>
    <td class="boxCenter" width="100%" valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="2"><br />
      <tr>
        <td width="99%">
        	<table class="table_pageHeading" border="0" width="100%" cellspacing="0" cellpadding="0">
	          <tr>
	            <td class="pageHeading">Shopstatistik</td>
	          </tr>
	        </table>
        </td>
		<td width="1">
			<a class="button" href="slimstat.php?del=1" nowrap="nowrap"><nobr>Statistik leeren</nobr></a>
		</td>
      </tr>
      <tr>
      	<td colspan="2">
      		<?php include('includes/slimstat/index.php'); ?>
      	</td>
       </tr>
    </table></td>
  </tr>
</table>
</div>
<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
</body>
</html>
<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>