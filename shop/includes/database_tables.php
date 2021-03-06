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

E017 - 05.11.2010 - AB - Tabellenprefix
*/

/* -----------------------------------------------------------------------------------------
   $Id: database_tables.php 1316 2005-10-21 15:30:58Z mz $   

   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce
   -----------------------------------------------------------------------------------------
   based on: 
   (c) 2000-2001 The Exchange Project  (earlier name of osCommerce)
   (c) 2002-2003 osCommerce(database_tables.php,v 1.1 2003/03/14); www.oscommerce.com 
   (c) 2003  nextcommerce (database_tables.php,v 1.8 2003/08/24); www.nextcommerce.org 

   Released under the GNU General Public License 
   ---------------------------------------------------------------------------------------*/


  // define the database table names used in the project
  //
  // ... E017 - begin
  //
  // ... old
  //
  //define('TABLE_ADDRESS_BOOK', 'address_book');
  //define('TABLE_ADDRESS_FORMAT', 'address_format');
  //define('TABLE_BANNERS', 'banners');
  //define('TABLE_BANNERS_HISTORY', 'banners_history');
  //define('TABLE_CAMPAIGNS', 'campaigns');
  //define('TABLE_CATEGORIES', 'categories');
  //define('TABLE_CATEGORIES_DESCRIPTION', 'categories_description');
  //define('TABLE_CONFIGURATION', 'configuration');
  //define('TABLE_CONFIGURATION_GROUP', 'configuration_group');
  //define('TABLE_COUNTER', 'counter');
  //define('TABLE_COUNTER_HISTORY', 'counter_history');
  //define('TABLE_COUNTRIES', 'countries');
  //define('TABLE_CURRENCIES', 'currencies');
  //define('TABLE_CUSTOMERS', 'customers');
  //define('TABLE_CUSTOMERS_BASKET', 'customers_basket');
  //define('TABLE_CUSTOMERS_BASKET_ATTRIBUTES', 'customers_basket_attributes');
  //define('TABLE_CUSTOMERS_INFO', 'customers_info');
  //define('TABLE_CUSTOMERS_IP', 'customers_ip');
  //define('TABLE_CUSTOMERS_STATUS', 'customers_status');
  //define('TABLE_CUSTOMERS_STATUS_HISTORY', 'customers_status_history');
  //define('TABLE_LANGUAGES', 'languages');
  //define('TABLE_MANUFACTURERS', 'manufacturers');
  //define('TABLE_MANUFACTURERS_INFO', 'manufacturers_info');
  //define('TABLE_NEWSLETTER_RECIPIENTS', 'newsletter_recipients');
  //define('TABLE_ORDERS', 'orders');
  //define('TABLE_ORDERS_PRODUCTS', 'orders_products');
  //define('TABLE_ORDERS_PRODUCTS_ATTRIBUTES', 'orders_products_attributes');
  //define('TABLE_ORDERS_PRODUCTS_DOWNLOAD', 'orders_products_download');
  //define('TABLE_ORDERS_STATUS', 'orders_status');
  //define('TABLE_ORDERS_STATUS_HISTORY', 'orders_status_history');
  //define('TABLE_ORDERS_TOTAL', 'orders_total');
  //define('TABLE_SHIPPING_STATUS', 'shipping_status');
  //define('TABLE_PERSONAL_OFFERS_BY','personal_offers_by_customers_status_');
  //define('TABLE_PRODUCTS', 'products');
  //define('TABLE_PRODUCTS_ATTRIBUTES', 'products_attributes');
  //define('TABLE_PRODUCTS_ATTRIBUTES_DOWNLOAD', 'products_attributes_download');
  //define('TABLE_PRODUCTS_DESCRIPTION', 'products_description');
  //define('TABLE_PRODUCTS_NOTIFICATIONS', 'products_notifications');
  //define('TABLE_PRODUCTS_IMAGES', 'products_images');
  //define('TABLE_PRODUCTS_OPTIONS', 'products_options');
  //define('TABLE_PRODUCTS_OPTIONS_VALUES', 'products_options_values');
  //define('TABLE_PRODUCTS_OPTIONS_VALUES_TO_PRODUCTS_OPTIONS', 'products_options_values_to_products_options');
  //define('TABLE_PRODUCTS_TO_CATEGORIES', 'products_to_categories');
  //define('TABLE_PRODUCTS_VPE','products_vpe');
  //define('TABLE_REVIEWS', 'reviews');
  //define('TABLE_REVIEWS_DESCRIPTION', 'reviews_description');
  //define('TABLE_SESSIONS', 'sessions');
  //define('TABLE_SPECIALS', 'specials');
  //define('TABLE_TAX_CLASS', 'tax_class');
  //define('TABLE_TAX_RATES', 'tax_rates');
  //define('TABLE_GEO_ZONES', 'geo_zones');
  //define('TABLE_ZONES_TO_GEO_ZONES', 'zones_to_geo_zones');
  //define('TABLE_WHOS_ONLINE', 'whos_online');
  //define('TABLE_ZONES', 'zones');
  //define('TABLE_PRODUCTS_XSELL', 'products_xsell');
  //define('TABLE_PRODUCTS_XSELL_GROUPS','products_xsell_grp_name');
  //define('TABLE_CONTENT_MANAGER', 'content_manager');
  //define('TABLE_PRODUCTS_CONTENT','products_content');
  //define('TABLE_COUPON_GV_CUSTOMER', 'coupon_gv_customer');
  //define('TABLE_COUPON_GV_QUEUE', 'coupon_gv_queue');
  //define('TABLE_COUPON_REDEEM_TRACK', 'coupon_redeem_track');
  //define('TABLE_COUPON_EMAIL_TRACK', 'coupon_email_track');
  //define('TABLE_COUPONS', 'coupons');
  //define('TABLE_COUPONS_DESCRIPTION', 'coupons_description');
  //define('TABLE_BLACKLIST', 'card_blacklist');
  //define('TABLE_CAMPAIGNS_IP','campaigns_ip');
  //
  // ... new
  //
  $prefix = "xtc_";
  define('TABLE_ADDRESS_BOOK', $prefix.'address_book');
  define('TABLE_ADDRESS_FORMAT', $prefix.'address_format');
  define('TABLE_BANNERS', $prefix.'banners');
  define('TABLE_BANNERS_HISTORY', $prefix.'banners_history');
  define('TABLE_CAMPAIGNS', $prefix.'campaigns');
  define('TABLE_CATEGORIES', $prefix.'categories');
  define('TABLE_CATEGORIES_DESCRIPTION', $prefix.'categories_description');
  define('TABLE_CONFIGURATION', $prefix.'configuration');
  define('TABLE_CONFIGURATION_GROUP', $prefix.'configuration_group');
  define('TABLE_COUNTER', $prefix.'counter');
  define('TABLE_COUNTER_HISTORY', $prefix.'counter_history');
  define('TABLE_COUNTRIES', $prefix.'countries');
  define('TABLE_CURRENCIES', $prefix.'currencies');
  define('TABLE_CUSTOMERS', $prefix.'customers');
  define('TABLE_CUSTOMERS_BASKET', $prefix.'customers_basket');
  define('TABLE_CUSTOMERS_BASKET_ATTRIBUTES', $prefix.'customers_basket_attributes');
  define('TABLE_CUSTOMERS_INFO', $prefix.'customers_info');
  define('TABLE_CUSTOMERS_IP', $prefix.'customers_ip');
  define('TABLE_CUSTOMERS_STATUS', $prefix.'customers_status');
  define('TABLE_CUSTOMERS_STATUS_HISTORY', $prefix.'customers_status_history');
  define('TABLE_LANGUAGES', $prefix.'languages');
  define('TABLE_MANUFACTURERS', $prefix.'manufacturers');
  define('TABLE_MANUFACTURERS_INFO', $prefix.'manufacturers_info');
  define('TABLE_NEWSLETTER_RECIPIENTS', $prefix.'newsletter_recipients');
  define('TABLE_ORDERS', $prefix.'orders');
  define('TABLE_ORDERS_PRODUCTS', $prefix.'orders_products');
  define('TABLE_ORDERS_PRODUCTS_ATTRIBUTES', $prefix.'orders_products_attributes');
  define('TABLE_ORDERS_PRODUCTS_DOWNLOAD', $prefix.'orders_products_download');
  define('TABLE_ORDERS_STATUS', $prefix.'orders_status');
  define('TABLE_ORDERS_STATUS_HISTORY', $prefix.'orders_status_history');
  define('TABLE_ORDERS_TOTAL', $prefix.'orders_total');
  define('TABLE_SHIPPING_STATUS', $prefix.'shipping_status');
  define('TABLE_PERSONAL_OFFERS_BY', $prefix.'personal_offers_by_customers_status_');
  define('TABLE_PRODUCTS', $prefix.'products');
  define('TABLE_PRODUCTS_ATTRIBUTES', $prefix.'products_attributes');
  define('TABLE_PRODUCTS_ATTRIBUTES_DOWNLOAD', $prefix.'products_attributes_download');
  define('TABLE_PRODUCTS_DESCRIPTION', $prefix.'products_description');
  define('TABLE_PRODUCTS_NOTIFICATIONS', $prefix.'products_notifications');
  define('TABLE_PRODUCTS_IMAGES', $prefix.'products_images');
  define('TABLE_PRODUCTS_OPTIONS', $prefix.'products_options');
  define('TABLE_PRODUCTS_OPTIONS_VALUES', $prefix.'products_options_values');
  define('TABLE_PRODUCTS_OPTIONS_VALUES_TO_PRODUCTS_OPTIONS', $prefix.'products_options_values_to_products_options');
  define('TABLE_PRODUCTS_TO_CATEGORIES', $prefix.'products_to_categories');
  define('TABLE_PRODUCTS_VPE', $prefix.'products_vpe');
  define('TABLE_REVIEWS', $prefix.'reviews');
  define('TABLE_REVIEWS_DESCRIPTION', $prefix.'reviews_description');
  define('TABLE_SESSIONS', $prefix.'sessions');
  define('TABLE_SPECIALS', $prefix.'specials');
  define('TABLE_TAX_CLASS', $prefix.'tax_class');
  define('TABLE_TAX_RATES', $prefix.'tax_rates');
  define('TABLE_GEO_ZONES', $prefix.'geo_zones');
  define('TABLE_ZONES_TO_GEO_ZONES', $prefix.'zones_to_geo_zones');
  define('TABLE_WHOS_ONLINE', $prefix.'whos_online');
  define('TABLE_ZONES', $prefix.'zones');
  define('TABLE_PRODUCTS_XSELL', $prefix.'products_xsell');
  define('TABLE_PRODUCTS_XSELL_GROUPS', $prefix.'products_xsell_grp_name');
  define('TABLE_CONTENT_MANAGER', $prefix.'content_manager');
  define('TABLE_PRODUCTS_CONTENT', $prefix.'products_content');
  define('TABLE_COUPON_GV_CUSTOMER', $prefix.'coupon_gv_customer');
  define('TABLE_COUPON_GV_QUEUE', $prefix.'coupon_gv_queue');
  define('TABLE_COUPON_REDEEM_TRACK', $prefix.'coupon_redeem_track');
  define('TABLE_COUPON_EMAIL_TRACK', $prefix.'coupon_email_track');
  define('TABLE_COUPONS', $prefix.'coupons');
  define('TABLE_COUPONS_DESCRIPTION', $prefix.'coupons_description');
  define('TABLE_BLACKLIST', $prefix.'card_blacklist');
  define('TABLE_CAMPAIGNS_IP', $prefix.'campaigns_ip');
  //
  // ... E017 - end
  //
?>