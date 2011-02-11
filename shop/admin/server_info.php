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

B001 - 30.06.2010 - AB - Deprecated Functions
*/

/* --------------------------------------------------------------
   $Id: server_info.php 899 2005-04-29 02:40:57Z hhgag $   

   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce
   --------------------------------------------------------------
   based on: 
   (c) 2000-2001 The Exchange Project  (earlier name of osCommerce)
   (c) 2002-2003 osCommerce(server_info.php,v 1.4 2003/03/17); www.oscommerce.com 
   (c) 2003	 nextcommerce (server_info.php,v 1.7 2003/08/18); www.nextcommerce.org

   Released under the GNU General Public License 
   --------------------------------------------------------------*/

  require('includes/application_top.php');

  $system = xtc_get_system_information();
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo $_SESSION['language_charset']; ?>"> 
<title><?php echo TITLE; ?></title>
<link rel="stylesheet" type="text/css" href="includes/stylesheet.css">
</head>
<body marginwidth="0" marginheight="0" topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" bgcolor="#FFFFFF">
<!-- header //-->
<?php require(DIR_WS_INCLUDES . 'header.php'); ?>
<!-- header_eof //-->

<!-- body //-->
<table border="0" width="100%" cellspacing="2" cellpadding="2">
  <tr>
    <td class="columnLeft2" width="<?php echo BOX_WIDTH; ?>" valign="top"><table border="0" width="<?php echo BOX_WIDTH; ?>" cellspacing="1" cellpadding="1" class="columnLeft">
<!-- left_navigation //-->
<?php require(DIR_WS_INCLUDES . 'column_left.php'); ?>
<!-- left_navigation_eof //-->
    </table></td>
<!-- body_text //-->
    <td class="boxCenter" width="100%" valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="2">
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td class="pageHeading"><?php echo HEADING_TITLE; ?></td>
            <td class="pageHeading" align="right"><?php echo xtc_draw_separator('pixel_trans.gif', HEADING_IMAGE_WIDTH, HEADING_IMAGE_HEIGHT); ?></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="2">
          <tr>
            <td align="center"><table border="0" cellspacing="0" cellpadding="3">
              <tr>
                <td class="smallText"><b><?php echo TITLE_SERVER_HOST; ?></b></td>
                <td class="smallText"><?php echo $system['host'] . ' (' . $system['ip'] . ')'; ?></td>
                <td class="smallText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><?php echo TITLE_DATABASE_HOST; ?></b></td>
                <td class="smallText"><?php echo $system['db_server'] . ' (' . $system['db_ip'] . ')'; ?></td>
              </tr>
              <tr>
                <td class="smallText"><b><?php echo TITLE_SERVER_OS; ?></b></td>
                <td class="smallText"><?php echo $system['system'] . ' ' . $system['kernel']; ?></td>
                <td class="smallText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><?php echo TITLE_DATABASE; ?></b></td>
                <td class="smallText"><?php echo $system['db_version']; ?></td>
              </tr>
              <tr>
                <td class="smallText"><b><?php echo TITLE_SERVER_DATE; ?></b></td>
                <td class="smallText"><?php echo $system['date']; ?></td>
                <td class="smallText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><?php echo TITLE_DATABASE_DATE; ?></b></td>
                <td class="smallText"><?php echo $system['db_date']; ?></td>
              </tr>
              <tr>
                <td class="smallText"><b><?php echo TITLE_SERVER_UP_TIME; ?></b></td>
                <td colspan="3" class="smallText"><?php echo $system['uptime']; ?></td>
              </tr>
              <tr>
                <td colspan="4"><?php echo xtc_draw_separator('pixel_trans.gif', '1', '5'); ?></td>
              </tr>
              <tr>
                <td class="smallText"><b><?php echo TITLE_HTTP_SERVER; ?></b></td>
                <td colspan="3" class="smallText"><?php echo $system['http_server']; ?></td>
              </tr>
              <tr>
                <td class="smallText"><b><?php echo TITLE_PHP_VERSION; ?></b></td>
                <td colspan="3" class="smallText"><?php echo $system['php'] . ' (' . TITLE_ZEND_VERSION . ' ' . $system['zend'] . ')'; ?></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><?php echo xtc_draw_separator('pixel_trans.gif', '1', '10'); ?></td>
      </tr>
      <tr>
        <td>
<?php
  if (function_exists('ob_start')) {
    ob_start();
    phpinfo();
    $phpinfo = ob_get_contents();
    ob_end_clean();

    $phpinfo = str_replace('border: 1px', '', $phpinfo);
    //
    // ... B001 - begin
    //
    // ... old
    //
    //ereg("(<style type=\"text/css\">{1})(.*)(</style>{1})", $phpinfo, $regs);
    //echo '<style type="text/css">' . $regs[2] . '</style>';
    //ereg("(<body>{1})(.*)(</body>{1})", $phpinfo, $regs);
    //echo $regs[2];
    //
    // ... new
    //
    $pos1 = strpos($phpinfo,"<body>");
    $pos2 = strpos($phpinfo,"</body>");
    echo "<style type=\"text/css\">
    		.phpinfo td, .phpinfo th, .phpinfo h1, .phpinfo h2 {font-family: sans-serif;}
			.phpinfo pre {margin: 0px; font-family: monospace;}
			.phpinfo a:link {color: #000099; text-decoration: none; background-color: #ffffff;}
			.phpinfo a:hover {text-decoration: underline;}
			.phpinfo table {border-collapse: collapse;}
			.phpinfo .center {text-align: center;}
			.phpinfo .center table { margin-left: auto; margin-right: auto; text-align: left;}
			.phpinfo .center th { text-align: center !important; }
			.phpinfo td, .phpinfo th { font-size: 75%; vertical-align: baseline;}
			.phpinfo h1 {font-size: 150%;}
			.phpinfo h2 {font-size: 125%;}
			.phpinfo .p {text-align: left;}
			.phpinfo .e {background-color: #ccccff; font-weight: bold; color: #000000;}
			.phpinfo .h {background-color: #9999cc; font-weight: bold; color: #000000;}
			.phpinfo .v {background-color: #cccccc; color: #000000;}
			.phpinfo .vr {background-color: #cccccc; text-align: right; color: #000000;}
			.phpinfo img {float: right; border: 0px;}
			.phpinfo hr {width: 600px; background-color: #cccccc; border: 0px; height: 1px; color: #000000;} 
	</style>";
    echo "<div class=\"phpinfo\">";
    echo substr($phpinfo,$pos1);
    echo "</div>";
    //
    // ... B001 - end
    //
  } else {
    phpinfo();
  }
?>
        </td>
      </tr>
    </table></td>
<!-- body_text_eof //-->
  </tr>
</table>
<!-- body_eof //-->

<!-- footer //-->
<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
<!-- footer_eof //-->
<br>
</body>
</html>
<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>