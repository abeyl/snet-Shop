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

B001 - 14.04.2010 - AB - Deprecated Functions
*/

/* -----------------------------------------------------------------------------------------
   $Id: xtc_create_random_value.inc.php 899 2005-04-29 02:40:57Z hhgag $   

   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce
   -----------------------------------------------------------------------------------------
   based on: 
   (c) 2000-2001 The Exchange Project  (earlier name of osCommerce)
   (c) 2002-2003 osCommerce(general.php,v 1.225 2003/05/29); www.oscommerce.com 
   (c) 2003	 nextcommerce (xtc_create_random_value.inc.php,v 1.5 2003/08/13); www.nextcommerce.org

   Released under the GNU General Public License 
   ---------------------------------------------------------------------------------------*/
// include needed functions
require_once(DIR_FS_INC . 'xtc_rand.inc.php');
function xtc_create_random_value($length, $type = 'mixed') {
    if ( ($type != 'mixed') && ($type != 'chars') && ($type != 'digits')) return false;

    $rand_value = '';
    while (strlen($rand_value) < $length) {
      if ($type == 'digits') {
        $char = xtc_rand(0,9);
      } else {
        $char = chr(xtc_rand(0,255));
      }
      if ($type == 'mixed') {
        //
        // ... B001 - begin
        //
        // ... old
        //
        //if (eregi('^[a-z0-9]$', $char)) $rand_value .= $char;
        //
        // ... new
        //
        if (preg_match('/^[a-z0-9]$/i', $char)) $rand_value .= $char;
        //
        // ... B001 - end
        //
      } elseif ($type == 'chars') {
        //
        // ... B001 - begin
        //
        // ... old
        //
        //if (eregi('^[a-z]$', $char)) $rand_value .= $char;
        //
        // ... new
        //
        if (preg_match('/^[a-z]$/i', $char)) $rand_value .= $char;
        //
        // ... B001 - end
        //
      } elseif ($type == 'digits') {
        //
        // ... B001 - begin
        //
        // ... old
        //
        //if (ereg('^[0-9]$', $char)) $rand_value .= $char;
        //
        // ... new
        //
        if (preg_match('/^[0-9]$/', $char)) $rand_value .= $char;
        //
        // ... B001 - end
        //
      }
    }

    return $rand_value;
  }
 ?>
