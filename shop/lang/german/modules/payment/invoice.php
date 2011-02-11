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
   $Id: invoice.php 998 2005-07-07 14:18:20Z mz $   

   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce
   -----------------------------------------------------------------------------------------
   based on:
   (c) 2000-2001 The Exchange Project  (earlier name of osCommerce)
   (c) 2002-2003 osCommerce(cod.php,v 1.28 2003/02/14); www.oscommerce.com
   (c) 2003	 nextcommerce (invoice.php,v 1.4 2003/08/13); www.nextcommerce.org

   Released under the GNU General Public License
   ---------------------------------------------------------------------------------------*/

  define('MODULE_PAYMENT_INVOICE_TEXT_DESCRIPTION', 'Rechnung');
  define('MODULE_PAYMENT_INVOICE_TEXT_TITLE', 'Rechnung');
  define('MODULE_PAYMENT_INVOICE_TEXT_INFO','');
  define('MODULE_PAYMENT_INVOICE_STATUS_TITLE' , 'Rechnungsmodul aktivieren');
  //
  // ... E002 - begin
  //
  // ... old
  //
  //define('MODULE_PAYMENT_INVOICE_STATUS_DESC' , 'M&ouml;chten Sie Zahlungen per Invoices akzeptieren?');
  //
  // ... new
  //
  define('MODULE_PAYMENT_INVOICE_STATUS_DESC' , 'M&ouml;chten Sie Zahlungen per Rechnung akzeptieren?');
  //
  // ... E002 - end
  //
  define('MODULE_PAYMENT_INVOICE_ORDER_STATUS_ID_TITLE' , 'Bestellstatus festlegen');
  define('MODULE_PAYMENT_INVOICE_ORDER_STATUS_ID_DESC' , 'Bestellungen, welche mit diesem Modul gemacht werden, auf diesen Status setzen');
  define('MODULE_PAYMENT_INVOICE_SORT_ORDER_TITLE' , 'Anzeigereihenfolge');
  define('MODULE_PAYMENT_INVOICE_SORT_ORDER_DESC' , 'Reihenfolge der Anzeige. Kleinste Ziffer wird zuerst angezeigt.');
  define('MODULE_PAYMENT_INVOICE_ZONE_TITLE' , 'Zahlungszone');
  define('MODULE_PAYMENT_INVOICE_ZONE_DESC' , 'Wenn eine Zone ausgew&auml;hlt ist, gilt die Zahlungsmethode nur f&uuml;r diese Zone.');
  define('MODULE_PAYMENT_INVOICE_ALLOWED_TITLE' , 'Erlaubte Zonen');
  //
  // ... E002 - begin
  //
  // ... old
  //
  //define('MODULE_PAYMENT_INVOICE_ALLOWED_DESC' , 'Geben Sie <b>einzeln</b> die Zonen an, welche f&uuml;r dieses Modul erlaubt sein sollen. (z.B. AT,DE (wenn leer, werden alle Zonen erlaubt))');
  //
  // ... new
  //
  define('MODULE_PAYMENT_INVOICE_ALLOWED_DESC' , 'Geben Sie <strong>einzeln</strong> die Zonen an, welche f&uuml;r dieses Modul erlaubt sein sollen. (z.B. AT,DE - wenn leer, werden alle Zonen erlaubt)');
  //
  // ... E002 - end
  //
  define('MODULE_PAYMENT_INVOICE_MIN_ORDER_TITLE' , 'Notwendige Bestellungen');
  //
  // ... E002 - begin
  //
  // ... old
  //
  //define('MODULE_PAYMENT_INVOICE_MIN_ORDER_DESC' , 'Die Mindestanzahl an Bestellungen die ein Kunden haben muss damit die Option zur Verfügung steht.');
  //
  // ... new
  //
  define('MODULE_PAYMENT_INVOICE_MIN_ORDER_DESC' , 'Die Mindestanzahl an Bestellungen die ein Kunden haben muss damit die Option zur Verf&uuml;gung steht.');
  //
  // ... E002 - end
  //
?>