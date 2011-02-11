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
   $Id: ot_subtotal_no_tax.php 899 2005-04-29 02:40:57Z hhgag $   

   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce
   -----------------------------------------------------------------------------------------
   based on: 
   (c) 2000-2001 The Exchange Project  (earlier name of osCommerce)
   (c) 2002-2003 osCommerce(ot_subtotal.php,v 1.2 2002/04/17); www.oscommerce.com 
   (c) 2003	 nextcommerce (ot_subtotal_no_tax.php,v 1.4 2003/08/13); www.nextcommerce.org

   Released under the GNU General Public License 
   ---------------------------------------------------------------------------------------*/
  //
  // ... E002 - begin
  //
  // ... old
  //
  //define('MODULE_ORDER_TOTAL_SUBTOTAL_NO_TAX_TITLE', '<b>Summe, netto</b>');
  //
  // ... new
  //
  define('MODULE_ORDER_TOTAL_SUBTOTAL_NO_TAX_TITLE', '<strong>Summe, netto</strong>');
  //
  // ... E002 - end
  //
  define('MODULE_ORDER_TOTAL_SUBTOTAL_NO_TAX_DESCRIPTION', 'Nettosumme der Bestellung');
  
  define('MODULE_ORDER_TOTAL_SUBTOTAL_NO_TAX_STATUS_TITLE','Zwischensumme - Netto');
  define('MODULE_ORDER_TOTAL_SUBTOTAL_NO_TAX_STATUS_DESC','Anzeige der Netto-Zwischensumme?');
  
  define('MODULE_ORDER_TOTAL_SUBTOTAL_NO_TAX_SORT_ORDER_TITLE','Sortierreihenfolge');
  define('MODULE_ORDER_TOTAL_SUBTOTAL_NO_TAX_SORT_ORDER_DESC', 'Anzeigereihenfolge.');
?>