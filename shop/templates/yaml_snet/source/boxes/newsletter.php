<?php
/* -----------------------------------------------------------------------------------------
   $Id: newsletter.php,v 1.0

   XTC-NEWSLETTER_RECIPIENTS RC1 - Contribution for XT-Commerce http://www.xt-commerce.com
   by Matthias Hinsche http://www.gamesempire.de

   Copyright (c) 2003 XT-Commerce
   -----------------------------------------------------------------------------------------
   based on:
   (c) 2000-2001 The Exchange Project  (earlier name of osCommerce)
   (c) 2002-2003 osCommerce www.oscommerce.com
   (c) 2003	 nextcommerce www.nextcommerce.org

   Released under the GNU General Public License
   ---------------------------------------------------------------------------------------*/

$box_smarty = new smarty;
$box_smarty->assign('tpl_path','templates/'.CURRENT_TEMPLATE.'/');
$box_content='';


$box_smarty->assign('FORM_ACTION', xtc_draw_form('sign_in', xtc_href_link(FILENAME_NEWSLETTER, '', 'NONSSL')));
$box_smarty->assign('FIELD_EMAIL',xtc_draw_input_field('email', '', 'size="20" maxlength="50"'));
$box_smarty->assign('BUTTON',xtc_image_submit('button_login_small.gif', IMAGE_BUTTON_LOGIN));
$box_smarty->assign('FORM_END','</form>');
	$box_smarty->assign('language', $_SESSION['language']);
       	  // set cache ID
   if (!CacheCheck()) {
  $box_smarty->caching = 0;
  $box_newsletter= $box_smarty->fetch(CURRENT_TEMPLATE.'/boxes/box_newsletter.html');
  } else {
  $box_smarty->caching = 1;
  $box_smarty->cache_lifetime=CACHE_LIFETIME;
  $box_smarty->cache_modified_check=CACHE_CHECK;
  $cache_id = $_SESSION['language'];
  $box_newsletter= $box_smarty->fetch(CURRENT_TEMPLATE.'/boxes/box_newsletter.html',$cache_id);
  }

    $smarty->assign('box_NEWSLETTER',$box_newsletter);
?>