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
   $Id: moneyorder.php 998 2005-07-07 14:18:20Z mz $   

   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce
   -----------------------------------------------------------------------------------------
   based on: 
   (c) 2000-2001 The Exchange Project  (earlier name of osCommerce)
   (c) 2002-2003 osCommerce(moneyorder.php,v 1.8 2003/02/16); www.oscommerce.com 
   (c) 2003	 nextcommerce (moneyorder.php,v 1.4 2003/08/13); www.nextcommerce.org

   Released under the GNU General Public License 
   ---------------------------------------------------------------------------------------*/

  define('MODULE_PAYMENT_MONEYORDER_TEXT_TITLE', 'Scheck/Vorkasse');
  define('MODULE_PAYMENT_MONEYORDER_TEXT_DESCRIPTION', 'Zahlbar an:&nbsp;' . MODULE_PAYMENT_MONEYORDER_PAYTO . '<br />Adressat:<br /><br />' . nl2br(STORE_NAME_ADDRESS) . '<br /><br />' . 'Ihre Bestellung wird nicht versandt, bis wir das Geld erhalten haben!');
  define('MODULE_PAYMENT_MONEYORDER_TEXT_EMAIL_FOOTER', "Zahlbar an: ". MODULE_PAYMENT_MONEYORDER_PAYTO . "\n\nAdressat:\n" . STORE_NAME_ADDRESS . "\n\n" . 'Ihre Bestellung wir nicht versandt, bis wird das Geld erhalten haben!');
  define('MODULE_PAYMENT_MONEYORDER_TEXT_INFO','');
  //
  // ... E002 - begin
  //
  // ... old
  //
  //define('MODULE_PAYMENT_MONEYORDER_STATUS_TITLE' , 'Check/Money Order Modul aktivieren');
  //define('MODULE_PAYMENT_MONEYORDER_STATUS_DESC' , 'M&ouml;chten Sie Zahlungen per Check/Money Order akzeptieren?');
  //define('MODULE_PAYMENT_MONEYORDER_ALLOWED_TITLE' , 'Erlaubte Zonen');
  //define('MODULE_PAYMENT_MONEYORDER_ALLOWED_DESC' , 'Geben Sie <b>einzeln</b> die Zonen an, welche f&uuml;r dieses Modul erlaubt sein sollen. (z.B. AT,DE (wenn leer, werden alle Zonen erlaubt))');
  //
  // ... new
  //
  define('MODULE_PAYMENT_MONEYORDER_STATUS_TITLE' , 'Scheck/Vorkasse Modul aktivieren');
  define('MODULE_PAYMENT_MONEYORDER_STATUS_DESC' , 'M&ouml;chten Sie Zahlungen per Scheck/Vorkasse akzeptieren?');
  define('MODULE_PAYMENT_MONEYORDER_ALLOWED_TITLE' , 'Erlaubte Zonen');
  define('MODULE_PAYMENT_MONEYORDER_ALLOWED_DESC' , 'Geben Sie <strong>einzeln</strong> die Zonen an, welche f&uuml;r dieses Modul erlaubt sein sollen. (z.B. AT,DE - wenn leer, werden alle Zonen erlaubt)');
  //
  // ... E002 - end
  //
  define('MODULE_PAYMENT_MONEYORDER_PAYTO_TITLE' , 'Zahlbar an:');
  define('MODULE_PAYMENT_MONEYORDER_PAYTO_DESC' , 'An wen sollen Zahlungen erfolgen?');
  define('MODULE_PAYMENT_MONEYORDER_SORT_ORDER_TITLE' , 'Anzeigereihenfolge');
  define('MODULE_PAYMENT_MONEYORDER_SORT_ORDER_DESC' , 'Reihenfolge der Anzeige. Kleinste Ziffer wird zuerst angezeigt.');
  define('MODULE_PAYMENT_MONEYORDER_ZONE_TITLE' , 'Zahlungszone');
  define('MODULE_PAYMENT_MONEYORDER_ZONE_DESC' , 'Wenn eine Zone ausgew&auml;hlt ist, gilt die Zahlungsmethode nur f&uuml;r diese Zone.');
  define('MODULE_PAYMENT_MONEYORDER_ORDER_STATUS_ID_TITLE' , 'Bestellstatus festlegen');
  define('MODULE_PAYMENT_MONEYORDER_ORDER_STATUS_ID_DESC' , 'Bestellungen, welche mit diesem Modul gemacht werden, auf diesen Status setzen');
?>