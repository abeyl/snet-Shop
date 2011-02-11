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
   $Id: ot_shipping.php 899 2005-04-29 02:40:57Z hhgag $   

   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce
   -----------------------------------------------------------------------------------------
   based on: 
   (c) 2000-2001 The Exchange Project  (earlier name of osCommerce)
   (c) 2002-2003 osCommerce(ot_shipping.php,v 1.4 2003/02/16); www.oscommerce.com 
   (c) 2003	 nextcommerce (ot_shipping.php,v 1.4 2003/08/13); www.nextcommerce.org

   Released under the GNU General Public License 
   ---------------------------------------------------------------------------------------*/

  define('MODULE_ORDER_TOTAL_SHIPPING_TITLE', 'Versandkosten');
  define('MODULE_ORDER_TOTAL_SHIPPING_DESCRIPTION', 'Versandkosten einer Bestellung');

  define('FREE_SHIPPING_TITLE', 'Versandkostenfrei');
  define('FREE_SHIPPING_DESCRIPTION', 'Versandkostenfrei ab einem Bestellwert von %s');
  
  define('MODULE_ORDER_TOTAL_SHIPPING_STATUS_TITLE','Versandkosten');
  define('MODULE_ORDER_TOTAL_SHIPPING_STATUS_DESC','Anzeige der Versandkosten?');
  
  define('MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER_TITLE','Sortierreihenfolge');
  define('MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER_DESC', 'Anzeigereihenfolge.');
  
  define('MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_TITLE','Versandkostenfrei erlauben');
  define('MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_DESC','Versandkostenfreie Lieferung erlauben ?');
  
  //
  // ... E002 - begin
  //
  // ... old
  //
  //define('MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER_TITLE','Versandkostenfrei für Bestellungen ab');
  //
  // ... new
  //
  define('MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER_TITLE','Versandkostenfrei f&uuml;r Bestellungen ab');
  //
  // ... E002 - end
  //
  define('MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER_DESC','Versandkostenfrei ab einem Bestellwert von.');
  
  define('MODULE_ORDER_TOTAL_SHIPPING_DESTINATION_TITLE','Versandkostenfrei nach Zonen');
  define('MODULE_ORDER_TOTAL_SHIPPING_DESTINATION_DESC','Versandkostenfrei nach Zonen berechnen.');
  
  define('MODULE_ORDER_TOTAL_SHIPPING_TAX_CLASS_TITLE','Steuerklasse');
  //
  // ... E002 - begin
  //
  // ... old
  //
  //define('MODULE_ORDER_TOTAL_SHIPPING_TAX_CLASS_DESC','Folgende Steuerklasse für die Versandkosten wählen (Nur für Bestellbearbeitung)');  
  //
  // ... new
  //
  define('MODULE_ORDER_TOTAL_SHIPPING_TAX_CLASS_DESC','Folgende Steuerklasse f&uuml;r die Versandkosten w&auml;hlen (Nur f&uuml;r Bestellbearbeitung)');
  //
  // ... E002 - end
  //
  ?>