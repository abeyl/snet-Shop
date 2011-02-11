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

E007 - 17.03.2010 - AB - PayPal
B007 - 31.03.2010 - AB - Bugfixes 2.12
*/

/* -----------------------------------------------------------------------------------------
   $Id: send_order.php 1029 2005-07-14 19:08:49Z mz $   

   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce
   -----------------------------------------------------------------------------------------
   based on:
   (c) 2003	 nextcommerce (send_order.php,v 1.1 2003/08/24); www.nextcommerce.org
   
   Released under the GNU General Public License 
   ---------------------------------------------------------------------------------------*/

require_once (DIR_FS_INC.'xtc_get_order_data.inc.php');
require_once (DIR_FS_INC.'xtc_get_attributes_model.inc.php');
// check if customer is allowed to send this order!
$order_query_check = xtc_db_query("SELECT
  					customers_id
  					FROM ".TABLE_ORDERS."
  					WHERE orders_id='".$insert_id."'");

$order_check = xtc_db_fetch_array($order_query_check);
if ($_SESSION['customer_id'] == $order_check['customers_id']) {

	$order = new order($insert_id);

	$smarty->assign('address_label_customer', xtc_address_format($order->customer['format_id'], $order->customer, 1, '', '<br />'));
	$smarty->assign('address_label_shipping', xtc_address_format($order->delivery['format_id'], $order->delivery, 1, '', '<br />'));
	if ($_SESSION['credit_covers'] != '1') {
		$smarty->assign('address_label_payment', xtc_address_format($order->billing['format_id'], $order->billing, 1, '', '<br />'));
	}
	$smarty->assign('csID', $order->customer['csID']);
	
	$order_total = $order->getTotalData($insert_id); 
		$smarty->assign('order_data', $order->getOrderData($insert_id));
		$smarty->assign('order_total', $order_total['data']);

	// assign language to template for caching
	$smarty->assign('language', $_SESSION['language']);
	$smarty->assign('tpl_path', 'templates/'.CURRENT_TEMPLATE.'/');
	$smarty->assign('logo_path', HTTP_SERVER.DIR_WS_CATALOG.'templates/'.CURRENT_TEMPLATE.'/img/');
	$smarty->assign('oID', $insert_id);
	if ($order->info['payment_method'] != '' && $order->info['payment_method'] != 'no_payment') {
		include (DIR_WS_LANGUAGES.$_SESSION['language'].'/modules/payment/'.$order->info['payment_method'].'.php');
		$payment_method = constant(strtoupper('MODULE_PAYMENT_'.$order->info['payment_method'].'_TEXT_TITLE'));
	}
	$smarty->assign('PAYMENT_METHOD', $payment_method);
	$smarty->assign('DATE', xtc_date_long($order->info['date_purchased']));

	$smarty->assign('NAME', $order->customer['name']);
	$smarty->assign('COMMENTS', $order->info['comments']);
	$smarty->assign('EMAIL', $order->customer['email_address']);
	$smarty->assign('PHONE',$order->customer['telephone']);

	// PAYMENT MODUL TEXTS
	// EU Bank Transfer
	if ($order->info['payment_method'] == 'eustandardtransfer') {
		$smarty->assign('PAYMENT_INFO_HTML', MODULE_PAYMENT_EUTRANSFER_TEXT_DESCRIPTION);
		$smarty->assign('PAYMENT_INFO_TXT', str_replace("<br />", "\n", MODULE_PAYMENT_EUTRANSFER_TEXT_DESCRIPTION));
	}

	// MONEYORDER
	if ($order->info['payment_method'] == 'moneyorder') {
		$smarty->assign('PAYMENT_INFO_HTML', MODULE_PAYMENT_MONEYORDER_TEXT_DESCRIPTION);
		$smarty->assign('PAYMENT_INFO_TXT', str_replace("<br />", "\n", MODULE_PAYMENT_MONEYORDER_TEXT_DESCRIPTION));
	}

  //
  // ... E007 - begin
  //
  // PAYPAL
	if ($order->info['payment_method'] == 'paypal') {
    $smarty->assign('CURRENCY1',$order->info['currency']);
    $tmp1 = preg_replace ( '/,/', '.' , $order->info['total'] );
	$tmp2 = preg_replace ( '/,/', '.' , floatval ($tmp1));
    $smarty->assign('TOTAL1',$tmp2);
  }
  //
  // ... E007 - end
  //
  
	// dont allow cache
	$smarty->caching = false;

	$html_mail = $smarty->fetch(CURRENT_TEMPLATE.'/mail/'.$_SESSION['language'].'/order_mail.html');
	$txt_mail = $smarty->fetch(CURRENT_TEMPLATE.'/mail/'.$_SESSION['language'].'/order_mail.txt');

	// create subject
	$order_subject = str_replace('{$nr}', $insert_id, EMAIL_BILLING_SUBJECT_ORDER);
	$order_subject = str_replace('{$date}', strftime(DATE_FORMAT_LONG), $order_subject);
	$order_subject = str_replace('{$lastname}', $order->customer['lastname'], $order_subject);
	$order_subject = str_replace('{$firstname}', $order->customer['firstname'], $order_subject);

	// send mail to admin
	//
	// ... B007 - begin
	//
	// ... old
	//
	//xtc_php_mail(EMAIL_BILLING_ADDRESS, EMAIL_BILLING_NAME, EMAIL_BILLING_ADDRESS, STORE_NAME, EMAIL_BILLING_FORWARDING_STRING, $order->customer['email_address'], $order->customer['firstname'], '', '', $order_subject, $html_mail, $txt_mail);
	//
	// ... new
	//
	xtc_php_mail(EMAIL_BILLING_ADDRESS, EMAIL_BILLING_NAME, EMAIL_BILLING_ADDRESS, STORE_NAME, EMAIL_BILLING_FORWARDING_STRING, $order->customer['email_address'], $order->customer['firstname'].' '.$order->customer['lastname'], '', '', $order_subject, $html_mail, $txt_mail);
	//
	// ... B007 - end
	//

	// send mail to customer
	//
	// ... B007 - begin
	//
	if (SEND_EMAILS == 'true') {
    //
    // ... B007 - end
    //
	xtc_php_mail(EMAIL_BILLING_ADDRESS, EMAIL_BILLING_NAME, $order->customer['email_address'], $order->customer['firstname'].' '.$order->customer['lastname'], '', EMAIL_BILLING_REPLY_ADDRESS, EMAIL_BILLING_REPLY_ADDRESS_NAME, '', '', $order_subject, $html_mail, $txt_mail);
	//
	// ... B007 - begin
	//
	}
    //
    // ... B007 - end
    //

	if (AFTERBUY_ACTIVATED == 'true') {
		require_once (DIR_WS_CLASSES.'afterbuy.php');
		$aBUY = new xtc_afterbuy_functions($insert_id);
		if ($aBUY->order_send())
			$aBUY->process_order();
	}

} else {
	$smarty->assign('ERROR', 'You are not allowed to view this order!');
	$smarty->display(CURRENT_TEMPLATE.'/module/error_message.html');
}
?>