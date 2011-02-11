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
   $Id: worldpay.php,v 1.0
   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce
   Anpassung Worldpay by XTC-Webservice.de, Matthias Hinsche
   -----------------------------------------------------------------------------------------
   based on:

  Author : 	Graeme Conkie (graeme@conkie.net)
  Title: WorldPay Payment Callback Module V4.0 Version 1.4

  Revisions:
	Version MS1a Cleaned up code, moved static English to language file to allow for bi-lingual use,
	        Now posting language code to WP, Redirect on failure now to Checkout Payment,
			Reduced re-direct time to 8 seconds, added MD5, made callback dynamic 
			NOTE: YOU MUST CHANGE THE CALLBACK URL IN WP ADMIN TO <wpdisplay item="MC_callback">
	Version 1.4 Removes boxes to prevent users from clicking away before update, 
			Fixes currency for Yen, 
			Redirects to Checkout_Process after 10 seconds or click by user
	Version 1.3 Fixes problem with Multi Currency
	Version 1.2 Added Sort Order and Default order status to work with snapshots after 14 Jan 2003
	Version 1.1 Added Worldpay Pre-Authorisation ability
	Version 1.0 Initial Payment Module

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003
   Released under the GNU General Public License
   ---------------------------------------------------------------------------------------*/

  //
  // ... E002 - begin
  //
  // ... old
  //
  //define('MODULE_PAYMENT_WORLDPAY_TEXT_TITLE', 'Secure Credit Card Payment');
  //define('MODULE_PAYMENT_WORLDPAY_TEXT_DESC', 'Worldpay Payment Module');
  //define('MODULE_PAYMENT_WORLDPAY_TEXT_INFO','');
  //define('MODULE_PAYMENT_WORLDPAY_STATUS_TITLE', 'Enable WorldPay Module');
  //define('MODULE_PAYMENT_WORLDPAY_STATUS_DESC', 'Do you want to accept WorldPay payments?');
  //
  //define('MODULE_PAYMENT_WORLDPAY_ID_TITLE', 'Worldpay Installation ID');
  //define('MODULE_PAYMENT_WORLDPAY_ID_DESC', 'Your WorldPay Select Junior ID');
  //
  //define('MODULE_PAYMENT_WORLDPAY_MODE_TITLE', 'Mode');
  //define('MODULE_PAYMENT_WORLDPAY_MODE_DESC', 'The mode you are working in (100 = Test Mode Accept, 101 = Test Mode Decline, 0 = Live');
  //
  //define('MODULE_PAYMENT_WORLDPAY_USEMD5_TITLE', 'Use MD5');
  //define('MODULE_PAYMENT_WORLDPAY_USEMD5_DESC', 'Use MD5 encyption for transactions? (1 = Yes, 0 = No)');
  //
  //define('MODULE_PAYMENT_WORLDPAY_MD5KEY_TITLE', 'Use MD5');
  //define('MODULE_PAYMENT_WORLDPAY_MD5KEY_DESC', 'Use MD5 encyption for transactions? (1 = Yes, 0 = No)');
  //
  //define('MODULE_PAYMENT_WORLDPAY_SORT_ORDER_TITLE', 'Sort order of display.');
  //define('MODULE_PAYMENT_WORLDPAY_SORT_ORDER_DESC', 'Sort order of display. Lowest is displayed first.');
  //
  //define('MODULE_PAYMENT_WORLDPAY_USEPREAUTH_TITLE', 'Use Pre-Authorisation?');
  //define('MODULE_PAYMENT_WORLDPAY_USEPREAUTH_DESC', 'Do you want to pre-authorise payments? Default=False. You need to request this from WorldPay before using it.');
  //
  //define('MODULE_PAYMENT_WORLDPAY_ORDER_STATUS_ID_TITLE', 'Set Order Status');
  //define('MODULE_PAYMENT_WORLDPAY_ORDER_STATUS_ID_DESC', 'Set the status of orders made with this payment module to this value');
  //
  //define('MODULE_PAYMENT_WORLDPAY_PREAUTH_TITLE', 'Pre-Auth');
  //define('MODULE_PAYMENT_WORLDPAY_PREAUTH_DESC', 'The mode you are working in (A = Pay Now, E = Pre Auth). Ignored if Use PreAuth is False.');
  //
  //define('MODULE_PAYMENT_WORLDPAY_ZONE_TITLE', 'Payment Zone');
  //define('MODULE_PAYMENT_WORLDPAY_ZONE_DESC', 'If a zone is selected, only enable this payment method for that zone.');
  //
  //define('MODULE_PAYMENT_WORLDPAY_ALLOWED_TITLE' , 'Erlaubte Zonen');
  //define('MODULE_PAYMENT_WORLDPAY_ALLOWED_DESC' , 'Geben Sie <b>einzeln</b> die Zonen an, welche f&uuml;r dieses Modul erlaubt sein sollen. (z.B. AT,DE (wenn leer, werden alle Zonen erlaubt))');
  //
  // ... new
  //
  define('MODULE_PAYMENT_WORLDPAY_TEXT_TITLE', 'Sichere Kreditkarten-Zahlung / WorldPay');
  define('MODULE_PAYMENT_WORLDPAY_TEXT_DESC', 'WorldPay Modul');
  define('MODULE_PAYMENT_WORLDPAY_TEXT_INFO','');
  define('MODULE_PAYMENT_WORLDPAY_STATUS_TITLE', 'WorldPay Modul aktivieren');
  define('MODULE_PAYMENT_WORLDPAY_STATUS_DESC', 'M&ouml;chten Sie Zahlungen per WorldPay akzeptieren?');

  define('MODULE_PAYMENT_WORLDPAY_ID_TITLE', 'WorldPay Installations-ID');
  define('MODULE_PAYMENT_WORLDPAY_ID_DESC', 'Ihre WorldPay-Select-Junior-ID');

  define('MODULE_PAYMENT_WORLDPAY_MODE_TITLE', 'Modus');
  define('MODULE_PAYMENT_WORLDPAY_MODE_DESC', 'Ihr gew&auml;hlter Modus (100 = Test Mode Accept, 101 = Test Mode Decline, 0 = Live');

  define('MODULE_PAYMENT_WORLDPAY_USEMD5_TITLE', 'Benutze MD5');
  define('MODULE_PAYMENT_WORLDPAY_USEMD5_DESC', 'MD5 Verschl&uuml;sselung f&uuml;r Transaktionen nutzen? (1 = Ja, 0 = Nein)');

  define('MODULE_PAYMENT_WORLDPAY_MD5KEY_TITLE', 'Benutze MD5');
  define('MODULE_PAYMENT_WORLDPAY_MD5KEY_DESC', 'MD5 Verschl&uuml;sselung f&uuml;r Transaktionen nutzen? (1 = Ja, 0 = Nein)');

  define('MODULE_PAYMENT_WORLDPAY_SORT_ORDER_TITLE', 'Anzeigereihenfolge');
  define('MODULE_PAYMENT_WORLDPAY_SORT_ORDER_DESC', 'Reihenfolge der Anzeige. Kleinste Ziffer wird zuerst angezeigt.');

  define('MODULE_PAYMENT_WORLDPAY_USEPREAUTH_TITLE', 'Benutze Vor-&Uuml;berpr&uuml;fung?');
  define('MODULE_PAYMENT_WORLDPAY_USEPREAUTH_DESC', 'M&ouml;chten Sie Zahlung im voraus &uuml;berpr&uuml;fen? Standard=False. Sie m&uuml;ssen dies vor der Nutzung bei WorldPay anfordern.');

  define('MODULE_PAYMENT_WORLDPAY_ORDER_STATUS_ID_TITLE', 'Bestellstatus festlegen');
  define('MODULE_PAYMENT_WORLDPAY_ORDER_STATUS_ID_DESC', 'Bestellungen, welche mit diesem Modul gemacht werden, auf diesen Status setzen.');

  define('MODULE_PAYMENT_WORLDPAY_PREAUTH_TITLE', 'Vor-&Uuml;berpr&uuml;fung');
  define('MODULE_PAYMENT_WORLDPAY_PREAUTH_DESC', 'Ihr gew&auml;hlter Modus (A = Pay Now, E = Pre Auth). Wird ignoriert, wenn &quot;Benutze Vor-&Uuml;berpr&uuml;fung&quot=false.');

  define('MODULE_PAYMENT_WORLDPAY_ZONE_TITLE', 'Zahlungszone');
  define('MODULE_PAYMENT_WORLDPAY_ZONE_DESC', 'Wenn eine Zone ausgew&auml;hlt ist, gilt die Zahlungsmethode nur f&uuml;r diese Zone.');

  define('MODULE_PAYMENT_WORLDPAY_ALLOWED_TITLE' , 'Erlaubte Zonen');
  define('MODULE_PAYMENT_WORLDPAY_ALLOWED_DESC' , 'Geben Sie <strong>einzeln</strong> die Zonen an, welche f&uuml;r dieses Modul erlaubt sein sollen. (z.B. AT,DE - wenn leer, werden alle Zonen erlaubt)');
  //
  // ... E002 - end
  //
?>