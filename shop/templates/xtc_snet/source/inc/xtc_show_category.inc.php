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

E002 - 11.11.2010 - AB - Defaultwerte
E018 - 11.11.2010 - AB - Weiterleitung
*/

/* -----------------------------------------------------------------------------------------
   $Id: xtc_show_category.inc.php 1262 2005-09-30 10:00:32Z mz $

   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce
   -----------------------------------------------------------------------------------------
   based on: 
   (c) 2000-2001 The Exchange Project  (earlier name of osCommerce)
   (c) 2002-2003 osCommerce(categories.php,v 1.23 2002/11/12); www.oscommerce.com
   (c) 2003	 nextcommerce (xtc_show_category.inc.php,v 1.4 2003/08/13); www.nextcommerce.org 

   Released under the GNU General Public License 
   ---------------------------------------------------------------------------------------*/

     function xtc_show_category($counter) {
    global $foo, $categories_string, $id;


    // image for first level
    $img_1='<img src="templates/'.CURRENT_TEMPLATE.'/img/icon_arrow.jpg" alt="" />&nbsp;';

    for ($a=0; $a<$foo[$counter]['level']; $a++) {

      if ($foo[$counter]['level']=='1') {
      $categories_string .= "&nbsp;-&nbsp;";
      }

      $categories_string .= "&nbsp;&nbsp;";

    }
    if ($foo[$counter]['level']=='') {
    if (strlen($categories_string)=='0') {
    $categories_string .='<table width="100%"><tr><td class="moduleRow" onmouseover="rowOverEffect(this)" onmouseout="rowOutEffect(this)">';
    } else {
    $categories_string .='</td></tr></table><table width="100%"><tr><td class="moduleRow" onmouseover="rowOverEffect(this)" onmouseout="rowOutEffect(this)">';
    }

    $categories_string .= $img_1;
    $categories_string .= '<b><a href="';
    } else {
    $categories_string .= '<a href="';
    }

    //
    // ... E018 - begin
    //
    // ... old
    //
    //$cPath_new=xtc_category_link($counter,$foo[$counter]['name']);
    //$categories_string .= xtc_href_link(FILENAME_DEFAULT, $cPath_new);
    //
    // ... new
    //
    if($foo[$counter]['target_url']) {
        if(!preg_match("/^http:\/\//",$foo[$counter]['target_url'])) {
            $foo[$counter]['target_url'] = "http://".$foo[$counter]['target_url'];
        }
        $categories_string .= $foo[$counter]['target_url'];
        $categories_string .= '" target="_blank';
    } else {
        $cPath_new=xtc_category_link($counter,$foo[$counter]['name']);
        $categories_string .= xtc_href_link(FILENAME_DEFAULT, $cPath_new);
    }
    //
    // ... E018 - end
    //
    $categories_string .= '">';

    if ( ($id) && (in_array($counter, $id)) ) {
      $categories_string .= '<b>';
    }

    // display category name
    $categories_string .= $foo[$counter]['name'];

    if ( ($id) && (in_array($counter, $id)) ) {
      $categories_string .= '</b>';
    }

    if ($foo[$counter]['level']=='') {
    $categories_string .= '</a></b>';
    } else {
    $categories_string .= '</a>';
    }

    if (SHOW_COUNTS == 'true') {
      $products_in_category = xtc_count_products_in_category($counter);
      if ($products_in_category > 0) {
        $categories_string .= '&nbsp;(' . $products_in_category . ')';
      }
    }

    $categories_string .= '<br />';

    if ($foo[$counter]['next_id']) {
        xtc_show_category($foo[$counter]['next_id']);
    } else {
        $categories_string .= '</td></tr></table>';
    }
  }

?>