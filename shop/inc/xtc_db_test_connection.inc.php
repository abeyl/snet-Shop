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

E017 - 05.11.2010 - AB - Tabellenprefix
*/

/* -----------------------------------------------------------------------------------------
   $Id: xtc_db_test_connection.inc.php 899 2005-04-29 02:40:57Z hhgag $   

   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce
   -----------------------------------------------------------------------------------------
   based on: 
   (c) 2000-2001 The Exchange Project  (earlier name of osCommerce)
   (c) 2002-2003 osCommerce(database.php,v 1.2 2002/03/02); www.oscommerce.com 
   (c) 2003	 nextcommerce (xtc_db_test_connection.inc.php,v 1.3 2003/08/13); www.nextcommerce.org

   Released under the GNU General Public License 
   ---------------------------------------------------------------------------------------*/
   
function xtc_db_test_connection($database) {
    global $db_error;

    $db_error = false;

    if (!$db_error) {
      if (!@xtc_db_select_db($database)) {
        $db_error = mysql_error();
      } else {
        //
        // ... E017 - begin
        //
        // ... old
        //
        //if (!@xtc_db_query_installer('select count(*) from configuration')) {
        //
        // ... new
        //
        if (!@xtc_db_query_installer('select count(*) from xtc_configuration')) {
        //
        // ... E017 - end
        //
          $db_error = mysql_error();
        }
      }
    }

    if ($db_error) {
      return false;
    } else {
      return true;
    }
  }
 ?>