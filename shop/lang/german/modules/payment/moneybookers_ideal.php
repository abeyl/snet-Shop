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
   $Id: amoneybookers.php 85 2007-01-14 15:19:44Z mzanier $

   xt:Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2007 xt:Commerce

   Released under the GNU General Public License
   ---------------------------------------------------------------------------------------*/

  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_TEXT_TITLE', 'iDEAL');
  //
  // ... E002 - begin
  //
  // ... old
  //
  //define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_TEXT_DESCRIPTION', 'iDEAL &uuml;ber Moneybookers<br /><img src="images/icon_arrow_right.gif"> <b><a href="http://www.xt-commerce.com/index.php?option=com_content&task=view&id=76&lang=de" target="_blank">Hilfe zu Einstellungen</a></b>');
  //
  // ... new
  //
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_TEXT_DESCRIPTION', 'iDEAL &uuml;ber Moneybookers');
  //
  // ... E002 - end
  //
  
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_NOCURRENCY_ERROR', 'Es ist keine von Moneybookers akzeptierte W&auml;hrung installiert!');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_ERRORTEXT1', 'payment_error=');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_TEXT_INFO', '');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_ERRORTEXT2', '&error=Fehler w&auml;hrend Ihrer Bezahlung bei Moneybookers!');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_ORDER_TEXT', 'Bestelldatum: ');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_TEXT_ERROR', 'Fehler bei Zahlung!');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_CONFIRMATION_TEXT', 'Danke f&uuml;r Ihre Bestellung!');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_TRANSACTION_FAILED_TEXT', 'Ihre Zahlungstransaktion bei moneybookers.com ist fehlgeschlagen. Bitte versuchen Sie es nochmal, oder w&auml;hlen Sie eine andere Zahlungsm&ouml;glichkeit!');

  define('MB_TEXT_MBDATE', 'Letzte Aktualisierung:');
  define('MB_TEXT_MBTID', 'TR ID:');
  define('MB_TEXT_MBERRTXT', 'Status:');

  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_PROCESSED_STATUS_ID_TITLE', 'Bestellstatus - Processed');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_PROCESSED_STATUS_ID_DESC', '');

  //
  // ... E002 - begin
  //
  // ... old
  //
  //define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_PENDING_STATUS_ID_TITLE', 'Bestellstatus - Sheduled');
  //
  // ... new
  //
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_PENDING_STATUS_ID_TITLE', 'Bestellstatus - Scheduled');
  //
  // ... E002 - end
  //
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_PENDING_STATUS_ID_DESC', '');

  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_CANCELED_STATUS_ID_TITLE', 'Bestellstatus - Canceled');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_CANCELED_STATUS_ID_DESC', '');

  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_TMP_STATUS_ID_TITLE', 'Bestellstatus - Temp');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_TMP_STATUS_ID_DESC', '');

  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_ICONS_TITLE', 'Icons');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_ICONS_DESC', '');

  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_STATUS_TITLE', 'Moneybookers aktivieren');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_STATUS_DESC', 'M&ouml;chten Sie Zahlungen per Moneybookers akzeptieren?');
  //
  // ... E002 - begin
  //
  // ... old
  //
  //define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_EMAILID_TITLE', 'Moneybookers eMail Adresse');
  //define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_EMAILID_DESC', 'eMail Adresse, die bei Moneybookers registriert ist. <br /><font color="ff0000">* Erforderlich</font>');
  //define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_PWD_TITLE', 'Moneybookers Geheimwort');
  //define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_PWD_DESC', 'Geben Sie Ihr Moneybookers Geheimwort ein (dies ist nicht ihr Passwort!)');
  //define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_MERCHANTID_TITLE', 'H&auml;ndler ID ');
  //define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_MERCHANTID_DESC', 'Ihre pers&ouml;nliche H&auml;ndler ID bei Moneybookers <br /><font color="ff0000">* Erforderlich</font>');
  //define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_SORT_ORDER_TITLE', 'Anzeigereihenfolge');
  //define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_SORT_ORDER_DESC', 'Reihenfolge der Anzeige. Kleinste Ziffer wird zuerst angezeigt.');
  //define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_CURRENCY_TITLE', 'Transaktionsw&auml;hrung');
  //define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_CURRENCY_DESC', 'Die W&auml;hrung, in der der Zahlungsvorgang abgewickelt wird. Wenn Ihre gew&auml;hlte W&auml;hrung nicht bei Moneybookers verfügbar ist, wird diese W&auml;hrung ausgew&auml;hlt.');
  //define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_LANGUAGE_TITLE', 'Transaktionssprache');
  //define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_LANGUAGE_DESC', 'Die Sprache, in der der Zahlungsvorgang abgewickelt wird. Wenn Ihre gew&auml;hlte Shopsprache nicht bei Moneybookers verf&uuml;gbar ist, wird diese Sprache ausgew&auml;hlt.');
  //define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_ZONE_TITLE', 'Zahlungszone');
  //define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_ZONE_DESC', 'Wenn eine Zone ausgew&auml;hlt ist, gilt die Zahlungsmethode nur f&uuml;r diese Zone.');
  //define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_ALLOWED_TITLE', 'Erlaubte Zonen');
  //define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_ALLOWED_DESC', 'Geben Sie <b>einzeln</b> die Zonen an, welche f&uuml;r dieses Modul erlaubt sein sollen. (z.B. AT,DE (wenn leer, werden alle Zonen erlaubt))');
  //
  // ... new
  //
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_EMAILID_TITLE', 'Moneybookers E-Mail Adresse');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_EMAILID_DESC', 'E-Mail Adresse, die bei Moneybookers registriert ist. <br /><span style="color:#f00;">* Erforderlich</span>');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_PWD_TITLE', 'Moneybookers Geheimwort');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_PWD_DESC', 'Geben Sie Ihr Moneybookers Geheimwort ein (dies ist nicht Ihr Passwort!)');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_MERCHANTID_TITLE', 'H&auml;ndler ID ');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_MERCHANTID_DESC', 'Ihre pers&ouml;nliche H&auml;ndler ID bei Moneybookers <br /><span style="color:#f00;">* Erforderlich</span>');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_SORT_ORDER_TITLE', 'Anzeigereihenfolge');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_SORT_ORDER_DESC', 'Reihenfolge der Anzeige. Kleinste Ziffer wird zuerst angezeigt.');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_CURRENCY_TITLE', 'Transaktionsw&auml;hrung');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_CURRENCY_DESC', 'Die W&auml;hrung, in welcher der Zahlungsvorgang abgewickelt wird. Wenn Ihre gew&auml;hlte W&auml;hrung nicht bei Moneybookers verf&uuml;gbar ist, wird diese W&auml;hrung ausgew&auml;hlt.');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_LANGUAGE_TITLE', 'Transaktionssprache');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_LANGUAGE_DESC', 'Die Sprache, in welcher der Zahlungsvorgang abgewickelt wird. Wenn Ihre gew&auml;hlte Shopsprache nicht bei Moneybookers verf&uuml;gbar ist, wird diese Sprache ausgew&auml;hlt.');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_ZONE_TITLE', 'Zahlungszone');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_ZONE_DESC', 'Wenn eine Zone ausgew&auml;hlt ist, gilt die Zahlungsmethode nur f&uuml;r diese Zone.');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_ALLOWED_TITLE', 'Erlaubte Zonen');
  define('MODULE_PAYMENT_MONEYBOOKERS_IDEAL_ALLOWED_DESC', 'Geben Sie <strong>einzeln</strong> die Zonen an, welche f&uuml;r dieses Modul erlaubt sein sollen. (z.B. AT,DE - wenn leer, werden alle Zonen erlaubt)');
  //
  // ... E002 - end
  //
?>