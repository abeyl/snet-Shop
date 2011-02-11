<?PHP
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
   $Id: selfpickup.php 899 2005-04-29 02:40:57Z hhgag $

   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce
   -----------------------------------------------------------------------------------------
   based on: 
   (c) 2000-2001 The Exchange Project  (earlier name of osCommerce)
   (c) 2002-2003 osCommerce( freeamount.php,v 1.01 2002/01/24 03:25:00); www.oscommerce.com 
   (c) 2003	 nextcommerce (freeamount.php,v 1.4 2003/08/13); www.nextcommerce.org

   Released under the GNU General Public License 
   -----------------------------------------------------------------------------------------
   Third Party contributions:
   selfpickup         	Autor:	sebthom

   Released under the GNU General Public License 
   ---------------------------------------------------------------------------------------*/

//
// ... E002 - begin
//
// ... old
//
//define('MODULE_SHIPPING_SELFPICKUP_TEXT_TITLE', 'Selbstabholung');
//define('MODULE_SHIPPING_SELFPICKUP_TEXT_DESCRIPTION', 'Selbstabholung der Ware in unserer Geschäftsstelle');
//define('MODULE_SHIPPING_SELFPICKUP_SORT_ORDER', 'Sortierung');
//
//define('MODULE_SHIPPING_SELFPICKUP_TEXT_TITLE', 'Selbstabholung.');
//define('MODULE_SHIPPING_SELFPICKUP_TEXT_WAY', 'Selbstabholung der Ware in unserer Gesch&auml;ftsstelle.');
//define('MODULE_SHIPPING_SELFPICKUP_ALLOWED_TITLE' , 'Erlaubte Zonen');
//define('MODULE_SHIPPING_SELFPICKUP_ALLOWED_DESC' , 'Geben Sie <b>einzeln</b> die Zonen an, in welche ein Versand möglich sein soll. (z.B. AT,DE (lassen Sie dieses Feld leer, wenn Sie alle Zonen erlauben wollen))');
//define('MODULE_SHIPPING_SELFPICKUP_STATUS_TITLE', 'Selbstabholung aktivieren');
//define('MODULE_SHIPPING_SELFPICKUP_STATUS_DESC', 'M&ouml;chten Sie Selbstabholung anbieten?');
//define('MODULE_SHIPPING_SELFPICKUP_SORT_ORDER_TITLE', 'Sortierreihenfolge');
//define('MODULE_SHIPPING_SELFPICKUP_SORT_ORDER_DESC', 'Reihenfolge der Anzeige');
//
// ... new
//
define('MODULE_SHIPPING_SELFPICKUP_TEXT_TITLE', 'Selbstabholung');
define('MODULE_SHIPPING_SELFPICKUP_TEXT_DESCRIPTION', 'Selbstabholung der Ware in unserer Gesch&auml;ftsstelle');
define('MODULE_SHIPPING_SELFPICKUP_SORT_ORDER', 'Sortierung');

define('MODULE_SHIPPING_SELFPICKUP_TEXT_WAY', 'Selbstabholung der Ware in unserer Gesch&auml;ftsstelle.');
define('MODULE_SHIPPING_SELFPICKUP_ALLOWED_TITLE' , 'Erlaubte Zonen');
define('MODULE_SHIPPING_SELFPICKUP_ALLOWED_DESC' , 'Geben Sie <strong>einzeln</strong> die Zonen an, welche f&uuml;r dieses Modul erlaubt sein sollen. (z.B. AT,DE - wenn leer, werden alle Zonen erlaubt)');
define('MODULE_SHIPPING_SELFPICKUP_STATUS_TITLE', 'Selbstabholung aktivieren');
define('MODULE_SHIPPING_SELFPICKUP_STATUS_DESC', 'M&ouml;chten Sie Selbstabholung anbieten?');
define('MODULE_SHIPPING_SELFPICKUP_SORT_ORDER_TITLE', 'Anzeigereihenfolge');
define('MODULE_SHIPPING_SELFPICKUP_SORT_ORDER_DESC', 'Reihenfolge der Anzeige. Kleinste Ziffer wird zuerst angezeigt.');
//
// ... E002 - end
//
?>