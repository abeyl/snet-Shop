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

/* -----------------------------------------------------------------------------------------
   $Id: ot_total.php 899 2005-04-29 02:40:57Z hhgag $   

   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce
   -----------------------------------------------------------------------------------------
   based on: 
   (c) 2000-2001 The Exchange Project  (earlier name of osCommerce)
   (c) 2002-2003 osCommerce(ot_total.php,v 1.2 2002/04/17); www.oscommerce.com 
   (c) 2003	 nextcommerce (ot_total.php,v 1.5 2003/08/13); www.nextcommerce.org

   Released under the GNU General Public License 
   ---------------------------------------------------------------------------------------*/

  //
  // ... E002 - begin
  //
  // ... old
  //
  //define('MODULE_ORDER_TOTAL_TOTAL_TITLE', '<b>Summe</b>');
  //define('MODULE_ORDER_TOTAL_TOTAL_TITLE_NO_TAX', '<b>Summe, netto</b>');
  //define('MODULE_ORDER_TOTAL_TOTAL_TITLE_NO_TAX_BRUTTO','<b>Summe, brutto</b>');
  //
  // ... new
  //
  define('MODULE_ORDER_TOTAL_TOTAL_TITLE', '<strong>Summe</strong>');
  define('MODULE_ORDER_TOTAL_TOTAL_TITLE_NO_TAX', '<strong>Summe, netto</strong>');
  define('MODULE_ORDER_TOTAL_TOTAL_TITLE_NO_TAX_BRUTTO','<strong>Summe, brutto</strong>');
  //
  // ... E002 - end
  //
  define('MODULE_ORDER_TOTAL_TOTAL_DESCRIPTION', 'Summe der Bestellung');
  
  define('MODULE_ORDER_TOTAL_TOTAL_STATUS_TITLE','Summe anzeigen');
  define('MODULE_ORDER_TOTAL_TOTAL_STATUS_DESC','M&ouml;chten Sie die Gesamtbestellsumme anzeigen?');
  
  define('MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER_TITLE','Sortierreihenfolge');
  define('MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER_DESC','Anzeigereihenfolge.');
?>