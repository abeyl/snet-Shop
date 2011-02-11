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
   $Id: flat.php 899 2005-04-29 02:40:57Z hhgag $   

   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce
   -----------------------------------------------------------------------------------------
   based on: 
   (c) 2000-2001 The Exchange Project  (earlier name of osCommerce)
   (c) 2002-2003 osCommerce(flat.php,v 1.6 2003/02/16); www.oscommerce.com 
   (c) 2003	 nextcommerce (flat.php,v 1.4 2003/08/13); www.nextcommerce.org

   Released under the GNU General Public License 
   ---------------------------------------------------------------------------------------*/

define('MODULE_SHIPPING_FLAT_TEXT_TITLE', 'Pauschale Versandkosten');
define('MODULE_SHIPPING_FLAT_TEXT_DESCRIPTION', 'Pauschale Versandkosten');
define('MODULE_SHIPPING_FLAT_TEXT_WAY', 'Bester Weg');

define('MODULE_SHIPPING_FLAT_STATUS_TITLE' , 'Pauschale Versandkosten aktivieren');
define('MODULE_SHIPPING_FLAT_STATUS_DESC' , 'M&ouml;chten Sie Pauschale Versandkosten anbieten?');
//
// ... E002 - begin
//
// ... old
//
//define('MODULE_SHIPPING_FLAT_ALLOWED_TITLE' , 'Erlaubte Versandzonen');
//define('MODULE_SHIPPING_FLAT_ALLOWED_DESC' , 'Geben Sie <b>einzeln</b> die Zonen an, in welche ein Versand möglich sein soll. (z.B. AT,DE (lassen Sie dieses Feld leer, wenn Sie alle Zonen erlauben wollen))');
//define('MODULE_SHIPPING_FLAT_COST_TITLE' , 'Versandkosten');
//define('MODULE_SHIPPING_FLAT_COST_DESC' , 'Versandkosten für alle Bestellungen unter dieser Versandmethode.');
//define('MODULE_SHIPPING_FLAT_TAX_CLASS_TITLE' , 'Steuerklasse');
//define('MODULE_SHIPPING_FLAT_TAX_CLASS_DESC' , 'Folgende Steuerklasse an Versandkosten anwenden.');
//define('MODULE_SHIPPING_FLAT_ZONE_TITLE' , 'Versandzone');
//define('MODULE_SHIPPING_FLAT_ZONE_DESC' , 'Wenn eine Zone ausgew&auml;hlt ist, wird diese Versandmethode ausschliseslich f&uuml;r diese Zone angewendet.');
//define('MODULE_SHIPPING_FLAT_SORT_ORDER_TITLE' , 'Sortierreihenfolge');
//define('MODULE_SHIPPING_FLAT_SORT_ORDER_DESC' , 'Reihenfolge der Anzeige');
//
// ... new
//
define('MODULE_SHIPPING_FLAT_ALLOWED_TITLE' , 'Erlaubte Zonen');
define('MODULE_SHIPPING_FLAT_ALLOWED_DESC' , 'Geben Sie <strong>einzeln</strong> die Zonen an, welche f&uuml;r dieses Modul erlaubt sein sollen. (z.B. AT,DE - wenn leer, werden alle Zonen erlaubt)');
define('MODULE_SHIPPING_FLAT_COST_TITLE' , 'Versandkosten');
define('MODULE_SHIPPING_FLAT_COST_DESC' , 'Versandkosten f&uuml;r alle Bestellungen unter dieser Versandmethode.');
define('MODULE_SHIPPING_FLAT_TAX_CLASS_TITLE' , 'Steuerklasse');
define('MODULE_SHIPPING_FLAT_TAX_CLASS_DESC' , 'Folgende Steuerklasse an Versandkosten anwenden.');
define('MODULE_SHIPPING_FLAT_ZONE_TITLE' , 'Versandzone');
define('MODULE_SHIPPING_FLAT_ZONE_DESC' , 'Wenn eine Zone ausgew&auml;hlt ist, wird diese Versandmethode ausschlie&szlig;lich f&uuml;r diese Zone angewendet.');
define('MODULE_SHIPPING_FLAT_SORT_ORDER_TITLE' , 'Anzeigereihenfolge');
define('MODULE_SHIPPING_FLAT_SORT_ORDER_DESC' , 'Reihenfolge der Anzeige. Kleinste Ziffer wird zuerst angezeigt.');
//
// ... E002 - end
//
?>
