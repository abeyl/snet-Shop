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

   Copyright (c) 2006 xt:Commerce
   -----------------------------------------------------------------------------------------
   based on:
   (c) 2000-2001 The Exchange Project  (earlier name of osCommerce)
   (c) 2002-2003 osCommerce(moneybookers.php,v 1.01 2003/01/20); www.oscommerce.com

   Released under the GNU General Public License
   -----------------------------------------------------------------------------------------
   Third Party contributions:
   Moneybookers v1.0                       Autor:    Gabor Mate  <gabor(at)jamaga.hu>

   Released under the GNU General Public License
   ---------------------------------------------------------------------------------------*/

  define('MODULE_PAYMENT_AMONEYBOOKERS_TEXT_TITLE', 'Sicher bezahlen &uuml;ber Moneybookers');
  //
  // ... E002 - begin
  //
  // ... old
  //
  //define('MODULE_PAYMENT_AMONEYBOOKERS_TEXT_DESCRIPTION', 'Moneybookers<br /><br /><img src="images/icon_arrow_right.gif"> <b><a href="http://www.xt-commerce.com/index.php?option=com_content&task=view&id=76&lang=de" target="_blank">Hilfe zu Einstellungen</a></b>');
  //define('MODULE_PAYMENT_AMONEYBOOKERS_NOCURRENCY_ERROR', 'Es ist keine von Moneybookers akzeptierte Währung installiert!');
  //
  // ... new
  //
  define('MODULE_PAYMENT_AMONEYBOOKERS_TEXT_DESCRIPTION', 'Moneybookers');
  define('MODULE_PAYMENT_AMONEYBOOKERS_NOCURRENCY_ERROR', 'Es ist keine von Moneybookers akzeptierte W&auml;hrung installiert!');
  //
  // ... E002 - end
  //
  define('MODULE_PAYMENT_AMONEYBOOKERS_ERRORTEXT1', 'payment_error=');
  define('MODULE_PAYMENT_AMONEYBOOKERS_TEXT_INFO', '');
  define('MODULE_PAYMENT_AMONEYBOOKERS_ERRORTEXT2', '&error=Fehler w&auml;hrend Ihrer Bezahlung bei Moneybookers!');
  define('MODULE_PAYMENT_AMONEYBOOKERS_ORDER_TEXT', 'Bestelldatum: ');
  define('MODULE_PAYMENT_AMONEYBOOKERS_TEXT_ERROR', 'Fehler bei Zahlung!');
  //
  // ... E002 - begin
  //
  // ... old
  //
  //define('MODULE_PAYMENT_AMONEYBOOKERS_CONFIRMATION_TEXT', 'Danke für Ihre Bestellung!');
  //
  // ... new
  //
  define('MODULE_PAYMENT_AMONEYBOOKERS_CONFIRMATION_TEXT', 'Danke f&uuml;r Ihre Bestellung!');
  //
  // ... E002 - end
  //
  define('MODULE_PAYMENT_AMONEYBOOKERS_TRANSACTION_FAILED_TEXT', 'Ihre Zahlungstransaktion bei moneybookers.com ist fehlgeschlagen. Bitte versuchen Sie es nochmal, oder w&auml;hlen Sie eine andere Zahlungsm&ouml;glichkeit!');

  //
  // ... E002 - begin
  //
  // ... old
  //
  //define('MODULE_PAYMENT_AMONEYBOOKERS_TEXT_INFO_2', '<b>100%-ige Sicherheit</b> - Ihre Daten werden  nach h&ouml;chstem Sicherheitsstandard verschl&uuml;sselt.');
  //define('MODULE_PAYMENT_AMONEYBOOKERS_TEXT_INFO_3', '<b>100%-iger Datenschutz</b> - Ihre  pers&ouml;nlichen  Daten  verbleiben bei Moneybookers als lizensiertem Finanzinstitut und werden nicht an den Shop weitergegeben.');
  //define('MODULE_PAYMENT_AMONEYBOOKERS_TEXT_INFO_4', '<b>maximaler Komfort</b> -  Nachdem Sie einmalig bei Moneybookers registriert sind, reichen Ihre E-Mail-Adresse und Passwort f&uuml;r alle k&uuml;nftigen Zahlungen.');
  //define('MODULE_PAYMENT_AMONEYBOOKERS_TEXT_INFO_5', '<b>hohe Akzeptanz</b> -  Mit Moneybookers k&ouml;nnen Sie in mehreren tausend Shops einkaufen.');
  //
  // ... new
  //
  define('MODULE_PAYMENT_AMONEYBOOKERS_TEXT_INFO_2', '<strong>100%-ige Sicherheit</strong> - Ihre Daten werden  nach h&ouml;chstem Sicherheitsstandard verschl&uuml;sselt.');
  define('MODULE_PAYMENT_AMONEYBOOKERS_TEXT_INFO_3', '<strong>100%-iger Datenschutz</strong> - Ihre  pers&ouml;nlichen  Daten  verbleiben bei Moneybookers als lizensiertem Finanzinstitut und werden nicht an den Shop weitergegeben.');
  define('MODULE_PAYMENT_AMONEYBOOKERS_TEXT_INFO_4', '<strong>maximaler Komfort</strong> -  Nachdem Sie einmalig bei Moneybookers registriert sind, reichen Ihre E-Mail-Adresse und Passwort f&uuml;r alle k&uuml;nftigen Zahlungen.');
  define('MODULE_PAYMENT_AMONEYBOOKERS_TEXT_INFO_5', '<strong>hohe Akzeptanz</strong> -  Mit Moneybookers k&ouml;nnen Sie in mehreren tausend Shops einkaufen.');
  //
  // ... E002 - end
  //
  define('MODULE_PAYMENT_AMONEYBOOKERS_TEXT_INFO_1', '<br /><br />Direkt und bequem zahlen mit...');

  define('MB_TEXT_MBDATE', 'Letzte Aktualisierung:');
  define('MB_TEXT_MBTID', 'TR ID:');
  define('MB_TEXT_MBERRTXT', 'Status:');

  define('MODULE_PAYMENT_AMONEYBOOKERS_PROCESSED_STATUS_ID_TITLE', 'Bestellstatus - Processed');
  define('MODULE_PAYMENT_AMONEYBOOKERS_PROCESSED_STATUS_ID_DESC', '');

  define('MODULE_PAYMENT_AMONEYBOOKERS_PENDING_STATUS_ID_TITLE', 'Bestellstatus - Sheduled');
  define('MODULE_PAYMENT_AMONEYBOOKERS_PENDING_STATUS_ID_DESC', '');

  define('MODULE_PAYMENT_AMONEYBOOKERS_CANCELED_STATUS_ID_TITLE', 'Bestellstatus - Canceled');
  define('MODULE_PAYMENT_AMONEYBOOKERS_CANCELED_STATUS_ID_DESC', '');

  define('MODULE_PAYMENT_AMONEYBOOKERS_TMP_STATUS_ID_TITLE', 'Bestellstatus - Temp');
  define('MODULE_PAYMENT_AMONEYBOOKERS_TMP_STATUS_ID_DESC', '');

  define('MODULE_PAYMENT_AMONEYBOOKERS_ICONS_TITLE', 'Icons');
  define('MODULE_PAYMENT_AMONEYBOOKERS_ICONS_DESC', '');

  define('MODULE_PAYMENT_AMONEYBOOKERS_STATUS_TITLE', 'Moneybookers aktivieren');
  //
  // ... E002 - begin
  //
  // ... old
  //
  //define('MODULE_PAYMENT_AMONEYBOOKERS_STATUS_DESC', 'M&ouml;chten Sie Zahlungen per Moneybookers akzeptieren?<br /><br /><img src="images/icon_arrow_right.gif"> <b><a href="http://www.xt-commerce.com/index.php?option=com_content&task=view&id=76&lang=de" target="_blank">Hilfe zu Einstellungen</a></b>');
  //define('MODULE_PAYMENT_AMONEYBOOKERS_EMAILID_TITLE', 'Moneybookers eMail Adresse');
  //define('MODULE_PAYMENT_AMONEYBOOKERS_EMAILID_DESC', 'eMail Adresse, die bei Moneybookers registriert ist. <br /><font color="ff0000">* Erforderlich</font>');
  //
  // ... new
  //
  define('MODULE_PAYMENT_AMONEYBOOKERS_STATUS_DESC', 'M&ouml;chten Sie Zahlungen per Moneybookers akzeptieren?');
  define('MODULE_PAYMENT_AMONEYBOOKERS_EMAILID_TITLE', 'Moneybookers E-Mail Adresse');
  define('MODULE_PAYMENT_AMONEYBOOKERS_EMAILID_DESC', 'E-Mail Adresse, die bei Moneybookers registriert ist. <br /><span style="color:#f00;">* Erforderlich</span>');
  //
  // ... E002 - end
  //
  define('MODULE_PAYMENT_AMONEYBOOKERS_PWD_TITLE', 'Moneybookers Geheimwort');
  define('MODULE_PAYMENT_AMONEYBOOKERS_PWD_DESC', 'Geben Sie Ihr Moneybookers Geheimwort ein (dies ist nicht ihr Passwort!)');
  //
  // ... E002 - begin
  //
  // ... old
  //
  //define('MODULE_PAYMENT_AMONEYBOOKERS_MERCHANTID_TITLE', 'Händler ID ');
  //define('MODULE_PAYMENT_AMONEYBOOKERS_MERCHANTID_DESC', 'Ihre persönliche Händler ID bei Moneybookers <br /><font color="ff0000">* Erforderlich</font>');
  //
  // ... new
  //
  define('MODULE_PAYMENT_AMONEYBOOKERS_MERCHANTID_TITLE', 'H&auml;ndler-ID ');
  define('MODULE_PAYMENT_AMONEYBOOKERS_MERCHANTID_DESC', 'Ihre pers&ouml;nliche H&auml;ndler-ID bei Moneybookers <br /><span style="color:#f00;">* Erforderlich</span>');
  //
  // ... E002 - end
  //
  define('MODULE_PAYMENT_AMONEYBOOKERS_SORT_ORDER_TITLE', 'Anzeigereihenfolge');
  define('MODULE_PAYMENT_AMONEYBOOKERS_SORT_ORDER_DESC', 'Reihenfolge der Anzeige. Kleinste Ziffer wird zuerst angezeigt.');
  //
  // ... E002 - begin
  //
  // ... old
  //
  //define('MODULE_PAYMENT_AMONEYBOOKERS_CURRENCY_TITLE', 'Transaktionswährung');
  //define('MODULE_PAYMENT_AMONEYBOOKERS_CURRENCY_DESC', 'Die Währung, in der der Zahlungsvorgang abgewickelt wird. Wenn Ihre gewählte Währung nicht bei Moneybookers verfügbar ist, wird diese Währung ausgewählt.');
  //
  // ... new
  //
  define('MODULE_PAYMENT_AMONEYBOOKERS_CURRENCY_TITLE', 'Transaktionsw&auml;hrung');
  define('MODULE_PAYMENT_AMONEYBOOKERS_CURRENCY_DESC', 'Die W&auml;hrung, in der der Zahlungsvorgang abgewickelt wird. Wenn Ihre gew&auml;hlte W&auml;hrung nicht bei Moneybookers verf&uuml;gbar ist, wird diese W&auml;hrung ausgew&auml;hlt.');
  //
  // ... E002 - end
  //
  define('MODULE_PAYMENT_AMONEYBOOKERS_LANGUAGE_TITLE', 'Transaktionssprache');
  //
  // ... E002 - begin
  //
  // ... old
  //
  //define('MODULE_PAYMENT_AMONEYBOOKERS_LANGUAGE_DESC', 'Die Sprache, in der der Zahlungsvorgang abgewickelt wird. Wenn Ihre gewählte Shopsprache nicht bei Moneybookers verfügbar ist, wird diese Sprache ausgewählt.');
  //
  // ... new
  //
  define('MODULE_PAYMENT_AMONEYBOOKERS_LANGUAGE_DESC', 'Die Sprache, in der der Zahlungsvorgang abgewickelt wird. Wenn Ihre gew&auml;hlte Shopsprache nicht bei Moneybookers verf&uuml;gbar ist, wird diese Sprache ausgew&auml;hlt.');
  //
  // ... E002 - end
  //
  define('MODULE_PAYMENT_AMONEYBOOKERS_ZONE_TITLE', 'Zahlungszone');
  define('MODULE_PAYMENT_AMONEYBOOKERS_ZONE_DESC', 'Wenn eine Zone ausgew&auml;hlt ist, gilt die Zahlungsmethode nur f&uuml;r diese Zone.');
  define('MODULE_PAYMENT_AMONEYBOOKERS_ALLOWED_TITLE', 'Erlaubte Zonen');
  //
  // ... E002 - begin
  //
  // ... old
  //
  //define('MODULE_PAYMENT_AMONEYBOOKERS_ALLOWED_DESC', 'Geben Sie <b>einzeln</b> die Zonen an, welche f&uuml;r dieses Modul erlaubt sein sollen. (z.B. AT,DE (wenn leer, werden alle Zonen erlaubt))');
  //
  // ... new
  //
  define('MODULE_PAYMENT_AMONEYBOOKERS_ALLOWED_DESC', 'Geben Sie <strong>einzeln</strong> die Zonen an, welche f&uuml;r dieses Modul erlaubt sein sollen. (z.B. AT,DE - wenn leer, werden alle Zonen erlaubt)');
  //
  // ... E002 - end
  //
?>