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

E002 - 30.06.2010 - AB - Defaultwerte
*/

/* --------------------------------------------------------------
   $Id: modules.php 899 2005-04-29 02:40:57Z hhgag $   

   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce
   --------------------------------------------------------------
   based on: 
   (c) 2000-2001 The Exchange Project  (earlier name of osCommerce)
   (c) 2002-2003 osCommerce(modules.php,v 1.8 2002/04/09); www.oscommerce.com 
   (c) 2003	 nextcommerce (modules.php,v 1.5 2003/08/14); www.nextcommerce.org

   Released under the GNU General Public License 
   --------------------------------------------------------------*/

//
// ... E002 - begin
//
// ... old
//
//define('HEADING_TITLE_MODULES_PAYMENT', 'Zahlungsweisen');
//define('HEADING_TITLE_MODULES_SHIPPING', 'Versandarten');
//define('HEADING_TITLE_MODULES_ORDER_TOTAL', 'Order Total Modul');
//
// ... new
//
define('HEADING_TITLE_MODULES_PAYMENT', 'Zahlungsoptionen');
define('HEADING_TITLE_MODULES_SHIPPING', 'Versandart');
define('HEADING_TITLE_MODULES_ORDER_TOTAL', 'Zusammenfassung');
//
// ... E002 - end
//

define('TABLE_HEADING_MODULES', 'Module');
define('TABLE_HEADING_SORT_ORDER', 'Sortierreihenfolge');
define('TABLE_HEADING_STATUS', 'Status');
define('TABLE_HEADING_ACTION', 'Aktion');

define('TEXT_MODULE_DIRECTORY', 'Modul Verzeichnis:');

//
// ... E002 - begin
//
// ... old
//
//define('TABLE_HEADING_FILENAME','Modulname (für internen Gebrauch)');
//
// ... new
//
define('TABLE_HEADING_FILENAME','Modulname (f&uuml;r internen Gebrauch)');
//
// ... E002 - end
//
?>