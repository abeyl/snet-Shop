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
   $Id: zones.php 899 2005-04-29 02:40:57Z hhgag $   

   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce
   -----------------------------------------------------------------------------------------
   based on: 
   (c) 2000-2001 The Exchange Project  (earlier name of osCommerce)
   (c) 2002-2003 osCommerce(zones.php,v 1.3 2002/04/17); www.oscommerce.com 
   (c) 2003	 nextcommerce (zones.php,v 1.4 2003/08/13); www.nextcommerce.org

   Released under the GNU General Public License 
   ---------------------------------------------------------------------------------------*/
   
// CUSTOMIZE THIS SETTING
define('NUMBER_OF_ZONES',10);

define('MODULE_SHIPPING_ZONES_TEXT_TITLE', 'Versandkosten nach Zonen');
define('MODULE_SHIPPING_ZONES_TEXT_DESCRIPTION', 'Versandkosten Zonenbasierend');
define('MODULE_SHIPPING_ZONES_TEXT_WAY', 'Versand nach:');
define('MODULE_SHIPPING_ZONES_TEXT_UNITS', 'kg');
define('MODULE_SHIPPING_ZONES_INVALID_ZONE', 'Es ist kein Versand in dieses Land m&ouml;glich!');
define('MODULE_SHIPPING_ZONES_UNDEFINED_RATE', 'Die Versandkosten k&ouml;nnen im Moment nicht berechnet werden.');

define('MODULE_SHIPPING_ZONES_STATUS_TITLE' , 'Versandkosten nach Zonen Methode aktivieren');
define('MODULE_SHIPPING_ZONES_STATUS_DESC' , 'M&ouml;chten Sie Versandkosten nach Zonen anbieten?');
//
// ... E002 - begin
//
// ... old
//
//define('MODULE_SHIPPING_ZONES_ALLOWED_TITLE' , 'Erlaubte Versandzonen');
//define('MODULE_SHIPPING_ZONES_ALLOWED_DESC' , 'Geben Sie <b>einzeln</b> die Zonen an, in welche ein Versand möglich sein soll. (z.B. AT,DE (lassen Sie dieses Feld leer, wenn Sie alle Zonen erlauben wollen))');
//define('MODULE_SHIPPING_ZONES_TAX_CLASS_TITLE' , 'Steuerklasse');
//define('MODULE_SHIPPING_ZONES_TAX_CLASS_DESC' , 'Folgende Steuerklasse an Versandkosten anwenden');
//define('MODULE_SHIPPING_ZONES_SORT_ORDER_TITLE' , 'Sortierreihenfolge');
//define('MODULE_SHIPPING_ZONES_SORT_ORDER_DESC' , 'Reihenfolge der Anzeige');
//
// ... new
//
define('MODULE_SHIPPING_ZONES_ALLOWED_TITLE' , 'Erlaubte Zonen');
define('MODULE_SHIPPING_ZONES_ALLOWED_DESC' , 'Geben Sie <strong>einzeln</strong> die Zonen an, welche f&uuml;r dieses Modul erlaubt sein sollen. (z.B. AT,DE - wenn leer, werden alle Zonen erlaubt)');
define('MODULE_SHIPPING_ZONES_TAX_CLASS_TITLE' , 'Steuerklasse');
define('MODULE_SHIPPING_ZONES_TAX_CLASS_DESC' , 'Folgende Steuerklasse an Versandkosten anwenden');
define('MODULE_SHIPPING_ZONES_SORT_ORDER_TITLE' , 'Anzeigereihenfolge');
define('MODULE_SHIPPING_ZONES_SORT_ORDER_DESC' , 'Reihenfolge der Anzeige. Kleinste Ziffer wird zuerst angezeigt.');
//
// ... E002 - end
//

for ($ii=0;$ii<NUMBER_OF_ZONES;$ii++) {
define('MODULE_SHIPPING_ZONES_COUNTRIES_'.$ii.'_TITLE' , 'Zone '.$ii.' L&auml;nder');
define('MODULE_SHIPPING_ZONES_COUNTRIES_'.$ii.'_DESC' , 'Durch Komma getrennte Liste von ISO L&auml;ndercodes (2 Zeichen), welche Teil von Zone '.$ii.' sind.');
define('MODULE_SHIPPING_ZONES_COST_'.$ii.'_TITLE' , 'Zone '.$ii.' Versandkosten');
define('MODULE_SHIPPING_ZONES_COST_'.$ii.'_DESC' , 'Versandkosten nach Zone '.$ii.' Bestimmungsorte, basierend auf einer Gruppe von max. Bestellgewichten. Beispiel: 3:8.50,7:10.50,... Gewicht von kleiner oder gleich 3 w&uuml;rde 8.50 für die Zone '.$ii.' Bestimmungsl&auml;nder kosten.');
//
// ... E002 - begin
//
// ... old
//
//define('MODULE_SHIPPING_ZONES_HANDLING_'.$ii.'_TITLE' , 'Zone '.$ii.' Handling Geb&uuml;hr');
//define('MODULE_SHIPPING_ZONES_HANDLING_'.$ii.'_DESC' , 'Handling Geb&uuml;hr für diese Versandzone');
//
// ... new
//
define('MODULE_SHIPPING_ZONES_HANDLING_'.$ii.'_TITLE' , 'Zone '.$ii.' Bearbeitungsgeb&uuml;hr');
define('MODULE_SHIPPING_ZONES_HANDLING_'.$ii.'_DESC' , 'Bearbeitungsgeb&uuml;hr f&uuml;r diese Versandzone');
//
// ... E002 - end
//
}
?>
