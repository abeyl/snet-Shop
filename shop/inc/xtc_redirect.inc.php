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

B001 - 10.03.2010 - AB - Deprecated Functions
*/

/* -----------------------------------------------------------------------------------------
   $Id: xtc_redirect.inc.php 1261 2005-09-29 19:01:49Z hhgag $

   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce
   -----------------------------------------------------------------------------------------
   based on:
   (c) 2000-2001 The Exchange Project  (earlier name of osCommerce)
   (c) 2002-2003 osCommerce(general.php,v 1.225 2003/05/29); www.oscommerce.com 
   (c) 2003	 nextcommerce (xtc_redirect.inc.php,v 1.5 2003/08/13); www.nextcommerce.org
   
   Released under the GNU General Public License 
   ---------------------------------------------------------------------------------------*/

  // include needed functions
  
  require_once(DIR_FS_INC . 'xtc_exit.inc.php');
  
  function xtc_redirect($url) {
    if ( (ENABLE_SSL == true) && (getenv('HTTPS') == 'on' || getenv('HTTPS') == '1') ) { // We are loading an SSL page
	if (substr($url, 0, strlen(HTTP_SERVER)) == HTTP_SERVER) { // NONSSL url
	    $url = HTTPS_SERVER . substr($url, strlen(HTTP_SERVER)); // Change it to SSL
	}
    }
    
    //
    // ... B001 - begin
    //
    // ... old
    //
    //header('Location: ' . eregi_replace("[\r\n]+(.*)$", "", $url));
    //
    // ... new
    //
    header('Location: ' . preg_replace("/[\r\n]+(.*)$/i", "", $url));
    //
    // ... B001 - end
    //

    xtc_exit();
    
  }
?>