#******************************************
#** snet-shop - (c) by stimme.net        **
#** ------------------------------------ **
#** modified xtCommerce                  **
#** leading developer: Andreas Beyl      **
#** contact: info@stimme.net             **
#** web: http://www.stimme.net/snet-shop **
#** copyright (c) 2010 by stimme.net     **
#******************************************
#
#E002 - 10.03.2010 - AB - Defaultwerte
#E003 - 10.03.2010 - AB - Erweiterung Bestelldaten
#E010 - 14.04.2010 - AB - Steuersatz-Dezimalstellen
#E017 - 05.11.2010 - AB - Tabellenprefix
#E018 - 10.11.2010 - AB - Weiterleitung
#A001 - 17.03.2010 - AB - Slimstat
#A002 - 08.04.2010 - AB - Mindestmenge
#B006 - 24.03.2010 - AB - Artikelrabatt
#B007 - 31.03.2010 - AB - Bugfixes 2.12

#--------------------------------------------------------------------------------------
#  $Id: xtcommerce.sql,v 1.62 2004/06/06 18:21:16 novalis Exp $
#
#  XT-Commerce - community made shopping
#  http://www.xt-commerce.com 
#
#  Copyright (c) 2003 XT-Commerce
#  -----------------------------------------------------------------------------------------
#  Third Party Contributions:
#  Customers status v3.x (c) 2002-2003 Elari elari@free.fr
#  Download area : www.unlockgsm.com/dload-osc/
#  CVS : http://cvs.sourceforge.net/cgi-bin/viewcvs.cgi/elari/?sortby=date#dirlist
#  BMC 2003 for the CC CVV Module
#  qenta v1.0          Andreas Oberzier <xtc@netz-designer.de>
#  --------------------------------------------------------------
#  based on:
#  (c) 2000-2001 The Exchange Project  (earlier name of osCommerce)
#  (c) 2002-2003 osCommerce (oscommerce.sql,v 1.83); www.oscommerce.com
#  (c) 2003  nextcommerce (nextcommerce.sql,v 1.76 2003/08/25); www.nextcommerce.org
#
#  Released under the GNU General Public License
#
#  --------------------------------------------------------------
# NOTE: * Please make any modifications to this file by hand!
#       * DO NOT use a mysqldump created file for new changes!
#       * Please take note of the table structure, and use this
#         structure as a standard for future modifications!
#       * To see the 'diff'erence between MySQL databases, use
#         the mysqldiff perl script located in the extras
#         directory of the 'catalog' module.
#       * Comments should be like these, full line comments.
#         (don't use inline comments)
#  --------------------------------------------------------------


DROP TABLE IF EXISTS address_book;
# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS address_book;
#CREATE TABLE address_book (
# ... new
DROP TABLE IF EXISTS xtc_address_book;
CREATE TABLE xtc_address_book (
# ... E017 - end
  address_book_id int NOT NULL auto_increment,
  customers_id int NOT NULL,
  entry_gender char(1) NOT NULL,
  entry_company varchar(32),
  entry_firstname varchar(32) NOT NULL,
  entry_lastname varchar(32) NOT NULL,
  entry_street_address varchar(64) NOT NULL,
  entry_suburb varchar(32),
  entry_postcode varchar(10) NOT NULL,
  entry_city varchar(32) NOT NULL,
  entry_state varchar(32),
  entry_country_id int DEFAULT '0' NOT NULL,
  entry_zone_id int DEFAULT '0' NOT NULL,
  address_date_added datetime DEFAULT '0000-00-00 00:00:00',
  address_last_modified datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (address_book_id),
  KEY idx_address_book_customers_id (customers_id)
);

DROP TABLE IF EXISTS customers_memo;
# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS customers_memo;
#CREATE TABLE customers_memo (
# ... new
DROP TABLE IF EXISTS xtc_customers_memo;
CREATE TABLE xtc_customers_memo (
# ... E017 - end
  memo_id int(11) NOT NULL auto_increment,
  customers_id int(11) NOT NULL default '0',
  memo_date date NOT NULL default '0000-00-00',
  memo_title text NOT NULL,
  memo_text text NOT NULL,
  poster_id int(11) NOT NULL default '0',
  PRIMARY KEY  (memo_id)
);

DROP TABLE IF EXISTS products_xsell;
# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS products_xsell;
#CREATE TABLE products_xsell (
# ... new
DROP TABLE IF EXISTS xtc_products_xsell;
CREATE TABLE xtc_products_xsell (
# ... E017 - end
  ID int(10) NOT NULL auto_increment,
  products_id int(10) unsigned NOT NULL default '1',
  products_xsell_grp_name_id int(10) unsigned NOT NULL default '1',
  xsell_id int(10) unsigned NOT NULL default '1',
  sort_order int(10) unsigned NOT NULL default '1',
  PRIMARY KEY  (ID)
);

DROP TABLE IF EXISTS products_xsell_grp_name;
# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS products_xsell_grp_name;
#CREATE TABLE products_xsell_grp_name (
# ... new
DROP TABLE IF EXISTS xtc_products_xsell_grp_name;
CREATE TABLE xtc_products_xsell_grp_name (
# ... E017 - end
  products_xsell_grp_name_id int(10) NOT NULL,
  xsell_sort_order int(10) NOT NULL default '0',
  language_id smallint(6) NOT NULL default '0',
  groupname varchar(255) NOT NULL default ''
);

DROP TABLE IF EXISTS campaigns;
# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS campaigns;
#CREATE TABLE campaigns (
# ... new
DROP TABLE IF EXISTS xtc_campaigns;
CREATE TABLE xtc_campaigns (
# ... E017 - end
  campaigns_id int(11) NOT NULL auto_increment,
  campaigns_name varchar(32) NOT NULL default '',
  campaigns_refID varchar(64) default NULL,
  campaigns_leads int(11) NOT NULL default '0',
  date_added datetime default NULL,
  last_modified datetime default NULL,
  PRIMARY KEY  (campaigns_id),
  KEY IDX_CAMPAIGNS_NAME (campaigns_name)
);

DROP TABLE IF EXISTS campaigns_ip;
# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS campaigns_ip;
#CREATE TABLE  campaigns_ip (
# ... new
DROP TABLE IF EXISTS xtc_campaigns_ip;
CREATE TABLE xtc_campaigns_ip (
# ... E017 - end
 user_ip VARCHAR( 15 ) NOT NULL ,
 time DATETIME NOT NULL ,
 campaign VARCHAR( 32 ) NOT NULL
);

DROP TABLE IF EXISTS address_format;
# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS address_format;
#CREATE TABLE address_format (
# ... new
DROP TABLE IF EXISTS xtc_address_format;
CREATE TABLE xtc_address_format (
# ... E017 - end
  address_format_id int NOT NULL auto_increment,
  address_format varchar(128) NOT NULL,
  address_summary varchar(48) NOT NULL,
  PRIMARY KEY (address_format_id)
);

DROP TABLE IF EXISTS database_version;
# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS database_version;
#CREATE TABLE database_version (
# ... new
DROP TABLE IF EXISTS xtc_database_version;
CREATE TABLE xtc_database_version (
# ... E017 - end
  version varchar(32) NOT NULL
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS admin_access;
#CREATE TABLE admin_access (
# ... new
DROP TABLE IF EXISTS admin_access;
DROP TABLE IF EXISTS xtc_admin_access;
CREATE TABLE xtc_admin_access (
# ... E017 - end
  customers_id varchar(32) NOT NULL default '0',

  configuration int(1) NOT NULL default '0',
  modules int(1) NOT NULL default '0',
  countries int(1) NOT NULL default '0',
  currencies int(1) NOT NULL default '0',
  zones int(1) NOT NULL default '0',
  geo_zones int(1) NOT NULL default '0',
  tax_classes int(1) NOT NULL default '0',
  tax_rates int(1) NOT NULL default '0',
  accounting int(1) NOT NULL default '0',
  backup int(1) NOT NULL default '0',
  cache int(1) NOT NULL default '0',
  server_info int(1) NOT NULL default '0',
  whos_online int(1) NOT NULL default '0',
  languages int(1) NOT NULL default '0',
  define_language int(1) NOT NULL default '0',
  orders_status int(1) NOT NULL default '0',
  shipping_status int(1) NOT NULL default '0',
  module_export int(1) NOT NULL default '0',

  customers int(1) NOT NULL default '0',
  create_account int(1) NOT NULL default '0',
  customers_status int(1) NOT NULL default '0',
  orders int(1) NOT NULL default '0',
  campaigns int(1) NOT NULL default '0',
  print_packingslip int(1) NOT NULL default '0',
  print_order int(1) NOT NULL default '0',
  popup_memo int(1) NOT NULL default '0',
  coupon_admin int(1) NOT NULL default '0',
  listcategories int(1) NOT NULL default '0',
  gv_queue int(1) NOT NULL default '0',
  gv_mail int(1) NOT NULL default '0',
  gv_sent int(1) NOT NULL default '0',
  validproducts int(1) NOT NULL default '0',
  validcategories int(1) NOT NULL default '0',
  mail int(1) NOT NULL default '0',

  categories int(1) NOT NULL default '0',
  new_attributes int(1) NOT NULL default '0',
  products_attributes int(1) NOT NULL default '0',
  manufacturers int(1) NOT NULL default '0',
  reviews int(1) NOT NULL default '0',
  specials int(1) NOT NULL default '0',

  stats_products_expected int(1) NOT NULL default '0',
  stats_products_viewed int(1) NOT NULL default '0',
  stats_products_purchased int(1) NOT NULL default '0',
  stats_customers int(1) NOT NULL default '0',
  stats_sales_report int(1) NOT NULL default '0',
  stats_campaigns int(1) NOT NULL default '0',

  banner_manager int(1) NOT NULL default '0',
  banner_statistics int(1) NOT NULL default '0',

  module_newsletter int(1) NOT NULL default '0',
  start int(1) NOT NULL default '0',

  content_manager int(1) NOT NULL default '0',
  content_preview int(1) NOT NULL default '0',
  credits int(1) NOT NULL default '0',
  blacklist int(1) NOT NULL default '0',

  orders_edit int(1) NOT NULL default '0',
  popup_image int(1) NOT NULL default '0',
  csv_backend int(1) NOT NULL default '0',
  products_vpe int(1) NOT NULL default '0',
  cross_sell_groups int(1) NOT NULL default '0',
  
  fck_wrapper int(1) NOT NULL default '0',
  econda int(1) NOT NULL default '0',
  sofortueberweisung_install int(1) NOT NULL default '0',
  PRIMARY KEY  (customers_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS banktransfer;
#CREATE TABLE banktransfer (
# ... new
DROP TABLE IF EXISTS banktransfer;
DROP TABLE IF EXISTS xtc_banktransfer;
CREATE TABLE xtc_banktransfer (
# ... E017 - end
  orders_id int(11) NOT NULL default '0',
  banktransfer_owner varchar(64) default NULL,
  banktransfer_number varchar(24) default NULL,
  banktransfer_bankname varchar(255) default NULL,
  banktransfer_blz varchar(8) default NULL,
  banktransfer_status int(11) default NULL,
  banktransfer_prz char(2) default NULL,
  banktransfer_fax char(2) default NULL,
  KEY orders_id(orders_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS banners;
#CREATE TABLE banners (
# ... new
DROP TABLE IF EXISTS banners;
DROP TABLE IF EXISTS xtc_banners;
CREATE TABLE xtc_banners (
# ... E017 - end
  banners_id int NOT NULL auto_increment,
  banners_title varchar(64) NOT NULL,
  banners_url varchar(255) NOT NULL,
  banners_image varchar(64) NOT NULL,
  banners_group varchar(10) NOT NULL,
  banners_html_text text,
  expires_impressions int(7) DEFAULT '0',
  expires_date datetime DEFAULT NULL,
  date_scheduled datetime DEFAULT NULL,
  date_added datetime NOT NULL,
  date_status_change datetime DEFAULT NULL,
  status int(1) DEFAULT '1' NOT NULL,
  PRIMARY KEY  (banners_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS banners_history;
#CREATE TABLE banners_history (
# ... new
DROP TABLE IF EXISTS banners_history;
DROP TABLE IF EXISTS xtc_banners_history;
CREATE TABLE xtc_banners_history (
# ... E017 - end
  banners_history_id int NOT NULL auto_increment,
  banners_id int NOT NULL,
  banners_shown int(5) NOT NULL DEFAULT '0',
  banners_clicked int(5) NOT NULL DEFAULT '0',
  banners_history_date datetime NOT NULL,
  PRIMARY KEY  (banners_history_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS categories;
#CREATE TABLE categories (
# ... new
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS xtc_categories;
CREATE TABLE xtc_categories (
# ... E017 - end
  categories_id int NOT NULL auto_increment,
  categories_image varchar(64),
  parent_id int DEFAULT '0' NOT NULL,
  categories_status TINYint (1)  UNSIGNED DEFAULT "1" NOT NULL,
  categories_template varchar(64),
  group_permission_0 tinyint(1) NOT NULL,
  group_permission_1 tinyint(1) NOT NULL,
  group_permission_2 tinyint(1) NOT NULL,
  group_permission_3 tinyint(1) NOT NULL,
  listing_template varchar(64),
  sort_order int(3) DEFAULT "0" NOT NULL,
  products_sorting varchar(32),
  products_sorting2 varchar(32),
  date_added datetime,
  last_modified datetime,
  # ... E018 - begin
  target_url varchar(255),
  # ... E018 - end
  PRIMARY KEY (categories_id),
  KEY idx_categories_parent_id (parent_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS categories_description;
#CREATE TABLE categories_description (
# ... new
DROP TABLE IF EXISTS categories_description;
DROP TABLE IF EXISTS xtc_categories_description;
CREATE TABLE xtc_categories_description (
# ... E017 - end
  categories_id int DEFAULT '0' NOT NULL,
  language_id int DEFAULT '1' NOT NULL,
  categories_name varchar(32) NOT NULL,
  categories_heading_title varchar(255) NOT NULL,
  categories_description text NOT NULL,
  categories_meta_title varchar(100) NOT NULL,
  categories_meta_description varchar(255) NOT NULL,
  categories_meta_keywords varchar(255) NOT NULL,
  PRIMARY KEY (categories_id, language_id),
  KEY idx_categories_name (categories_name)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS configuration;
#CREATE TABLE configuration (
# ... new
DROP TABLE IF EXISTS configuration;
DROP TABLE IF EXISTS xtc_configuration;
CREATE TABLE xtc_configuration (
# ... E017 - end
  configuration_id int NOT NULL auto_increment,
  configuration_key varchar(64) NOT NULL,
  configuration_value varchar(255) NOT NULL,
  configuration_group_id int NOT NULL,
  sort_order int(5) NULL,
  last_modified datetime NULL,
  date_added datetime NOT NULL,
  use_function varchar(255) NULL,
  set_function varchar(255) NULL,
  PRIMARY KEY (configuration_id),
  KEY idx_configuration_group_id (configuration_group_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS configuration_group;
#CREATE TABLE configuration_group (
# ... new
DROP TABLE IF EXISTS configuration_group;
DROP TABLE IF EXISTS xtc_configuration_group;
CREATE TABLE xtc_configuration_group (
# ... E017 - end
  configuration_group_id int NOT NULL auto_increment,
  configuration_group_title varchar(64) NOT NULL,
  configuration_group_description varchar(255) NOT NULL,
  sort_order int(5) NULL,
  visible int(1) DEFAULT '1' NULL,
  PRIMARY KEY (configuration_group_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS counter;
#CREATE TABLE counter (
# ... new
DROP TABLE IF EXISTS counter;
DROP TABLE IF EXISTS xtc_counter;
CREATE TABLE xtc_counter (
# ... E017 - end
  startdate char(8),
  counter int(12)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS counter_history;
#CREATE TABLE counter_history (
# ... new
DROP TABLE IF EXISTS counter_history;
DROP TABLE IF EXISTS xtc_counter_history;
CREATE TABLE xtc_counter_history (
# ... E017 - end
  month char(8),
  counter int(12)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS countries;
#CREATE TABLE countries (
# ... new
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS xtc_countries;
CREATE TABLE xtc_countries (
# ... E017 - end
  countries_id int NOT NULL auto_increment,
  countries_name varchar(64) NOT NULL,
  countries_iso_code_2 char(2) NOT NULL,
  countries_iso_code_3 char(3) NOT NULL,
  address_format_id int NOT NULL,
  status int(1) DEFAULT '1' NULL,  
  PRIMARY KEY (countries_id),
  KEY IDX_COUNTRIES_NAME (countries_name)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS currencies;
#CREATE TABLE currencies (
# ... new
DROP TABLE IF EXISTS currencies;
DROP TABLE IF EXISTS xtc_currencies;
CREATE TABLE xtc_currencies (
# ... E017 - end
  currencies_id int NOT NULL auto_increment,
  title varchar(32) NOT NULL,
  code char(3) NOT NULL,
  symbol_left varchar(12),
  symbol_right varchar(12),
  decimal_point char(1),
  thousands_point char(1),
  decimal_places char(1),
  value float(13,8),
  last_updated datetime NULL,
  PRIMARY KEY (currencies_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS customers;
#CREATE TABLE customers (
# ... new
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS xtc_customers;
CREATE TABLE xtc_customers (
# ... E017 - end
  customers_id int NOT NULL auto_increment,
  customers_cid varchar(32),
  customers_vat_id varchar (20),
  customers_vat_id_status int(2) DEFAULT '0' NOT NULL,
  customers_warning varchar(32),
  customers_status int(5) DEFAULT '1' NOT NULL,
  customers_gender char(1) NOT NULL,
  customers_firstname varchar(32) NOT NULL,
  customers_lastname varchar(32) NOT NULL,
  customers_dob datetime DEFAULT '0000-00-00 00:00:00' NOT NULL,
  customers_email_address varchar(96) NOT NULL,
  customers_default_address_id int NOT NULL,
  customers_telephone varchar(32) NOT NULL,
  customers_fax varchar(32),
  customers_password varchar(40) NOT NULL,
  customers_newsletter char(1),
  customers_newsletter_mode char( 1 ) DEFAULT '0' NOT NULL,
  member_flag char(1) DEFAULT '0' NOT NULL,
  delete_user char(1) DEFAULT '1' NOT NULL,
  account_type int(1) NOT NULL default '0',
  password_request_key varchar(32) NOT NULL,
  payment_unallowed varchar(255) NOT NULL,
  shipping_unallowed varchar(255) NOT NULL,
  refferers_id int(5) DEFAULT '0' NOT NULL,
  customers_date_added datetime DEFAULT '0000-00-00 00:00:00',
  customers_last_modified datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (customers_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS customers_basket;
#CREATE TABLE customers_basket (
# ... new
DROP TABLE IF EXISTS customers_basket;
DROP TABLE IF EXISTS xtc_customers_basket;
CREATE TABLE xtc_customers_basket (
# ... E017 - end
  customers_basket_id int NOT NULL auto_increment,
  customers_id int NOT NULL,
  products_id tinytext NOT NULL,
  customers_basket_quantity int(2) NOT NULL,
  final_price decimal(15,4) NOT NULL,
  customers_basket_date_added char(8),
  PRIMARY KEY (customers_basket_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS customers_basket_attributes;
#CREATE TABLE customers_basket_attributes (
# ... new
DROP TABLE IF EXISTS customers_basket_attributes;
DROP TABLE IF EXISTS xtc_customers_basket_attributes;
CREATE TABLE xtc_customers_basket_attributes (
# ... E017 - end
  customers_basket_attributes_id int NOT NULL auto_increment,
  customers_id int NOT NULL,
  products_id tinytext NOT NULL,
  products_options_id int NOT NULL,
  products_options_value_id int NOT NULL,
  PRIMARY KEY (customers_basket_attributes_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS customers_info;
#CREATE TABLE customers_info (
# ... new
DROP TABLE IF EXISTS customers_info;
DROP TABLE IF EXISTS xtc_customers_info;
CREATE TABLE xtc_customers_info (
# ... E017 - end
  customers_info_id int NOT NULL,
  customers_info_date_of_last_logon datetime,
  customers_info_number_of_logons int(5),
  customers_info_date_account_created datetime,
  customers_info_date_account_last_modified datetime,
  global_product_notifications int(1) DEFAULT '0',
  PRIMARY KEY (customers_info_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS customers_ip;
#CREATE TABLE customers_ip (
# ... new
DROP TABLE IF EXISTS customers_ip;
DROP TABLE IF EXISTS xtc_customers_ip;
CREATE TABLE xtc_customers_ip (
# ... E017 - end
  customers_ip_id int(11) NOT NULL auto_increment,
  customers_id int(11) NOT NULL default '0',
  customers_ip varchar(15) NOT NULL default '',
  customers_ip_date datetime NOT NULL default '0000-00-00 00:00:00',
  customers_host varchar(255) NOT NULL default '',
  customers_advertiser varchar(30) default NULL,
  customers_referer_url varchar(255) default NULL,
  PRIMARY KEY  (customers_ip_id),
  KEY customers_id (customers_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS customers_status;
#CREATE TABLE customers_status (
# ... new
DROP TABLE IF EXISTS customers_status;
DROP TABLE IF EXISTS xtc_customers_status;
CREATE TABLE xtc_customers_status (
# ... E017 - end
  customers_status_id int(11) NOT NULL default '0',
  language_id int(11) NOT NULL DEFAULT '1',
  customers_status_name VARCHAR(32) NOT NULL DEFAULT '',
  customers_status_public int(1) NOT NULL DEFAULT '1',
  customers_status_min_order int(7) DEFAULT NULL,
  customers_status_max_order int(7) DEFAULT NULL,
  customers_status_image varchar(64) DEFAULT NULL,
  customers_status_discount decimal(4,2) DEFAULT '0',
  customers_status_ot_discount_flag char(1) NOT NULL DEFAULT '0',
  customers_status_ot_discount decimal(4,2) DEFAULT '0',
  customers_status_graduated_prices varchar(1) NOT NULL DEFAULT '0',
  customers_status_show_price int(1) NOT NULL DEFAULT '1',
  customers_status_show_price_tax int(1) NOT NULL DEFAULT '1',
  customers_status_add_tax_ot  int(1) NOT NULL DEFAULT '0',
  customers_status_payment_unallowed varchar(255) NOT NULL,
  customers_status_shipping_unallowed varchar(255) NOT NULL,
  customers_status_discount_attributes  int(1) NOT NULL DEFAULT '0',
  customers_fsk18 int(1) NOT NULL DEFAULT '1',
  customers_fsk18_display int(1) NOT NULL DEFAULT '1',
  customers_status_write_reviews int(1) NOT NULL DEFAULT '1',
  customers_status_read_reviews int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY  (customers_status_id,language_id),
  KEY idx_orders_status_name (customers_status_name)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS customers_status_history;
#CREATE TABLE customers_status_history (
# ... new
DROP TABLE IF EXISTS customers_status_history;
DROP TABLE IF EXISTS xtc_customers_status_history;
CREATE TABLE xtc_customers_status_history (
# ... E017 - end
  customers_status_history_id int(11) NOT NULL auto_increment,
  customers_id int(11) NOT NULL default '0',
  new_value int(5) NOT NULL default '0',
  old_value int(5) default NULL,
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  customer_notified int(1) default '0',
  PRIMARY KEY  (customers_status_history_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS languages;
#CREATE TABLE languages (
# ... new
DROP TABLE IF EXISTS languages;
DROP TABLE IF EXISTS xtc_languages;
CREATE TABLE xtc_languages (
# ... E017 - end
  languages_id int NOT NULL auto_increment,
  name varchar(32)  NOT NULL,
  code char(2) NOT NULL,
  image varchar(64),
  directory varchar(32),
  sort_order int(3),
  language_charset text NOT NULL,
  PRIMARY KEY (languages_id),
  KEY IDX_LANGUAGES_NAME (name)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS manufacturers;
#CREATE TABLE manufacturers (
# ... new
DROP TABLE IF EXISTS manufacturers;
DROP TABLE IF EXISTS xtc_manufacturers;
CREATE TABLE xtc_manufacturers (
# ... E017 - end
  manufacturers_id int NOT NULL auto_increment,
  manufacturers_name varchar(32) NOT NULL,
  manufacturers_image varchar(64),
  date_added datetime NULL,
  last_modified datetime NULL,
  PRIMARY KEY (manufacturers_id),
  KEY IDX_MANUFACTURERS_NAME (manufacturers_name)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS manufacturers_info;
#CREATE TABLE manufacturers_info (
# ... new
DROP TABLE IF EXISTS manufacturers_info;
DROP TABLE IF EXISTS xtc_manufacturers_info;
CREATE TABLE xtc_manufacturers_info (
# ... E017 - end
  manufacturers_id int NOT NULL,
  languages_id int NOT NULL,
  manufacturers_meta_title varchar(100) NOT NULL,
  manufacturers_meta_description varchar(255) NOT NULL,
  manufacturers_meta_keywords varchar(255) NOT NULL,
  manufacturers_url varchar(255) NOT NULL,
  url_clicked int(5) NOT NULL default '0',
  date_last_click datetime NULL,
  PRIMARY KEY (manufacturers_id, languages_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS newsletters;
#CREATE TABLE newsletters (
# ... new
DROP TABLE IF EXISTS newsletters;
DROP TABLE IF EXISTS xtc_newsletters;
CREATE TABLE xtc_newsletters (
# ... E017 - end
  newsletters_id int NOT NULL auto_increment,
  title varchar(255) NOT NULL,
  content text NOT NULL,
  module varchar(255) NOT NULL,
  date_added datetime NOT NULL,
  date_sent datetime,
  status int(1),
  locked int(1) DEFAULT '0',
  PRIMARY KEY (newsletters_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS newsletter_recipients;
#CREATE TABLE newsletter_recipients (
# ... new
DROP TABLE IF EXISTS newsletter_recipients;
DROP TABLE IF EXISTS xtc_newsletter_recipients;
CREATE TABLE xtc_newsletter_recipients (
# ... E017 - end
  mail_id int(11) NOT NULL auto_increment,
  customers_email_address varchar(96) NOT NULL default '',
  customers_id int(11) NOT NULL default '0',
  customers_status int(5) NOT NULL default '0',
  customers_firstname varchar(32) NOT NULL default '',
  customers_lastname varchar(32) NOT NULL default '',
  mail_status int(1) NOT NULL default '0',
  mail_key varchar(32) NOT NULL default '',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (mail_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS newsletters_history;
#CREATE TABLE newsletters_history (
# ... new
DROP TABLE IF EXISTS newsletters_history;
DROP TABLE IF EXISTS xtc_newsletters_history;
CREATE TABLE xtc_newsletters_history (
# ... E017 - end
  news_hist_id int(11) NOT NULL default '0',
  news_hist_cs int(11) NOT NULL default '0',
  news_hist_cs_date_sent date default NULL,
  PRIMARY KEY  (news_hist_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS orders;
#CREATE TABLE orders (
# ... new
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS xtc_orders;
CREATE TABLE xtc_orders (
# ... E017 - end
  orders_id int NOT NULL auto_increment,
  customers_id int NOT NULL,
  customers_cid varchar(32),
  customers_vat_id varchar (20),
  customers_status int(11),
  customers_status_name varchar(32) NOT NULL,
  customers_status_image varchar (64),
  customers_status_discount decimal (4,2),
  customers_name varchar(64) NOT NULL,
  customers_firstname varchar(64) NOT NULL,
  customers_lastname varchar(64) NOT NULL,
  customers_company varchar(32),
  customers_street_address varchar(64) NOT NULL,
  customers_suburb varchar(32),
  customers_city varchar(32) NOT NULL,
  customers_postcode varchar(10) NOT NULL,
  customers_state varchar(32),
  customers_country varchar(32) NOT NULL,
  customers_telephone varchar(32) NOT NULL,
  customers_email_address varchar(96) NOT NULL,
  customers_address_format_id int(5) NOT NULL,
  delivery_name varchar(64) NOT NULL,
  delivery_firstname varchar(64) NOT NULL,
  delivery_lastname varchar(64) NOT NULL,
  delivery_company varchar(32),
  delivery_street_address varchar(64) NOT NULL,
  delivery_suburb varchar(32),
  delivery_city varchar(32) NOT NULL,
  delivery_postcode varchar(10) NOT NULL,
  delivery_state varchar(32),
  delivery_country varchar(32) NOT NULL,
  delivery_country_iso_code_2 char(2) NOT NULL,
  delivery_address_format_id int(5) NOT NULL,
  billing_name varchar(64) NOT NULL,
  billing_firstname varchar(64) NOT NULL,
  billing_lastname varchar(64) NOT NULL,
  billing_company varchar(32),
  billing_street_address varchar(64) NOT NULL,
  billing_suburb varchar(32),
  billing_city varchar(32) NOT NULL,
  billing_postcode varchar(10) NOT NULL,
  billing_state varchar(32),
  billing_country varchar(32) NOT NULL,
  billing_country_iso_code_2 char(2) NOT NULL,
  billing_address_format_id int(5) NOT NULL,
  payment_method varchar(32) NOT NULL,
  cc_type varchar(20),
  cc_owner varchar(64),
  cc_number varchar(64),
  cc_expires varchar(4),
  cc_start varchar(4) default NULL,
  cc_issue varchar(3) default NULL,
  cc_cvv varchar(4) default NULL,
  comments varchar (255),
  last_modified datetime,
  date_purchased datetime,
  orders_status int(5) NOT NULL,
  orders_date_finished datetime,
  currency char(3),
  currency_value decimal(14,6),
  account_type int(1) DEFAULT '0' NOT NULL,
  payment_class VARCHAR(32) NOT NULL,
  shipping_method VARCHAR(32) NOT NULL,
  shipping_class VARCHAR(32) NOT NULL,
  customers_ip VARCHAR(32) NOT NULL,
  language VARCHAR(32) NOT NULL,
  afterbuy_success INT(1) DEFAULT'0' NOT NULL,
  afterbuy_id INT(32) DEFAULT '0' NOT NULL,
  refferers_id VARCHAR(32) NOT NULL,
  conversion_type INT(1) DEFAULT '0' NOT NULL,
  orders_ident_key varchar(128),
  PRIMARY KEY (orders_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS card_blacklist;
#CREATE TABLE card_blacklist (
# ... new
DROP TABLE IF EXISTS card_blacklist;
DROP TABLE IF EXISTS xtc_card_blacklist;
CREATE TABLE xtc_card_blacklist (
# ... E017 - end
  blacklist_id int(5) NOT NULL auto_increment,
  blacklist_card_number varchar(20) NOT NULL default '',
  date_added datetime default NULL,
  last_modified datetime default NULL,
  KEY blacklist_id (blacklist_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS orders_products;
#CREATE TABLE orders_products (
# ... new
DROP TABLE IF EXISTS orders_products;
DROP TABLE IF EXISTS xtc_orders_products;
CREATE TABLE xtc_orders_products (
# ... E017 - end
  orders_products_id int NOT NULL auto_increment,
  orders_id int NOT NULL,
  products_id int NOT NULL,
  products_model varchar(64),
  products_name varchar(64) NOT NULL,
  products_price decimal(15,4) NOT NULL,
  products_discount_made decimal(4,2) DEFAULT NULL,
  products_shipping_time varchar(255) DEFAULT NULL,
  final_price decimal(15,4) NOT NULL,
  products_tax decimal(7,4) NOT NULL,
  products_quantity int(2) NOT NULL,
  allow_tax int(1) NOT NULL,
  PRIMARY KEY (orders_products_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS orders_status;
#CREATE TABLE orders_status (
# ... new
DROP TABLE IF EXISTS orders_status;
DROP TABLE IF EXISTS xtc_orders_status;
CREATE TABLE xtc_orders_status (
# ... E017 - end
  orders_status_id int DEFAULT '0' NOT NULL,
  language_id int DEFAULT '1' NOT NULL,
  orders_status_name varchar(32) NOT NULL,
  PRIMARY KEY (orders_status_id, language_id),
  KEY idx_orders_status_name (orders_status_name)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS shipping_status;
#CREATE TABLE shipping_status (
# ... new
DROP TABLE IF EXISTS shipping_status;
DROP TABLE IF EXISTS xtc_shipping_status;
CREATE TABLE xtc_shipping_status (
# ... E017 - end
  shipping_status_id int DEFAULT '0' NOT NULL,
  language_id int DEFAULT '1' NOT NULL,
  shipping_status_name varchar(32) NOT NULL,
  shipping_status_image varchar(32) NOT NULL,
  PRIMARY KEY (shipping_status_id, language_id),
  KEY idx_shipping_status_name (shipping_status_name)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS orders_status_history;
#CREATE TABLE orders_status_history (
# ... new
DROP TABLE IF EXISTS orders_status_history;
DROP TABLE IF EXISTS xtc_orders_status_history;
CREATE TABLE xtc_orders_status_history (
# ... E017 - end
  orders_status_history_id int NOT NULL auto_increment,
  orders_id int NOT NULL,
  orders_status_id int(5) NOT NULL,
  date_added datetime NOT NULL,
  customer_notified int(1) DEFAULT '0',
  comments text,
  PRIMARY KEY (orders_status_history_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS orders_products_attributes;
#CREATE TABLE orders_products_attributes (
# ... new
DROP TABLE IF EXISTS orders_products_attributes;
DROP TABLE IF EXISTS xtc_orders_products_attributes;
CREATE TABLE xtc_orders_products_attributes (
# ... E017 - end
  orders_products_attributes_id int NOT NULL auto_increment,
  orders_id int NOT NULL,
  orders_products_id int NOT NULL,
  products_options varchar(32) NOT NULL,
  products_options_values varchar(64) NOT NULL,
  options_values_price decimal(15,4) NOT NULL,
  price_prefix char(1) NOT NULL,
  PRIMARY KEY (orders_products_attributes_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS orders_products_download;
#CREATE TABLE orders_products_download (
# ... new
DROP TABLE IF EXISTS orders_products_download;
DROP TABLE IF EXISTS xtc_orders_products_download;
CREATE TABLE xtc_orders_products_download (
# ... E017 - end
  orders_products_download_id int NOT NULL auto_increment,
  orders_id int NOT NULL default '0',
  orders_products_id int NOT NULL default '0',
  orders_products_filename varchar(255) NOT NULL default '',
  download_maxdays int(2) NOT NULL default '0',
  download_count int(2) NOT NULL default '0',
  PRIMARY KEY  (orders_products_download_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS orders_total;
#CREATE TABLE orders_total (
# ... new
DROP TABLE IF EXISTS orders_total;
DROP TABLE IF EXISTS xtc_orders_total;
CREATE TABLE xtc_orders_total (
# ... E017 - end
  orders_total_id int unsigned NOT NULL auto_increment,
  orders_id int NOT NULL,
  title varchar(255) NOT NULL,
  text varchar(255) NOT NULL,
  value decimal(15,4) NOT NULL,
  class varchar(32) NOT NULL,
  sort_order int NOT NULL,
  PRIMARY KEY (orders_total_id),
  KEY idx_orders_total_orders_id (orders_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS orders_recalculate;
#CREATE TABLE orders_recalculate (
# ... new
DROP TABLE IF EXISTS orders_recalculate;
DROP TABLE IF EXISTS xtc_orders_recalculate;
CREATE TABLE xtc_orders_recalculate (
# ... E017 - end
  orders_recalculate_id int(11) NOT NULL auto_increment,
  orders_id int(11) NOT NULL default '0',
  n_price decimal(15,4) NOT NULL default '0.0000',
  b_price decimal(15,4) NOT NULL default '0.0000',
  tax decimal(15,4) NOT NULL default '0.0000',
  tax_rate decimal(7,4) NOT NULL default '0.0000',
  class varchar(32) NOT NULL default '',
  PRIMARY KEY  (orders_recalculate_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS products;
#CREATE TABLE products (
# ... new
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS xtc_products;
CREATE TABLE xtc_products (
# ... E017 - end
  products_id int NOT NULL auto_increment,
  products_ean varchar(128),
  products_quantity int(4) NOT NULL,
  products_shippingtime int(4) NOT NULL,
  products_model varchar(64),
  group_permission_0 tinyint(1) NOT NULL,
  group_permission_1 tinyint(1) NOT NULL,
  group_permission_2 tinyint(1) NOT NULL,
  group_permission_3 tinyint(1) NOT NULL,
  products_sort int(4) NOT NULL DEFAULT '0',
  products_image varchar(64),
  products_price decimal(15,4) NOT NULL,
  products_discount_allowed decimal(3,2) DEFAULT '0' NOT NULL,
  products_date_added datetime NOT NULL,
  products_last_modified datetime,
  products_date_available datetime,
  products_weight decimal(5,2) NOT NULL,
  products_status tinyint(1) NOT NULL,
  products_tax_class_id int NOT NULL,
  product_template varchar (64),
  options_template varchar (64),
  manufacturers_id int NULL,
  products_ordered int NOT NULL default '0',
  products_fsk18 int(1) NOT NULL DEFAULT '0',
  products_vpe int(11) NOT NULL,
  products_vpe_status int(1) NOT NULL DEFAULT '0',
  products_vpe_value decimal(15,4) NOT NULL,
  products_startpage int(1) NOT NULL DEFAULT '0',
  products_startpage_sort int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (products_id),
  KEY idx_products_date_added (products_date_added)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS products_attributes;
#CREATE TABLE products_attributes (
# ... new
DROP TABLE IF EXISTS products_attributes;
DROP TABLE IF EXISTS xtc_products_attributes;
CREATE TABLE xtc_products_attributes (
# ... E017 - end
  products_attributes_id int NOT NULL auto_increment,
  products_id int NOT NULL,
  options_id int NOT NULL,
  options_values_id int NOT NULL,
  options_values_price decimal(15,4) NOT NULL,
  price_prefix char(1) NOT NULL,
  attributes_model varchar(64) NULL,
  attributes_stock int(4) NULL,
  options_values_weight decimal(15,4) NOT NULL,
  weight_prefix char(1) NOT NULL,
  sortorder int(11) NULL,
  PRIMARY KEY (products_attributes_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS products_attributes_download;
#CREATE TABLE products_attributes_download (
# ... new
DROP TABLE IF EXISTS products_attributes_download;
DROP TABLE IF EXISTS xtc_products_attributes_download;
CREATE TABLE xtc_products_attributes_download (
# ... E017 - end
  products_attributes_id int NOT NULL,
  products_attributes_filename varchar(255) NOT NULL default '',
  products_attributes_maxdays int(2) default '0',
  products_attributes_maxcount int(2) default '0',
  PRIMARY KEY  (products_attributes_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS products_description;
#CREATE TABLE products_description (
# ... new
DROP TABLE IF EXISTS products_description;
DROP TABLE IF EXISTS xtc_products_description;
CREATE TABLE xtc_products_description (
# ... E017 - end
  products_id int NOT NULL auto_increment,
  language_id int NOT NULL default '1',
  products_name varchar(64) NOT NULL default '',
  products_description text,
  products_short_description text,
  products_keywords VARCHAR(255) DEFAULT NULL,
  products_meta_title text NOT NULL,
  products_meta_description text NOT NULL,
  products_meta_keywords text NOT NULL,
  products_url varchar(255) default NULL,
  products_viewed int(5) default '0',
  PRIMARY KEY  (products_id,language_id),
  KEY products_name (products_name)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS products_images;
#CREATE TABLE products_images (
# ... new
DROP TABLE IF EXISTS products_images;
DROP TABLE IF EXISTS xtc_products_images;
CREATE TABLE xtc_products_images (
# ... E017 - end
  image_id INT NOT NULL auto_increment,
  products_id INT NOT NULL ,
  image_nr SMALLINT NOT NULL ,
  image_name VARCHAR( 254 ) NOT NULL ,
  PRIMARY KEY ( image_id )
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS products_notifications;
#CREATE TABLE products_notifications (
# ... new
DROP TABLE IF EXISTS products_notifications;
DROP TABLE IF EXISTS xtc_products_notifications;
CREATE TABLE xtc_products_notifications (
# ... E017 - end
  products_id int NOT NULL,
  customers_id int NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (products_id, customers_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS products_options;
#CREATE TABLE products_options (
# ... new
DROP TABLE IF EXISTS products_options;
DROP TABLE IF EXISTS xtc_products_options;
CREATE TABLE xtc_products_options (
# ... E017 - end
  products_options_id int NOT NULL default '0',
  language_id int NOT NULL default '1',
  products_options_name varchar(32) NOT NULL default '',
  PRIMARY KEY  (products_options_id,language_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS products_options_values;
#CREATE TABLE products_options_values (
# ... new
DROP TABLE IF EXISTS products_options_values;
DROP TABLE IF EXISTS xtc_products_options_values;
CREATE TABLE xtc_products_options_values (
# ... E017 - end
  products_options_values_id int NOT NULL default '0',
  language_id int NOT NULL default '1',
  products_options_values_name varchar(64) NOT NULL default '',
  PRIMARY KEY  (products_options_values_id,language_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS products_options_values_to_products_options;
#CREATE TABLE products_options_values_to_products_options (
# ... new
DROP TABLE IF EXISTS products_options_values_to_products_options;
DROP TABLE IF EXISTS xtc_products_options_values_to_products_options;
CREATE TABLE xtc_products_options_values_to_products_options (
# ... E017 - end
  products_options_values_to_products_options_id int NOT NULL auto_increment,
  products_options_id int NOT NULL,
  products_options_values_id int NOT NULL,
  PRIMARY KEY (products_options_values_to_products_options_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS products_graduated_prices;
#CREATE TABLE products_graduated_prices (
# ... new
DROP TABLE IF EXISTS products_graduated_prices;
DROP TABLE IF EXISTS xtc_products_graduated_prices;
CREATE TABLE xtc_products_graduated_prices (
# ... E017 - end
  products_id int(11) NOT NULL default '0',
  quantity int(11) NOT NULL default '0',
  unitprice decimal(15,4) NOT NULL default '0.0000',
  KEY products_id (products_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS products_to_categories;
#CREATE TABLE products_to_categories (
# ... new
DROP TABLE IF EXISTS products_to_categories;
DROP TABLE IF EXISTS xtc_products_to_categories;
CREATE TABLE xtc_products_to_categories (
# ... E017 - end
  products_id int NOT NULL,
  categories_id int NOT NULL,
  PRIMARY KEY (products_id,categories_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS products_vpe;
#CREATE TABLE products_vpe (
# ... new
DROP TABLE IF EXISTS products_vpe;
DROP TABLE IF EXISTS xtc_products_vpe;
CREATE TABLE xtc_products_vpe (
# ... E017 - end
  products_vpe_id int(11) NOT NULL default '0',
  language_id int(11) NOT NULL default '0',
  products_vpe_name varchar(32) NOT NULL default ''
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS reviews;
#CREATE TABLE reviews (
# ... new
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS xtc_reviews;
CREATE TABLE xtc_reviews (
# ... E017 - end
  reviews_id int NOT NULL auto_increment,
  products_id int NOT NULL,
  customers_id int,
  customers_name varchar(64) NOT NULL,
  reviews_rating int(1),
  date_added datetime,
  last_modified datetime,
  reviews_read int(5) NOT NULL default '0',
  PRIMARY KEY (reviews_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS reviews_description;
#CREATE TABLE reviews_description (
# ... new
DROP TABLE IF EXISTS reviews_description;
DROP TABLE IF EXISTS xtc_reviews_description;
CREATE TABLE xtc_reviews_description (
# ... E017 - end
  reviews_id int NOT NULL,
  languages_id int NOT NULL,
  reviews_text text NOT NULL,
  PRIMARY KEY (reviews_id, languages_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS sessions;
#CREATE TABLE sessions (
# ... new
DROP TABLE IF EXISTS sessions;
DROP TABLE IF EXISTS xtc_sessions;
CREATE TABLE xtc_sessions (
# ... E017 - end
  sesskey varchar(32) NOT NULL,
  expiry int(11) unsigned NOT NULL,
  value text NOT NULL,
  PRIMARY KEY (sesskey)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS specials;
#CREATE TABLE specials (
# ... new
DROP TABLE IF EXISTS specials;
DROP TABLE IF EXISTS xtc_specials;
CREATE TABLE xtc_specials (
# ... E017 - end
  specials_id int NOT NULL auto_increment,
  products_id int NOT NULL,
  specials_quantity int(4) NOT NULL,
  specials_new_products_price decimal(15,4) NOT NULL,
  specials_date_added datetime,
  specials_last_modified datetime,
  expires_date datetime,
  date_status_change datetime,
  status int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (specials_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS tax_class;
#CREATE TABLE tax_class (
# ... new
DROP TABLE IF EXISTS tax_class;
DROP TABLE IF EXISTS xtc_tax_class;
CREATE TABLE xtc_tax_class (
# ... E017 - end
  tax_class_id int NOT NULL auto_increment,
  tax_class_title varchar(32) NOT NULL,
  tax_class_description varchar(255) NOT NULL,
  last_modified datetime NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (tax_class_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS tax_rates;
#CREATE TABLE tax_rates (
# ... new
DROP TABLE IF EXISTS tax_rates;
DROP TABLE IF EXISTS xtc_tax_rates;
CREATE TABLE xtc_tax_rates (
# ... E017 - end
  tax_rates_id int NOT NULL auto_increment,
  tax_zone_id int NOT NULL,
  tax_class_id int NOT NULL,
  tax_priority int(5) DEFAULT 1,
  tax_rate decimal(7,4) NOT NULL,
  tax_description varchar(255) NOT NULL,
  last_modified datetime NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (tax_rates_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS geo_zones;
#CREATE TABLE geo_zones (
# ... new
DROP TABLE IF EXISTS geo_zones;
DROP TABLE IF EXISTS xtc_geo_zones;
CREATE TABLE xtc_geo_zones (
# ... E017 - end
  geo_zone_id int NOT NULL auto_increment,
  geo_zone_name varchar(32) NOT NULL,
  geo_zone_description varchar(255) NOT NULL,
  last_modified datetime NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (geo_zone_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS whos_online;
#CREATE TABLE whos_online (
# ... new
DROP TABLE IF EXISTS whos_online;
DROP TABLE IF EXISTS xtc_whos_online;
CREATE TABLE xtc_whos_online (
# ... E017 - end
  customer_id int,
  full_name varchar(64) NOT NULL,
  session_id varchar(128) NOT NULL,
  ip_address varchar(15) NOT NULL,
  time_entry varchar(14) NOT NULL,
  time_last_click varchar(14) NOT NULL,
  last_page_url varchar(255) NOT NULL
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS zones;
#CREATE TABLE zones (
# ... new
DROP TABLE IF EXISTS zones;
DROP TABLE IF EXISTS xtc_zones;
CREATE TABLE xtc_zones (
# ... E017 - end
  zone_id int NOT NULL auto_increment,
  zone_country_id int NOT NULL,
  zone_code varchar(32) NOT NULL,
  zone_name varchar(32) NOT NULL,
  PRIMARY KEY (zone_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS zones_to_geo_zones;
#CREATE TABLE zones_to_geo_zones (
# ... new
DROP TABLE IF EXISTS zones_to_geo_zones;
DROP TABLE IF EXISTS xtc_zones_to_geo_zones;
CREATE TABLE xtc_zones_to_geo_zones (
# ... E017 - end
   association_id int NOT NULL auto_increment,
   zone_country_id int NOT NULL,
   zone_id int NULL,
   geo_zone_id int NULL,
   last_modified datetime NULL,
   date_added datetime NOT NULL,
   PRIMARY KEY (association_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS content_manager;
#CREATE TABLE content_manager (
# ... new
DROP TABLE IF EXISTS content_manager;
DROP TABLE IF EXISTS xtc_content_manager;
CREATE TABLE xtc_content_manager (
# ... E017 - end
  content_id int(11) NOT NULL auto_increment,
  categories_id int(11) NOT NULL default '0',
  parent_id int(11) NOT NULL default '0',
  group_ids TEXT,
  languages_id int(11) NOT NULL default '0',
  content_title text NOT NULL,
  content_heading text NOT NULL,
  content_text text NOT NULL,
  sort_order int(4) NOT NULL default '0',
  file_flag int(1) NOT NULL default '0',
  content_file varchar(64) NOT NULL default '',
  content_status int(1) NOT NULL default '0',
  content_group int(11) NOT NULL,
  content_delete int(1) NOT NULL default '1',
  PRIMARY KEY  (content_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS media_content;
#CREATE TABLE media_content (
# ... new
DROP TABLE IF EXISTS media_content;
DROP TABLE IF EXISTS xtc_media_content;
CREATE TABLE xtc_media_content (
# ... E017 - end
  file_id int(11) NOT NULL auto_increment,
  old_filename text NOT NULL,
  new_filename text NOT NULL,
  file_comment text NOT NULL,
  PRIMARY KEY  (file_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS products_content;
#CREATE TABLE products_content (
# ... new
DROP TABLE IF EXISTS products_content;
DROP TABLE IF EXISTS xtc_products_content;
CREATE TABLE xtc_products_content (
# ... E017 - end
  content_id int(11) NOT NULL auto_increment,
  products_id int(11) NOT NULL default '0',
  group_ids TEXT,
  content_name varchar(32) NOT NULL default '',
  content_file varchar(64) NOT NULL,
  content_link text NOT NULL,
  languages_id int(11) NOT NULL default '0',
  content_read int(11) NOT NULL default '0',
  file_comment text NOT NULL,
  PRIMARY KEY  (content_id)
);

# ... E017 - begin
# ... old
#DROP TABLE IF EXISTS module_newsletter;
#CREATE TABLE module_newsletter (
# ... new
DROP TABLE IF EXISTS module_newsletter;
DROP TABLE IF EXISTS xtc_module_newsletter;
CREATE TABLE xtc_module_newsletter (
# ... E017 - end
  newsletter_id int(11) NOT NULL auto_increment,
  title text NOT NULL,
  bc text NOT NULL,
  cc text NOT NULL,
  date datetime default NULL,
  status int(1) NOT NULL default '0',
  body text NOT NULL,
  PRIMARY KEY  (newsletter_id)
);

# ... E017 - begin
# ... old
#DROP TABLE if exists cm_file_flags;
#CREATE TABLE cm_file_flags (
# ... new
DROP TABLE if exists cm_file_flags;
DROP TABLE if exists xtc_cm_file_flags;
CREATE TABLE xtc_cm_file_flags (
# ... E017 - end
  file_flag int(11) NOT NULL,
  file_flag_name varchar(32) NOT NULL,
  PRIMARY KEY (file_flag)
);

# ... E017 - begin
# ... old
#DROP TABLE if EXISTS payment_moneybookers_currencies;
#CREATE TABLE payment_moneybookers_currencies (
# ... new
DROP TABLE if EXISTS payment_moneybookers_currencies;
DROP TABLE if EXISTS xtc_payment_moneybookers_currencies;
CREATE TABLE xtc_payment_moneybookers_currencies (
# ... E017 - end
  mb_currID char(3) NOT NULL default '',
  mb_currName varchar(255) NOT NULL default '',
  PRIMARY KEY  (mb_currID)
);

# ... E017 - begin
# ... old
#DROP TABLE if EXISTS payment_moneybookers;
#CREATE TABLE payment_moneybookers (
# ... new
DROP TABLE if EXISTS payment_moneybookers;
DROP TABLE if EXISTS xtc_payment_moneybookers;
CREATE TABLE xtc_payment_moneybookers (
# ... E017 - end
  mb_TRID varchar(255) NOT NULL default '',
  mb_ERRNO smallint(3) unsigned NOT NULL default '0',
  mb_ERRTXT varchar(255) NOT NULL default '',
  mb_DATE datetime NOT NULL default '0000-00-00 00:00:00',
  mb_MBTID bigint(18) unsigned NOT NULL default '0',
  mb_STATUS tinyint(1) NOT NULL default '0',
  mb_ORDERID int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (mb_TRID)
);

# ... E017 - begin
# ... old
#DROP TABLE if EXISTS payment_moneybookers_countries;
#CREATE TABLE payment_moneybookers_countries (
# ... new
DROP TABLE if EXISTS payment_moneybookers_countries;
DROP TABLE if EXISTS xtc_payment_moneybookers_countries;
CREATE TABLE xtc_payment_moneybookers_countries (
# ... E017 - end
  osc_cID int(11) NOT NULL default '0',
  mb_cID char(3) NOT NULL default '',
  PRIMARY KEY  (osc_cID)
);

# ... E017 - begin
# ... old
#DROP TABLE if EXISTS coupon_email_track;
#CREATE TABLE coupon_email_track (
# ... new
DROP TABLE if EXISTS coupon_email_track;
DROP TABLE if EXISTS xtc_coupon_email_track;
CREATE TABLE xtc_coupon_email_track (
# ... E017 - end
  unique_id int(11) NOT NULL auto_increment,
  coupon_id int(11) NOT NULL default '0',
  customer_id_sent int(11) NOT NULL default '0',
  sent_firstname varchar(32) default NULL,
  sent_lastname varchar(32) default NULL,
  emailed_to varchar(32) default NULL,
  date_sent datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (unique_id)
);

# ... E017 - begin
# ... old
#DROP TABLE if EXISTS coupon_gv_customer;
#CREATE TABLE coupon_gv_customer (
# ... new
DROP TABLE if EXISTS coupon_gv_customer;
DROP TABLE if EXISTS xtc_coupon_gv_customer;
CREATE TABLE xtc_coupon_gv_customer (
# ... E017 - end
  customer_id int(5) NOT NULL default '0',
  amount decimal(8,4) NOT NULL default '0.0000',
  PRIMARY KEY  (customer_id),
  KEY customer_id (customer_id)
);

# ... E017 - begin
# ... old
#DROP TABLE if EXISTS coupon_gv_queue;
#CREATE TABLE coupon_gv_queue (
# ... new
DROP TABLE if EXISTS coupon_gv_queue;
DROP TABLE if EXISTS xtc_coupon_gv_queue;
CREATE TABLE xtc_coupon_gv_queue (
# ... E017 - end
  unique_id int(5) NOT NULL auto_increment,
  customer_id int(5) NOT NULL default '0',
  order_id int(5) NOT NULL default '0',
  amount decimal(8,4) NOT NULL default '0.0000',
  date_created datetime NOT NULL default '0000-00-00 00:00:00',
  ipaddr varchar(32) NOT NULL default '',
  release_flag char(1) NOT NULL default 'N',
  PRIMARY KEY  (unique_id),
  KEY uid (unique_id,customer_id,order_id)
);

# ... E017 - begin
# ... old
#DROP TABLE if EXISTS coupon_redeem_track;
#CREATE TABLE coupon_redeem_track (
# ... new
DROP TABLE if EXISTS coupon_redeem_track;
DROP TABLE if EXISTS xtc_coupon_redeem_track;
CREATE TABLE xtc_coupon_redeem_track (
# ... E017 - end
  unique_id int(11) NOT NULL auto_increment,
  coupon_id int(11) NOT NULL default '0',
  customer_id int(11) NOT NULL default '0',
  redeem_date datetime NOT NULL default '0000-00-00 00:00:00',
  redeem_ip varchar(32) NOT NULL default '',
  order_id int(11) NOT NULL default '0',
  PRIMARY KEY  (unique_id)
);

# ... E017 - begin
# ... old
#DROP TABLE if EXISTS coupons;
#CREATE TABLE coupons (
# ... new
DROP TABLE if EXISTS coupons;
DROP TABLE if EXISTS xtc_coupons;
CREATE TABLE xtc_coupons (
# ... E017 - end
  coupon_id int(11) NOT NULL auto_increment,
  coupon_type char(1) NOT NULL default 'F',
  coupon_code varchar(32) NOT NULL default '',
  coupon_amount decimal(8,4) NOT NULL default '0.0000',
  coupon_minimum_order decimal(8,4) NOT NULL default '0.0000',
  coupon_start_date datetime NOT NULL default '0000-00-00 00:00:00',
  coupon_expire_date datetime NOT NULL default '0000-00-00 00:00:00',
  uses_per_coupon int(5) NOT NULL default '1',
  uses_per_user int(5) NOT NULL default '0',
  restrict_to_products varchar(255) default NULL,
  restrict_to_categories varchar(255) default NULL,
  restrict_to_customers text,
  coupon_active char(1) NOT NULL default 'Y',
  date_created datetime NOT NULL default '0000-00-00 00:00:00',
  date_modified datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (coupon_id)
);

# ... E017 - begin
# ... old
#DROP TABLE if EXISTS coupons_description;
#CREATE TABLE coupons_description (
# ... new
DROP TABLE if EXISTS coupons_description;
DROP TABLE if EXISTS xtc_coupons_description;
CREATE TABLE xtc_coupons_description (
# ... E017 - end
  coupon_id int(11) NOT NULL default '0',
  language_id int(11) NOT NULL default '0',
  coupon_name varchar(32) NOT NULL default '',
  coupon_description text,
  KEY coupon_id (coupon_id)
);

DROP TABLE if exists payment_qenta;
# ... E017 - begin
# ... old
#DROP TABLE if exists payment_qenta;
#CREATE TABLE payment_qenta (
# ... new
DROP TABLE if exists xtc_payment_qenta;
CREATE TABLE xtc_payment_qenta (
# ... E017 - end
  q_TRID varchar(255) NOT NULL default '',
  q_DATE datetime NOT NULL default '0000-00-00 00:00:00',
  q_QTID bigint(18) unsigned NOT NULL default '0',
  q_ORDERDESC varchar(255) NOT NULL default '',
  q_STATUS tinyint(1) NOT NULL default '0',
  q_ORDERID int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (q_TRID)
);

DROP TABLE if EXISTS personal_offers_by_customers_status_0;
DROP TABLE if EXISTS personal_offers_by_customers_status_1;
DROP TABLE if EXISTS personal_offers_by_customers_status_2;
DROP TABLE if EXISTS personal_offers_by_customers_status_3;

# ... E017 - begin
DROP TABLE if EXISTS xtc_personal_offers_by_customers_status_0;
DROP TABLE if EXISTS xtc_personal_offers_by_customers_status_1;
DROP TABLE if EXISTS xtc_personal_offers_by_customers_status_2;
DROP TABLE if EXISTS xtc_personal_offers_by_customers_status_3;
# ... E017 - end

#
# ... E017 - INFO: following lines differ from original, no explicit E017-messages...
#

#database Version
INSERT INTO xtc_database_version(version) VALUES ('3.0.4.0');

INSERT INTO xtc_cm_file_flags (file_flag, file_flag_name) VALUES ('0', 'information');
INSERT INTO xtc_cm_file_flags (file_flag, file_flag_name) VALUES ('1', 'content');

# data
# ... E002 - begin
INSERT INTO xtc_shipping_status VALUES (1, 2, '3-4 Tage', '');
INSERT INTO xtc_shipping_status VALUES (2, 2, '1 Woche', '');
INSERT INTO xtc_shipping_status VALUES (3, 2, '2 Wochen', '');

INSERT INTO xtc_content_manager VALUES (6, 0, 0, 'c_all_group,c_0_group,c_1_group,c_2_group,c_3_group,', 2, 'Liefer- und Versandkosten', 'Liefer- und Versandkosten', 'F&uuml;gen Sie hier Ihre Informationen &uuml;ber Liefer- und Versandkosten ein.', 0, 1, '', 1, 1, 0);
INSERT INTO xtc_content_manager VALUES (7, 0, 0, 'c_all_group,c_0_group,c_1_group,c_2_group,c_3_group,', 2, 'Datenschutz', 'Datenschutz', '<h1>Datenschutz</h1><p>Wir freuen uns &uuml;ber Ihr Interesse an unserer Homepage und unserem Unternehmen. F&uuml;r externe Links zu fremden Inhalten k&ouml;nnen wir dabei trotz sorgf&auml;ltiger inhaltlicher Kontrolle keine Haftung &uuml;bernehmen.</p><p>Der Schutz Ihrer personenbezogenen Daten bei der Erhebung, Verarbeitung und Nutzung anl&auml;sslich Ihres Besuchs auf unserer Homepage ist uns ein wichtiges Anliegen. Ihre Daten werden im Rahmen der gesetzlichen Vorschriften gesch&uuml;tzt. Nachfolgend finden Sie Informationen, welche Daten w&auml;hrend Ihres Besuchs auf der Homepage erfasst und wie diese genutzt werden:</p><h2>1. Erhebung und Verarbeitung von Daten</h2><p>Jeder Zugriff auf unsere Homepage und jeder Abruf einer auf der Homepage hinterlegten Datei werden protokolliert. Die Speicherung dient internen systembezogenen und statistischen Zwecken. Protokolliert werden: Name der abgerufenen Datei, Datum und Uhrzeit des Abrufs, &uuml;bertragene Datenmenge, Meldung &uuml;ber erfolgreichen Abruf, Webbrowser und anfragende Domain. Zus&auml;tzlich werden die IP Adressen der anfragenden Rechner protokolliert. Weitergehende personenbezogene Daten werden nur erfasst, wenn Sie diese Angaben freiwillig, etwa im Rahmen einer Anfrage oder Registrierung, machen.</p><h2>2. Nutzung und Weitergabe personenbezogener Daten</h2><p>Soweit Sie uns personenbezogene Daten zur Verf&uuml;gung gestellt haben, verwenden wir diese nur zur Beantwortung Ihrer Anfragen, zur Abwicklung mit Ihnen geschlossener Vertr&auml;ge und f&uuml;r die technische Administration.</p><p>Ihre personenbezogenen Daten werden an Dritte nur weitergegeben oder sonst &uuml;bermittelt, wenn dies zum Zwecke der Vertragsabwicklung - insbesondere Weitergabe von Bestelldaten an Lieferanten - erforderlich ist, dies zu Abrechnungszwecken erforderlich ist oder Sie zuvor eingewilligt haben. Sie haben das Recht, eine erteilte Einwilligung mit Wirkung f&uuml;r die Zukunft jederzeit zu widerrufen.</p><p>Die L&ouml;schung der gespeicherten personenbezogenen Daten erfolgt, wenn Sie Ihre Einwilligung zur Speicherung widerrufen, wenn ihre Kenntnis zur Erf&uuml;llung des mit der Speicherung verfolgten Zwecks nicht mehr erforderlich ist oder wenn ihre Speicherung aus sonstigen gesetzlichen Gr&uuml;nden unzul&auml;ssig ist.</p><h2>3. Einsatz von Cookies</h2><p>Wir setzen Cookies - kleine Dateien mit Konfigurationsinformationen - ein. Sie helfen dabei, benutzerindividuelle Einstellungen zu ermitteln und spezielle Benutzerfunktionen zu realisieren. Wir erfassen keine personenbezogenen Daten &uuml;ber Cookies. S&auml;mtliche Funktionen der Website sind auch ohne Cookies einsetzbar, einige benutzerdefinierte Eigenschaften und Einstellungen sind dann allerdings nicht verf&uuml;gbar.</p><h2>4. Auskunftsrecht</h2><p>Sie haben jederzeit das Recht auf Auskunft &uuml;ber die bez&uuml;glich Ihrer Person gespeicherten Daten, deren Herkunft und Empf&auml;nger sowie den Zweck der Datenverarbeitung. Auskunft &uuml;ber die gespeicherten Daten gibt der Webmaster.</p><h2>Sicherheitshinweis:</h2><p>Wir sind bem&uuml;ht, Ihre personenbezogenen Daten durch Ergreifung aller technischen und organisatorischen M&ouml;glichkeiten so zu speichern, dass sie f&uuml;r Dritte nicht zug&auml;nglich sind. Bei der Kommunikation per E-Mail kann die vollst&auml;ndige Datensicherheit von uns nicht gew&auml;hrleistet werden, so dass wir Ihnen bei vertraulichen Informationen den Postweg empfehlen.</p>', 0, 1, '', 1, 2, 0);
INSERT INTO xtc_content_manager VALUES (8, 0, 0, 'c_all_group,c_0_group,c_1_group,c_2_group,c_3_group,', 2, 'Unsere AGB\'s', 'Allgemeine Gesch&auml;ftsbedingungen', '<h1>Allgemeine Gesch&auml;ftsbedingungen</h1>
<h2>&sect; 1 Geltungsbereich, Kundeninformationen</h2><p>Die folgenden Allgemeinen Gesch&auml;ftsbedingungen (AGB) regeln das Vertragsverh&auml;ltnis zwischen<br />
SHOPNAME,<br />
VORNAME NACHNAME,<br />
ADRESSE<br />
USt.-IdNr (falls Vorhanden)<br />
TELEFON<br />
EMAIL<br />
und Verbrauchern, die &uuml;ber unseren Shop Waren kaufen. Diese AGB beinhalten weiterhin Kundeninformationen nach der BGB-Infoverordnung. Die Vertragssprache ist Deutsch.</p>
<h2>&sect; 2 Vertragsschluss</h2><p>Die Angebote im Internet stellen eine unverbindliche Aufforderung an Sie dar, Waren zu bestellen.</p><p>Nach Eingabe Ihrer Daten und mit dem Anklicken des Bestellbuttons geben Sie ein verbindliches Angebot auf Abschluss eines Kaufvertrags ab.</p><p>Wir sind berechtigt, Ihr Angebot innerhalb von 3 Tagen unter Zusendung einer Auftragsbest&auml;tigung per E-Mail anzunehmen. Nach fruchtlosem Ablauf der in Satz 1 genannten Frist gilt Ihr Angebot als abgelehnt, d.h. Sie sind nicht l&auml;nger an Ihr Angebot gebunden.</p>
<h2>&sect; 3 Kundeninformation: Speicherung des Angebotstextes</h2><p>Der Vertragstext mit Angaben zum Artikel wird von uns gespeichert. Sie haben &uuml;ber das Internet keinen Zugriff auf den Vertragstext.</p>
<h2>&sect; 4 Kundeninformation: Korrekturhinweis</h2><p>Sie k&ouml;nnen Ihre Eingaben vor Abgabe der Bestellung jederzeit berichtigen. Wir informieren Sie auf dem Weg durch den Bestellprozess &uuml;ber Ihre Korrekturm&ouml;glichkeiten.</p>
<h2>&sect; 5 Widerrufsbelehrung, Widerrufsrecht</h2><p>Sie k&ouml;nnen Ihre Vertragserkl&auml;rung innerhalb von zwei Wochen ohne Angabe von Gr&uuml;nden in Textform (z.B. Brief, Fax, E-Mail) oder - wenn Ihnen die Sache vor Fristablauf &uuml;berlassen wird - durch R&uuml;cksendung der Sache widerrufen. Die Frist beginnt nach Erhalt dieser Belehrung in Textform, jedoch nicht vor Eingang der Ware beim Empf&auml;nger (bei wiederkehrender Lieferung gleichartiger Waren nicht vor Eingang der ersten Teillieferung) und auch nicht vor Erf&uuml;llung unserer Informationspflichten gem&auml;&szlig; &sect; 312c Abs. 2 BGB in Verbindung mit &sect; 1 Abs. 1, 2 und 4 BGB-InfoV sowie unserer Pflichten gem&auml;&szlig; &sect; 312e Abs. 1 Satz 1 BGB in Verbindung mit &sect; 3 BGB-InfoV. Zur Wahrung der Widerrufsfrist gen&uuml;gt die rechtzeitige Absendung des Widerrufs oder der Ware. Der Widerruf ist zu richten an:</p>
<p>Musterh&auml;ndler GmbH [Name/Firma]<br />
Gesch&auml;ftsf&uuml;hrer: Max Mustermann [Gesetzlicher Vertreter]<br />
Musterstra&szlig;e 1a, 12345 Musterhausen [Ladungsf&auml;hige Anschrift (kein Postfach!)]<br />
max.mustermann@xyz.de [E-Mail-Adresse]<br />
Fax 01234 / 567 890<br />
[keine Telefonnummer!]</p>
<h2>&sect; 6 Widerrufsfolgen</h2><p>Im Falle eines wirksamen Widerrufs sind die beiderseits empfangenen Leistungen zur&uuml;ckzugew&auml;hren und gegebenenfalls gezogene Nutzungen (z.B. Zinsen) herauszugeben. K&ouml;nnen Sie uns die empfangene Leistung ganz oder teilweise nicht oder nur in verschlechtertem Zustand zur&uuml;ckgew&auml;hren, m&uuml;ssen Sie uns insoweit ggf. Wertersatz leisten. Bei der &Uuml;berlassung von Sachen gilt dies nicht, wenn die Verschlechterung der Sache ausschlie&szlig;lich auf deren Pr&uuml;fung - wie sie Ihnen etwa im Ladengesch&auml;ft m&ouml;glich gewesen w&auml;re - zur&uuml;ckzuf&uuml;hren ist. Im &Uuml;brigen k&ouml;nnen Sie die Pflicht zum Wertersatz f&uuml;r eine durch die bestimmungsgem&auml;&szlig;e Ingebrauchnahme der Sache entstandene Verschlechterung vermeiden, indem Sie die Ware nicht wie ihr Eigentum in Gebrauch nehmen und alles unterlassen, was deren Wert beeintr&auml;chtigt. Paketversandf&auml;hige Sachen sind auf unsere Gefahr zur&uuml;ckzusenden. Sie haben die Kosten der R&uuml;cksendung zu tragen, wenn die gelieferte Ware der bestellten entspricht und wenn der Preis der zur&uuml;ckzusendenden Ware einen Betrag von 40,- Euro nicht &uuml;bersteigt oder wenn Sie bei einem h&ouml;heren Preis des Kaufgegenstands zum Zeitpunkt des Widerrufs noch nicht die Gegenleistung oder eine vertraglich vereinbarte Teilzahlung erbracht haben. Anderenfalls ist die R&uuml;cksendung f&uuml;r Sie kostenfrei. Nicht paketversandf&auml;hige Sachen werden bei Ihnen abgeholt. Verpflichtungen zur Erstattung von Zahlungen m&uuml;ssen innerhalb von 30 Tagen erf&uuml;llt werden. Die Frist beginnt f&uuml;r Sie mit der Absendung der Widerrufserkl&auml;rung oder der Sache, f&uuml;r uns mit deren Empfang.</p>
<h2>&sect; 7 R&uuml;cksendekosten</h2><p>Macht der Verbraucher von seinem Widerrufsrecht nach Ziffer 6 der AGB Gebrauch, so hat er die regelm&auml;&szlig;igen Kosten f&uuml;r die R&uuml;cksendung der Ware zu tragen, wenn die gelieferte Ware der bestellten entspricht, und wenn der Preis der zur&uuml;ckzusendenden Sache einen Betrag von 40 Euro nicht &uuml;bersteigt, oder wenn bei einem h&ouml;heren Preis der Sache der Verbraucher die Gegenleistung oder eine vertraglich vereinbarte Teilzahlung noch nicht erbracht hat.</p><p>Regelm&auml;&szlig;ige Kosten in diesem Sinne sind allein die Kosten der gew&ouml;hnlichen Paketversendung. Etwaige Mehrkosten durch die Versendung zu einem anderen Ort als zu unserem Firmensitz im Zeitpunkt Ihrer Bestellung oder durch die Einschaltung eines Abholdienstes durch uns haben Sie nicht zu tragen.</p>
<h2>&sect; 8 Eigentumsvorbehalt</h2><p>Der Kaufgegenstand bleibt bis zur vollst&auml;ndigen Bezahlung unser Eigentum.</p>
<h2>&sect; 9 Verj&auml;hrung Ihrer Gew&auml;hrleistungsanspr&uuml;che</h2><p>Ihre Anspr&uuml;che wegen M&auml;ngeln bei gebrauchten Sachen verj&auml;hren in einem Jahr ab &Uuml;bergabe der verkauften Sache an Sie. Von dieser Regelung ausgenommen sind Schadensersatzanspr&uuml;che, Anspr&uuml;che wegen M&auml;ngeln, die wir arglistig verschwiegen, und Anspr&uuml;che aus einer Garantie, die wir f&uuml;r die Beschaffenheit der Sache &uuml;bernommen haben. F&uuml;r diese ausgenommenen Anspr&uuml;che gelten die gesetzlichen Verj&auml;hrungsfristen.</p>
<h2>&sect; 10 Haftungsbeschr&auml;nkung</h2><p>Wir schlie&szlig;en die Haftung f&uuml;r leicht fahrl&auml;ssige Pflichtverletzungen aus, sofern diese keine vertragswesentlichen Pflichten, Sch&auml;den aus der Verletzung des Lebens, des K&ouml;rpers oder der Gesundheit oder Garantien betreffen oder Anspr&uuml;che nach dem Produkthaftungsgesetz ber&uuml;hrt sind. Gleiches gilt f&uuml;r Pflichtverletzungen unserer Erf&uuml;llungsgehilfen und unserer gesetzlichen Vertreter. Zu den vertragswesentlichen Pflichten geh&ouml;rt insbesondere die Pflicht, Ihnen die Sache zu &uuml;bergeben und Ihnen das Eigentum daran zu verschaffen. Weiterhin haben wir Ihnen die Sache frei von Sach- und Rechtsm&auml;ngeln zu verschaffen.</p><p>[DATUM]</p>', 0, 1, '', 1, 3, 0);
INSERT INTO xtc_content_manager VALUES (9, 0, 0, 'c_all_group,c_0_group,c_1_group,c_2_group,c_3_group,', 2, 'Impressum', 'Impressum', 'F&uuml;gen Sie hier Ihr Impressum ein.<br /><br />DemoShop GmbH<br />Gesch&auml;ftsf&uuml;hrer: Max Muster und Fritz Beispiel<br /><br />Max Muster Stra&szlig;e 21-23<br />D-0815 Musterhausen<br />E-Mail: max.muster@muster.de<br /><br />HRB 123456<br />Amtsgericht Musterhausen<br />UStid-Nr. DE 000 111 222', 0, 1, '', 1, 4, 0);
INSERT INTO xtc_content_manager VALUES (10, 0, 0, 'c_all_group,c_0_group,c_1_group,c_2_group,c_3_group,', 2, 'Home', 'Home', '<p>{$greeting}<br /><br />Dies ist die Standardinstallation des <strong>snet-Shop (c) by stimme.net</strong>. Alle dargestellten Produkte dienen zur Demonstration der Funktionsweise. Wenn Sie Produkte bestellen, so werden diese weder ausgeliefert, noch in Rechnung gestellt. Alle Informationen zu den verschiedenen Produkten sind erfunden und daher kann kein Anspruch daraus abgeleitet werden.<br /><br />Der hier dargestellte Text kann im AdminInterface unter dem Punkt <strong>Content Manager</strong> - Eintrag <strong>Home</strong> bearbeitet werden.</p>', 0, 1, '', 0, 5, 0);
INSERT INTO xtc_content_manager VALUES (11, 0, 0, 'c_all_group,c_0_group,c_1_group,c_2_group,c_3_group,', 2, 'Gutscheine', 'Gutscheine - Fragen und Antworte', '<table cellSpacing=0 cellPadding=0>\r\n<tbody>\r\n<tr>\r\n<td class=main><STRONG>Gutscheine kaufen </STRONG></td></tr>\r\n<tr>\r\n<td class=main>Gutscheine k�nnen, falls sie im Shop angeboten werden, wie normale Artikel gekauft werden. Sobald Sie einen Gutschein gekauft haben und dieser nach erfolgreicher Zahlung freigeschaltet wurde, erscheint der Betrag unter Ihrem Warenkorb. Nun k�nnen Sie �ber den Link " Gutschein versenden " den gew�nschten Betrag per E-Mail versenden. </td></tr></tbody></table>\r\n<table cellSpacing=0 cellPadding=0>\r\n<tbody>\r\n<tr>\r\n<td class=main><STRONG>Wie man Gutscheine versendet </STRONG></td></tr>\r\n<tr>\r\n<td class=main>Um einen Gutschein zu versenden, klicken Sie bitte auf den Link "Gutschein versenden" in Ihrem Einkaufskorb. Um einen Gutschein zu versenden, ben�tigen wir folgende Angaben von Ihnen: Vor- und Nachname des Empf�ngers. Eine g�ltige E-Mail Adresse des Empf�ngers. Den gew�nschten Betrag (Sie k�nnen auch Teilbetr�ge Ihres Guthabens versenden). Eine kurze Nachricht an den Empf�nger. Bitte �berpr�fen Sie Ihre Angaben noch einmal vor dem Versenden. Sie haben vor dem Versenden jederzeit die M�glichkeit Ihre Angaben zu korrigieren. </td></tr></tbody></table>\r\n<table cellSpacing=0 cellPadding=0>\r\n<tbody>\r\n<tr>\r\n<td class=main><STRONG>Mit Gutscheinen Einkaufen. </STRONG></td></tr>\r\n<tr>\r\n<td class=main>Sobald Sie �ber ein Guthaben verf�gen, k�nnen Sie dieses zum Bezahlen Ihrer Bestellung verwenden. W�hrend des Bestellvorganges haben Sie die M�glichkeit Ihr Guthaben einzul�sen. Falls das Guthaben unter dem Warenwert liegt m�ssen Sie Ihre bevorzugte Zahlungsweise f�r den Differenzbetrag w�hlen. �bersteigt Ihr Guthaben den Warenwert, steht Ihnen das Restguthaben selbstverst�ndlich f�r Ihre n�chste Bestellung zur Verf�gung. </td></tr></tbody></table>\r\n<table cellSpacing=0 cellPadding=0>\r\n<tbody>\r\n<tr>\r\n<td class=main><STRONG>Gutscheine verbuchen. </STRONG></td></tr>\r\n<tr>\r\n<td class=main>Wenn Sie einen Gutschein per E-Mail erhalten haben, k�nnen Sie den Betrag wie folgt verbuchen:. <br />1. Klicken Sie auf den in der E-Mail angegebenen Link. Falls Sie noch nicht �ber ein pers�nliches Kundenkonto verf�gen, haben Sie die M�glichkeit ein Konto zu er�ffnen. <br />2. Nachdem Sie ein Produkt in den Warenkorb gelegt haben, k�nnen Sie dort Ihren Gutscheincode eingeben.</td></tr></tbody></table>\r\n<table cellSpacing=0 cellPadding=0>\r\n<tbody>\r\n<tr>\r\n<td class=main><STRONG>Falls es zu Problemen kommen sollte: </STRONG></td></tr>\r\n<tr>\r\n<td class=main>Falls es wider Erwarten zu Problemen mit einem Gutschein kommen sollte, kontaktieren Sie uns bitte per E-Mail : you@yourdomain.com. Bitte beschreiben Sie m�glichst genau das Problem, wichtige Angaben sind unter anderem: Ihre Kundennummer, der Gutscheincode, Fehlermeldungen des Systems sowie der von Ihnen benutzte Browser. </td></tr></tbody></table>', 0, 1, '', 0, 6, 1);
INSERT INTO xtc_content_manager VALUES (13, 0, 0, 'c_all_group,c_0_group,c_1_group,c_2_group,c_3_group,', 2, 'Kontakt', 'Kontakt', '<p>Ihre Kontaktinformationen</p>', 0, 1, '', 1, 7, 0);
INSERT INTO xtc_content_manager VALUES (16, 0, 0, 'c_all_group,c_0_group,c_1_group,c_2_group,c_3_group,', 2, 'Sitemap', '', '', 0, 0, 'sitemap.php', 1, 8, 0);
# ... E002 - end

# ... E014 - begin
# ... to follow
# ... E014 - end

# 1 - Default, 2 - USA, 3 - Spain, 4 - Singapore, 5 - Germany
INSERT INTO xtc_address_format VALUES (1, '$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country','$city / $country');
INSERT INTO xtc_address_format VALUES (2, '$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country','$city, $state / $country');
INSERT INTO xtc_address_format VALUES (3, '$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country','$state / $country');
INSERT INTO xtc_address_format VALUES (4, '$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country', '$postcode / $country');
INSERT INTO xtc_address_format VALUES (5, '$firstname $lastname$cr$streets$cr$postcode $city$cr$country','$city / $country');

INSERT INTO xtc_admin_access VALUES ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,1,1);
INSERT INTO xtc_admin_access VALUES ( 'groups', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 2, 4, 2, 2, 2, 2, 5, 5, 5, 5, 5, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1,1,1);

# configuration_group_id 1
# ... E002 - begin
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'STORE_NAME', 'snet-Shop',  1, 1, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'STORE_OWNER', 'snet-Shop', 1, 2, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'STORE_OWNER_EMAIL_ADDRESS', 'shop@stimme.net', 1, 3, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'EMAIL_FROM', 'snet-Shop <shop@stimme.net>',  1, 4, NULL, '', NULL, NULL);
# ... E002 - end
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'STORE_COUNTRY', '81',  1, 6, NULL, '', 'xtc_get_country_name', 'xtc_cfg_pull_down_country_list(');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'STORE_ZONE', '', 1, 7, NULL, '', 'xtc_cfg_get_zone_name', 'xtc_cfg_pull_down_zone_list(');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'EXPECTED_PRODUCTS_SORT', 'desc',  1, 8, NULL, '', NULL, 'xtc_cfg_select_option(array(\'asc\', \'desc\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'EXPECTED_PRODUCTS_FIELD', 'date_expected',  1, 9, NULL, '', NULL, 'xtc_cfg_select_option(array(\'products_name\', \'date_expected\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 1, 10, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false',  16, 12, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'DISPLAY_CART', 'true',  1, 13, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 1, 15, NULL, '', NULL, 'xtc_cfg_select_option(array(\'and\', \'or\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'STORE_NAME_ADDRESS', 'Store Name\nAddress\nCountry\nPhone',  1, 16, NULL, '', NULL, 'xtc_cfg_textarea(');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SHOW_COUNTS', 'false',  1, 17, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'DEFAULT_CUSTOMERS_STATUS_ID_ADMIN', '0',  1, 20, NULL, '', 'xtc_get_customers_status_name', 'xtc_cfg_pull_down_customers_status_list(');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'DEFAULT_CUSTOMERS_STATUS_ID_GUEST', '1',  1, 21, NULL, '', 'xtc_get_customers_status_name', 'xtc_cfg_pull_down_customers_status_list(');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'DEFAULT_CUSTOMERS_STATUS_ID', '2',  1, 23, NULL, '', 'xtc_get_customers_status_name', 'xtc_cfg_pull_down_customers_status_list(');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ALLOW_ADD_TO_CART', 'false',  1, 24, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'CURRENT_TEMPLATE', 'yaml_snet', 1, 26, NULL, '', NULL, 'xtc_cfg_pull_down_template_sets(');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'PRICE_IS_BRUTTO', 'false', 1, 27, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'PRICE_PRECISION', '4', 1, 28, NULL, '', NULL, '');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'CC_KEYCHAIN', 'changeme', 1, 29, NULL, '', NULL, '');
# ... E010 - begin
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'TAX_DECIMAL_PLACES', '2', 1, 30, NULL, '', NULL, '');
# ... E010 - end

# configuration_group_id 2
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2',  2, 1, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ENTRY_LAST_NAME_MIN_LENGTH', '2',  2, 2, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ENTRY_DOB_MIN_LENGTH', '10',  2, 3, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6',  2, 4, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5',  2, 5, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ENTRY_COMPANY_MIN_LENGTH', '2',  2, 6, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ENTRY_POSTCODE_MIN_LENGTH', '4',  2, 7, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ENTRY_CITY_MIN_LENGTH', '3',  2, 8, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ENTRY_STATE_MIN_LENGTH', '2', 2, 9, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ENTRY_TELEPHONE_MIN_LENGTH', '3',  2, 10, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ENTRY_PASSWORD_MIN_LENGTH', '5',  2, 11, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'CC_OWNER_MIN_LENGTH', '3',  2, 12, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'CC_NUMBER_MIN_LENGTH', '10',  2, 13, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'REVIEW_TEXT_MIN_LENGTH', '50',  2, 14, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MIN_DISPLAY_BESTSELLERS', '1',  2, 15, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 2, 16, NULL, '', NULL, NULL);

# configuration_group_id 3
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MAX_ADDRESS_BOOK_ENTRIES', '5',  3, 1, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MAX_DISPLAY_SEARCH_RESULTS', '20',  3, 2, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MAX_DISPLAY_PAGE_LINKS', '5',  3, 3, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '9', 3, 4, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MAX_DISPLAY_NEW_PRODUCTS', '9',  3, 5, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10',  3, 6, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MAX_DISPLAY_MANUFACTURERS_IN_A_LIST', '0', 3, 7, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MAX_MANUFACTURERS_LIST', '1',  3, 7, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15',  3, 8, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MAX_DISPLAY_NEW_REVIEWS', '6', 3, 9, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MAX_RANDOM_SELECT_REVIEWS', '10',  3, 10, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MAX_RANDOM_SELECT_NEW', '10',  3, 11, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MAX_RANDOM_SELECT_SPECIALS', '10',  3, 12, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3',  3, 13, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MAX_DISPLAY_PRODUCTS_NEW', '10',  3, 14, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MAX_DISPLAY_BESTSELLERS', '10',  3, 15, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MAX_DISPLAY_ALSO_PURCHASED', '6',  3, 16, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6',  3, 17, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MAX_DISPLAY_ORDER_HISTORY', '10',  3, 18, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'PRODUCT_REVIEWS_VIEW', '5',  3, 19, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MAX_PRODUCTS_QTY', '1000', 3, 21, 'NULL', '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MAX_DISPLAY_NEW_PRODUCTS_DAYS', '30', 3, 22, 'NULL', '', NULL, NULL);

# configuration_group_id 4
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 4, 1, NULL, '0000-00-00 00:00:00', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'IMAGE_QUALITY', '80', 4, 2, '2003-12-15 12:10:45', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_THUMBNAIL_WIDTH', '120', 4, 7, '2003-12-15 12:10:45', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_THUMBNAIL_HEIGHT', '80', 4, 8, NULL, '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_INFO_WIDTH', '200', 4, 9, NULL, '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_INFO_HEIGHT', '160', 4, 10, NULL, '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_POPUP_WIDTH', '300', 4, 11, '2003-12-15 12:11:00', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_POPUP_HEIGHT', '240', 4, 12, '2003-12-15 12:11:09', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_THUMBNAIL_BEVEL', '', 4, 13, '2003-12-15 13:14:39', '0000-00-00 00:00:00', '', '');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_THUMBNAIL_GREYSCALE', '', 4, 14, '2003-12-15 13:13:37', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_THUMBNAIL_ELLIPSE', '', 4, 15, '2003-12-15 13:14:57', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_THUMBNAIL_ROUND_EDGES', '', 4, 16, '2003-12-15 13:19:45', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_THUMBNAIL_MERGE', '', 4, 17, '2003-12-15 12:01:43', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_THUMBNAIL_FRAME', '(FFFFFF,000000,3,EEEEEE)', 4, 18, '2003-12-15 13:19:37', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_THUMBNAIL_DROP_SHADDOW', '', 4, 19, '2003-12-15 13:15:14', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_THUMBNAIL_MOTION_BLUR', '(4,FFFFFF)', 4, 20, '2003-12-15 12:02:19', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_INFO_BEVEL', '', 4, 21, '2003-12-15 13:42:09', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_INFO_GREYSCALE', '', 4, 22, '2003-12-15 13:18:00', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_INFO_ELLIPSE', '', 4, 23, '2003-12-15 13:41:53', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_INFO_ROUND_EDGES', '', 4, 24, '2003-12-15 13:21:55', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_INFO_MERGE', '(overlay.gif,10,-50,60,FF0000)', 4, 25, NULL, '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_INFO_FRAME', '(FFFFFF,000000,3,EEEEEE)', 4, 26, NULL, '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_INFO_DROP_SHADDOW', '(3,333333,FFFFFF)', 4, 27, NULL, '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_INFO_MOTION_BLUR', '', 4, 28, '2003-12-15 13:21:18', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_POPUP_BEVEL', '(8,FFCCCC,330000)', 4, 29, NULL, '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_POPUP_GREYSCALE', '', 4, 30, '2003-12-15 13:22:58', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_POPUP_ELLIPSE', '', 4, 31, '2003-12-15 13:22:51', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_POPUP_ROUND_EDGES', '', 4, 32, '2003-12-15 13:23:17', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_POPUP_MERGE', '(overlay.gif,10,-50,60,FF0000)', 4, 33, NULL, '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_POPUP_FRAME', '', 4, 34, '2003-12-15 13:22:43', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_POPUP_DROP_SHADDOW', '', 4, 35, '2003-12-15 13:22:26', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'PRODUCT_IMAGE_POPUP_MOTION_BLUR', '', 4, 36, '2003-12-15 13:22:32', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'MO_PICS', '0', 4, 3, '', '0000-00-00 00:00:00', NULL , NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'IMAGE_MANIPULATOR', 'image_manipulator_GD2.php', 4, 3, '', '0000-00-00 00:00:00', NULL , 'xtc_cfg_select_option(array(\'image_manipulator_GD2.php\', \'image_manipulator_GD1.php\'),');

# configuration_group_id 5
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ACCOUNT_GENDER', 'true',  5, 1, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ACCOUNT_DOB', 'true',  5, 2, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ACCOUNT_COMPANY', 'true',  5, 3, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ACCOUNT_SUBURB', 'true', 5, 4, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ACCOUNT_STATE', 'true',  5, 5, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ACCOUNT_OPTIONS', 'account',  5, 6, NULL, '', NULL, 'xtc_cfg_select_option(array(\'account\', \'guest\', \'both\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'DELETE_GUEST_ACCOUNT', 'true',  5, 7, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');

# configuration_group_id 6
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MODULE_PAYMENT_INSTALLED', '', 6, 0, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_shipping.php;ot_tax.php;ot_total.php', 6, 0, '2003-07-18 03:31:55', '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MODULE_SHIPPING_INSTALLED', '',  6, 0, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'DEFAULT_CURRENCY', 'EUR',  6, 0, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'DEFAULT_LANGUAGE', 'de',  6, 0, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'DEFAULT_ORDERS_STATUS_ID', '1',  6, 0, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'DEFAULT_PRODUCTS_VPE_ID', '',  6, 0, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'DEFAULT_SHIPPING_STATUS_ID', '1',  6, 0, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true',  6, 1, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '30',  6, 2, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 6, 3, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50',  6, 4, NULL, '', 'currencies->format', NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 6, 5, NULL, '', NULL, 'xtc_cfg_select_option(array(\'national\', \'international\', \'both\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true',  6, 1, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '10',  6, 2, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true',  6, 1, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '50',  6, 2, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true',  6, 1, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '99',  6, 2, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MODULE_ORDER_TOTAL_DISCOUNT_STATUS', 'true',  6, 1, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MODULE_ORDER_TOTAL_DISCOUNT_SORT_ORDER', '20', 6, 2, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MODULE_ORDER_TOTAL_SUBTOTAL_NO_TAX_STATUS', 'true',  6, 1, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'MODULE_ORDER_TOTAL_SUBTOTAL_NO_TAX_SORT_ORDER','40',  6, 2, NULL, '', NULL, NULL);

# configuration_group_id 7
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SHIPPING_ORIGIN_COUNTRY', '81',  7, 1, NULL, '', 'xtc_get_country_name', 'xtc_cfg_pull_down_country_list(');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SHIPPING_ORIGIN_ZIP', '',  7, 2, NULL, '', NULL, NULL);
# ... E002 - begin
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SHIPPING_MAX_WEIGHT', '1000',  7, 3, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SHIPPING_BOX_WEIGHT', '0',  7, 4, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SHIPPING_BOX_PADDING', '0',  7, 5, NULL, '', NULL, NULL);
# ... E002 - end
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SHOW_SHIPPING', 'true',  7, 6, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SHIPPING_INFOS', '1',  7, 5, NULL, '', NULL, NULL);

# configuration_group_id 8
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'PRODUCT_LIST_FILTER', '1', 8, 1, NULL, '', NULL, NULL);

# configuration_group_id 9
# ... E002 - begin
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'STOCK_CHECK', 'false',  9, 1, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ATTRIBUTE_STOCK_CHECK', 'false',  9, 2, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'STOCK_LIMITED', 'false', 9, 3, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'STOCK_ALLOW_CHECKOUT', 'true',  9, 4, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '',  9, 5, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'STOCK_REORDER_LEVEL', '',  9, 6, NULL, '', NULL, NULL);
# ... E002 - end

# configuration_group_id 10
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'STORE_PAGE_PARSE_TIME', 'false',  10, 1, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'STORE_PAGE_PARSE_TIME_LOG', '/var/log/www/tep/page_parse_time.log',  10, 2, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 10, 3, NULL, '', NULL, NULL);
# ... E002 - begin
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'DISPLAY_PAGE_PARSE_TIME', 'false',  10, 4, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
# ... E002 - end
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'STORE_DB_TRANSACTIONS', 'false',  10, 5, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');

# configuration_group_id 11
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'USE_CACHE', 'false',  11, 1, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'DIR_FS_CACHE', 'cache',  11, 2, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'CACHE_LIFETIME', '3600',  11, 3, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'CACHE_CHECK', 'true',  11, 4, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'DB_CACHE', 'false',  11, 5, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'DB_CACHE_EXPIRE', '3600',  11, 6, NULL, '', NULL, NULL);

# configuration_group_id 12
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'EMAIL_TRANSPORT', 'mail',  12, 1, NULL, '', NULL, 'xtc_cfg_select_option(array(\'sendmail\', \'smtp\', \'mail\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SENDMAIL_PATH', '/usr/sbin/sendmail', 12, 2, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SMTP_MAIN_SERVER', 'localhost', 12, 3, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SMTP_Backup_Server', 'localhost', 12, 4, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SMTP_PORT', '25', 12, 5, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SMTP_USERNAME', 'Please Enter', 12, 6, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SMTP_PASSWORD', 'Please Enter', 12, 7, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SMTP_AUTH', 'false', 12, 8, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'EMAIL_LINEFEED', 'LF',  12, 9, NULL, '', NULL, 'xtc_cfg_select_option(array(\'LF\', \'CRLF\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'EMAIL_USE_HTML', 'true',  12, 10, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false',  12, 11, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SEND_EMAILS', 'true',  12, 12, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');

# Constants for contact_us
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'CONTACT_US_EMAIL_ADDRESS', 'contact@your-shop.com', 12, 20, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'CONTACT_US_NAME', 'Mail send by Contact_us Form',  12, 21, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'CONTACT_US_REPLY_ADDRESS',  '', 12, 22, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'CONTACT_US_REPLY_ADDRESS_NAME',  '', 12, 23, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'CONTACT_US_EMAIL_SUBJECT',  '', 12, 24, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'CONTACT_US_FORWARDING_STRING',  '', 12, 25, NULL, '', NULL, NULL);

# Constants for support system
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'EMAIL_SUPPORT_ADDRESS', 'support@your-shop.com', 12, 26, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'EMAIL_SUPPORT_NAME', 'Mail send by support systems',  12, 27, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'EMAIL_SUPPORT_REPLY_ADDRESS',  '', 12, 28, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'EMAIL_SUPPORT_REPLY_ADDRESS_NAME',  '', 12, 29, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'EMAIL_SUPPORT_SUBJECT',  '', 12, 30, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'EMAIL_SUPPORT_FORWARDING_STRING',  '', 12, 31, NULL, '', NULL, NULL);

# Constants for billing system
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'EMAIL_BILLING_ADDRESS', 'billing@your-shop.com', 12, 32, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'EMAIL_BILLING_NAME', 'Mail send by billing systems',  12, 33, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'EMAIL_BILLING_REPLY_ADDRESS',  '', 12, 34, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'EMAIL_BILLING_REPLY_ADDRESS_NAME',  '', 12, 35, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'EMAIL_BILLING_SUBJECT',  '', 12, 36, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'EMAIL_BILLING_FORWARDING_STRING',  '', 12, 37, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'EMAIL_BILLING_SUBJECT_ORDER',  'Your order Nr:{$nr} / {$date}', 12, 38, NULL, '', NULL, NULL);

# configuration_group_id 13
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'DOWNLOAD_ENABLED', 'false',  13, 1, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'DOWNLOAD_BY_REDIRECT', 'false',  13, 2, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'DOWNLOAD_UNALLOWED_PAYMENT', 'banktransfer,cod,invoice,moneyorder',  13, 5, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'DOWNLOAD_MIN_ORDERS_STATUS', '1',  13, 5, NULL, '', NULL, NULL);


# configuration_group_id 14
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'GZIP_COMPRESSION', 'false',  14, 1, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'GZIP_LEVEL', '5',  14, 2, NULL, '', NULL, NULL);

# configuration_group_id 15
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SESSION_WRITE_DIRECTORY', '/tmp',  15, 1, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SESSION_FORCE_COOKIE_USE', 'False',  15, 2, NULL, '', NULL, 'xtc_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SESSION_CHECK_SSL_SESSION_ID', 'False',  15, 3, NULL, '', NULL, 'xtc_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SESSION_CHECK_USER_AGENT', 'False',  15, 4, NULL, '', NULL, 'xtc_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SESSION_CHECK_IP_ADDRESS', 'False',  15, 5, NULL, '', NULL, 'xtc_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SESSION_RECREATE', 'False',  15, 7, NULL, '', NULL, 'xtc_cfg_select_option(array(\'True\', \'False\'),');

# configuration_group_id 16
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'META_MIN_KEYWORD_LENGTH', '6', 16, 2, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'META_KEYWORDS_NUMBER', '5',  16, 3, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'META_AUTHOR', '',  16, 4, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'META_PUBLISHER', '',  16, 5, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'META_COMPANY', '',  16, 6, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'META_TOPIC', 'shopping',  16, 7, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'META_REPLY_TO', 'xx@xx.com',  16, 8, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'META_REVISIT_AFTER', '14',  16, 9, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'META_ROBOTS', 'index,follow',  16, 10, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'META_DESCRIPTION', '',  16, 11, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'META_KEYWORDS', '',  16, 12, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'CHECK_CLIENT_AGENT', 'true',16, 13, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');

# configuration_group_id 17
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'USE_WYSIWYG', 'true', 17, 1, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ACTIVATE_GIFT_SYSTEM', 'false', 17, 2, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SECURITY_CODE_LENGTH', '10', 17, 3, NULL, '2003-12-05 05:01:41', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'NEW_SIGNUP_GIFT_VOUCHER_AMOUNT', '0', 17, 4, NULL, '2003-12-05 05:01:41', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'NEW_SIGNUP_DISCOUNT_COUPON', '', 17, 5, NULL, '2003-12-05 05:01:41', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ACTIVATE_SHIPPING_STATUS', 'true', 17, 6, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'DISPLAY_CONDITIONS_ON_CHECKOUT', 'true',17, 7, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'SHOW_IP_LOG', 'false',17, 8, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
# ... E002 - begin
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'GROUP_CHECK', 'true',  17, 9, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
# ... E002 - end
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ACTIVATE_NAVIGATOR', 'false',  17, 10, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'QUICKLINK_ACTIVATED', 'true',  17, 11, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ACTIVATE_REVERSE_CROSS_SELLING', 'true', 17, 12, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'DISPLAY_REVOCATION_ON_CHECKOUT', 'true', 17, 13, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'REVOCATION_ID', '', 17, 14, NULL, '2003-12-05 05:01:41', NULL, NULL);


#configuration_group_id 18
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ACCOUNT_COMPANY_VAT_CHECK', 'true', 18, 4, '', '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'STORE_OWNER_VAT_ID', '', 18, 3, '', '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'DEFAULT_CUSTOMERS_VAT_STATUS_ID', '1', 18, 23, '', '', 'xtc_get_customers_status_name', 'xtc_cfg_pull_down_customers_status_list(');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ACCOUNT_COMPANY_VAT_LIVE_CHECK', 'true', 18, 4, '', '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ACCOUNT_COMPANY_VAT_GROUP', 'true', 18, 4, '', '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'ACCOUNT_VAT_BLOCK_ERROR', 'true', 18, 4, '', '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'DEFAULT_CUSTOMERS_VAT_STATUS_ID_LOCAL', '3', '18', '24', NULL , '', 'xtc_get_customers_status_name', 'xtc_cfg_pull_down_customers_status_list(');

#configuration_group_id 19
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'GOOGLE_CONVERSION_ID', '', '19', '2', NULL , '0000-00-00 00:00:00', NULL , NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'GOOGLE_LANG', 'de', '19', '3', NULL , '0000-00-00 00:00:00', NULL , NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'GOOGLE_CONVERSION', 'false', '19', '0', NULL , '0000-00-00 00:00:00', NULL , 'xtc_cfg_select_option(array(\'true\', \'false\'),');

#configuration_group_id 20
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'CSV_TEXTSIGN', '"', '20', '1', NULL , '0000-00-00 00:00:00', NULL , NULL);
# ... E002 - begin
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'CSV_SEPERATOR', ';', '20', '2', NULL , '0000-00-00 00:00:00', NULL , NULL);
# ... E002 - end
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'COMPRESS_EXPORT', 'false', '20', '3', NULL , '0000-00-00 00:00:00', NULL , 'xtc_cfg_select_option(array(\'true\', \'false\'),');

#configuration_group_id 21, Afterbuy
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'AFTERBUY_PARTNERID', '', '21', '2', NULL , '0000-00-00 00:00:00', NULL , NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'AFTERBUY_PARTNERPASS', '', '21', '3', NULL , '0000-00-00 00:00:00', NULL , NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'AFTERBUY_USERID', '', '21', '4', NULL , '0000-00-00 00:00:00', NULL , NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'AFTERBUY_ORDERSTATUS', '1', '21', '5', NULL , '0000-00-00 00:00:00', 'xtc_get_order_status_name' , 'xtc_cfg_pull_down_order_statuses(');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'AFTERBUY_ACTIVATED', 'false', '21', '6', NULL , '0000-00-00 00:00:00', NULL , 'xtc_cfg_select_option(array(\'true\', \'false\'),');

#configuration_group_id 22, Search Options
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'SEARCH_IN_DESC', 'true', '22', '2', NULL, '0000-00-00 00:00:00', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('', 'SEARCH_IN_ATTR', 'true', '22', '3', NULL, '0000-00-00 00:00:00', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');

#configuration econda
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'TRACKING_ECONDA_ACTIVE', 'false',  23, 1, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'TRACKING_ECONDA_ID','',  23, 2, NULL, '', NULL, NULL);

INSERT INTO xtc_configuration_group VALUES ('1', 'My Store', 'General information about my store', '1', '1');
INSERT INTO xtc_configuration_group VALUES ('2', 'Minimum Values', 'The minimum values for functions / data', '2', '1');
INSERT INTO xtc_configuration_group VALUES ('3', 'Maximum Values', 'The maximum values for functions / data', '3', '1');
INSERT INTO xtc_configuration_group VALUES ('4', 'Images', 'Image parameters', '4', '1');
INSERT INTO xtc_configuration_group VALUES ('5', 'Customer Details', 'Customer account configuration', '5', '1');
INSERT INTO xtc_configuration_group VALUES ('6', 'Module Options', 'Hidden from configuration', '6', '0');
INSERT INTO xtc_configuration_group VALUES ('7', 'Shipping/Packaging', 'Shipping options available at my store', '7', '1');
INSERT INTO xtc_configuration_group VALUES ('8', 'Product Listing', 'Product Listing    configuration options', '8', '1');
INSERT INTO xtc_configuration_group VALUES ('9', 'Stock', 'Stock configuration options', '9', '1');
INSERT INTO xtc_configuration_group VALUES ('10', 'Logging', 'Logging configuration options', '10', '1');
INSERT INTO xtc_configuration_group VALUES ('11', 'Cache', 'Caching configuration options', '11', '1');
INSERT INTO xtc_configuration_group VALUES ('12', 'E-Mail Options', 'General setting for E-Mail transport and HTML E-Mails', '12', '1');
INSERT INTO xtc_configuration_group VALUES ('13', 'Download', 'Downloadable products options', '13', '1');
INSERT INTO xtc_configuration_group VALUES ('14', 'GZip Compression', 'GZip compression options', '14', '1');
INSERT INTO xtc_configuration_group VALUES ('15', 'Sessions', 'Session options', '15', '1');
INSERT INTO xtc_configuration_group VALUES ('16', 'Meta-Tags/Search engines', 'Meta-tags/Search engines', '16', '1');
INSERT INTO xtc_configuration_group VALUES ('18', 'Vat ID', 'Vat ID', '18', '1');
INSERT INTO xtc_configuration_group VALUES ('19', 'Google Conversion', 'Google Conversion-Tracking', '19', '1');
INSERT INTO xtc_configuration_group VALUES ('20', 'Import/Export', 'Import/Export', '20', '1');
INSERT INTO xtc_configuration_group VALUES ('21', 'Afterbuy', 'Afterbuy.de', '21', '1');
INSERT INTO xtc_configuration_group VALUES ('22', 'Search Options', 'Additional Options for search function', '22', '1');

DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS xtc_countries;
CREATE TABLE xtc_countries (
  countries_id int NOT NULL auto_increment,
  countries_name varchar(64) NOT NULL,
  countries_iso_code_2 char(2) NOT NULL,
  countries_iso_code_3 char(3) NOT NULL,
  address_format_id int NOT NULL,
  status int(1) DEFAULT '1' NULL,  
  PRIMARY KEY (countries_id),
  KEY IDX_COUNTRIES_NAME (countries_name)
);
# ... E002 - begin
INSERT INTO xtc_countries VALUES (14,'&Ouml;sterreich','AT','AUT','5','1');
INSERT INTO xtc_countries VALUES (81,'Deutschland','DE','DEU','5','1');
# ... E002 - end

INSERT INTO xtc_currencies VALUES (1,'Euro','EUR','','EUR',',','.','2','1.0000', now());

# ... E002 - begin
INSERT INTO xtc_languages VALUES (2,'Deutsch','de','icon.gif','german',1,'utf-8');
INSERT INTO xtc_orders_status VALUES ( '1', '2', 'Offen');
INSERT INTO xtc_orders_status VALUES ( '2', '2', 'In Bearbeitung');
INSERT INTO xtc_orders_status VALUES ( '3', '2', 'Versendet');
# ... E002 - end

# ... E002 - begin
# Germany
INSERT INTO xtc_zones VALUES (79,81,'NDS','Niedersachsen');
INSERT INTO xtc_zones VALUES (80,81,'BAW','Baden-W&uuml;rttemberg');
INSERT INTO xtc_zones VALUES (81,81,'BAY','Bayern');
INSERT INTO xtc_zones VALUES (82,81,'BER','Berlin');
INSERT INTO xtc_zones VALUES (83,81,'BRG','Brandenburg');
INSERT INTO xtc_zones VALUES (84,81,'BRE','Bremen');
INSERT INTO xtc_zones VALUES (85,81,'HAM','Hamburg');
INSERT INTO xtc_zones VALUES (86,81,'HES','Hessen');
INSERT INTO xtc_zones VALUES (87,81,'MEC','Mecklenburg-Vorpommern');
INSERT INTO xtc_zones VALUES (88,81,'NRW','Nordrhein-Westfalen');
INSERT INTO xtc_zones VALUES (89,81,'RHE','Rheinland-Pfalz');
INSERT INTO xtc_zones VALUES (90,81,'SAR','Saarland');
INSERT INTO xtc_zones VALUES (91,81,'SAS','Sachsen');
INSERT INTO xtc_zones VALUES (92,81,'SAC','Sachsen-Anhalt');
INSERT INTO xtc_zones VALUES (93,81,'SCN','Schleswig-Holstein');
INSERT INTO xtc_zones VALUES (94,81,'THE','Th&uuml;ringen');

# Austria
INSERT INTO xtc_zones VALUES (95,14,'WI','Wien');
INSERT INTO xtc_zones VALUES (96,14,'NO','Nieder&ouml;sterreich');
INSERT INTO xtc_zones VALUES (97,14,'OO','Ober&ouml;sterreich');
INSERT INTO xtc_zones VALUES (98,14,'SB','Salzburg');
INSERT INTO xtc_zones VALUES (99,14,'KN','K&auml;rnten');
INSERT INTO xtc_zones VALUES (100,14,'ST','Steiermark');
INSERT INTO xtc_zones VALUES (101,14,'TI','Tirol');
INSERT INTO xtc_zones VALUES (102,14,'BL','Burgenland');
INSERT INTO xtc_zones VALUES (103,14,'VB','Voralberg');
# ... E002 - end

# Dumping data for table `payment_moneybookers_countries`
# ... E002 - begin
INSERT INTO xtc_payment_moneybookers_countries VALUES (14, 'AUT');
INSERT INTO xtc_payment_moneybookers_countries VALUES (81, 'GER');
# ... E002 - end


# Dumping data for table `payment_moneybookers_currencies`
# ... E002 - begin
INSERT INTO xtc_payment_moneybookers_currencies VALUES ('EUR', 'Euro');
# ... E002 - end

# ... E003 - begin
ALTER TABLE xtc_orders ADD customers_fax varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL AFTER customers_telephone;
ALTER TABLE xtc_orders ADD customers_gender char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL AFTER customers_status_discount;
# ... E003 - end
 
# ... A001 - begin
ALTER TABLE xtc_admin_access ADD slimstat int(1) NOT NULL DEFAULT '0';

DROP TABLE IF EXISTS slimstat_visits;
DROP TABLE IF EXISTS xtc_slimstat_visits;
CREATE TABLE xtc_slimstat_visits (
  remote_ip varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  country char(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  language varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  domain varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  referrer varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  search_terms varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  start_resource varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  end_resource varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  user_agent varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  platform varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  browser varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  version varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  resolution varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  start_mi tinyint(3) unsigned NOT NULL DEFAULT '0',
  start_hr tinyint(3) unsigned NOT NULL DEFAULT '0',
  start_dy tinyint(3) unsigned NOT NULL DEFAULT '0',
  start_mo tinyint(3) unsigned NOT NULL DEFAULT '0',
  start_yr smallint(5) unsigned NOT NULL DEFAULT '0',
  end_mi tinyint(3) unsigned NOT NULL DEFAULT '0',
  end_hr tinyint(3) unsigned NOT NULL DEFAULT '0',
  end_dy tinyint(3) unsigned NOT NULL DEFAULT '0',
  end_mo tinyint(3) unsigned NOT NULL DEFAULT '0',
  end_yr smallint(5) unsigned NOT NULL DEFAULT '0',
  hits int(10) unsigned NOT NULL DEFAULT '0',
  start_ts int(10) unsigned NOT NULL DEFAULT '0',
  end_ts int(10) unsigned NOT NULL DEFAULT '0',
  duration int(11) NOT NULL DEFAULT '0',
  resource text CHARACTER SET utf8 COLLATE utf8_bin,
  KEY start_ts (start_yr,start_mo,start_dy,start_hr,start_mi),
  KEY end_ts (end_yr,end_mo,end_dy,end_hr,end_mi)
);

DROP TABLE IF EXISTS slimstat_cache;
DROP TABLE IF EXISTS xtc_slimstat_cache;
CREATE TABLE xtc_slimstat_cache (
  remote_ip varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  country char(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  language varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  resource varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  platform varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  browser varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  version varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  resolution varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  search_terms varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  domain varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  referrer varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  start_resource varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  end_resource varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  hits int(10) unsigned NOT NULL DEFAULT '0',
  tz varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  yr smallint(5) unsigned NOT NULL DEFAULT '0',
  mo tinyint(3) unsigned NOT NULL DEFAULT '0',
  dy tinyint(3) unsigned NOT NULL DEFAULT '0',
  app_version varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  cache longblob NOT NULL,
  KEY ts (tz,yr,mo,dy)
);

DROP TABLE IF EXISTS slimstat_hits;
DROP TABLE IF EXISTS xtc_slimstat_hits;
CREATE TABLE xtc_slimstat_hits (
  remote_ip varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  country varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  language varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  domain varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  referrer varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  search_terms varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  resource varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  title varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  platform varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  browser varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  version varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  resolution varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  mi tinyint(3) unsigned NOT NULL DEFAULT '0',
  hr tinyint(3) unsigned NOT NULL DEFAULT '0',
  dy tinyint(3) unsigned NOT NULL DEFAULT '0',
  mo tinyint(3) unsigned NOT NULL DEFAULT '0',
  yr smallint(5) unsigned NOT NULL DEFAULT '0',
  hits int(10) unsigned NOT NULL DEFAULT '0',
  KEY ts (yr,mo,dy,hr,mi)
);
# ... A001 - end

# ... A002 - begin
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'LESS_QTY_ALLOW_CHECKOUT', 'false',  9, 6, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'STOCK_MARK_PRODUCT_LESS_QTY', '**',  9, 7, NULL, '', NULL, NULL);
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'LESS_QTY_CORRECT_QTY', 'false',  9, 8, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO xtc_configuration (configuration_id,  configuration_key, configuration_value, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES   ('', 'LESS_QTY_ADD_CART', 'false',  9, 9, NULL, '', NULL, 'xtc_cfg_select_option(array(\'true\', \'false\'),');
# ... A002 - end

# ... B006 - begin
ALTER TABLE xtc_products CHANGE products_discount_allowed products_discount_allowed DECIMAL( 4, 2 ) NOT NULL DEFAULT '0.00';
# ... B006 - end

# ... B007 - begin (sql-file darf nicht mit Kommentar enden, daher hier kein B007 - end)
ALTER TABLE xtc_customers CHANGE refferers_id refferers_id VARCHAR( 32 ) NOT NULL DEFAULT '0';
