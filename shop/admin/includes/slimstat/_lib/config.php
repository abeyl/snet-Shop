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

B001 - 10.11.2010 - AB - Deprecated Functions
E017 - 10.11.2010 - AB - Tabellenprefix
*/

/*
 * SlimStat: simple web analytics
 * Copyright (C) 2009 Pieces & Bits Limited
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

if ( get_magic_quotes_gpc() ) {
	foreach ( array_keys( $_GET ) as $key ) {
		$_GET[$key] = stripslashes( $_GET[$key] );
	}
	foreach ( array_keys( $_POST ) as $key ) {
		$_POST[$key] = stripslashes( $_POST[$key] );
	}
	foreach ( array_keys( $_COOKIE ) as $key ) {
		$_COOKIE[$key] = stripslashes( $_COOKIE[$key] );
	}
	$_REQUEST = array_merge( $_GET, $_POST );
}

class SlimStatConfig {
	/** Whether SlimStat is enabled */
	var $enabled = true;
	
	/** Database connection */
	var $db_server = DB_SERVER; // Leave as localhost unless you know otherwise
	var $db_username = DB_SERVER_USERNAME; // The username used to access your database
	var $db_password = DB_SERVER_PASSWORD; // The password used to access your database
	var $db_database = DB_DATABASE; // The database containing SlimStat’s tables
	
	/** Database tables */
        //
        // ... E017 - begin
        //
        // ... old
        //
	//var $tbl_hits = 'slimstat_hits'; // Hits table
	//var $tbl_visits = 'slimstat_visits'; // Visits table
	//var $tbl_cache = 'slimstat_cache'; // Cache table
        //
        // ... new
        //
	var $tbl_hits = 'xtc_slimstat_hits'; // Hits table
	var $tbl_visits = 'xtc_slimstat_visits'; // Visits table
	var $tbl_cache = 'xtc_slimstat_cache'; // Cache table
        //
        // ... E017 - end
        //

	/** The full name of your site */
	var $sitename = '';
	
	/** Username/password required to login to SlimStat */
	var $slimstat_use_auth = false;
	var $slimstat_username = '';
	var $slimstat_password = '';
	
	/** Timezone */
	var $timezone = 'Europe/London';
	// var $timezone = 'America/New_York';
	
	/** Which language to use. Default is 'en-gb' */
	var $language = 'en-gb';
	
	/** Which URL to use for WHOIS lookups */
	var $whoisurl = 'http://whois.domaintools.com/%i';
	
	/** Don’t log hits from referring domains containing these words */
	var $spam_words = array(
		'roulette', 'gambl', 'vegas', 'poker', 'casino', 'blackjack', 'omaha',
		'stud', 'hold', 'slot', 'bet', 'pills', 'cialis', 'viagra', 'xanax',
		'watches', 'loans', 'phentermine', 'naked', 'cam', 'sex', 'nude',
		'loan', 'mortgage', 'financ', 'rates', 'debt', 'dollar', 'cash',
		'traffic', 'babes', 'valium' );
	
	var $time_fields = array(
		'yr' => YEAR,
		'mo' => MONTH,
		'dy' => DAY,
		'hr' => HOUR,
		'mi' => MINUTE );
	
	var $hit_fields = array(
		'resource' => PAGES,
		'country' => COUNTRIES,
		'language' => LANGUAGES,
		'browser' => 'Browsers',
		'version' => VERSION,
		'platform' => PLATFORM,
		'resolution' => RESOLUTION );
	
	var $visit_fields = array(
		'remote_ip' => VISITERS,
		'search_terms' => SEARCH_TERMS,
		'domain' => 'Domains',
		'referrer' => 'Referrers',
		'start_resource' => START_RESOURCE,
		'end_resource' => END_RESOURCE,
		'hits' => HITS );
	
	/** Don’t log hits from these IP ranges */
	var $ignored_ips = array();// '192.168.', '10.', '127.' );
	
	/** Whether to record user-agent strings in the database. The database
	will be smaller if this is disabled */
	var $log_user_agents = true;
	
	/** Whether to log hits from crawlers. The database will be smaller if
	this is disabled */
	var $log_crawlers = false;
	
	/** Maximum number of minutes between hits in a visit */
	var $visit_length = 30;
	
	function SlimStatConfig() {
		SlimStat::set_timezone( $this->timezone );
		
		if ( file_exists( realpath( dirname( dirname( __FILE__ ) ) ).'/_i18n/'.preg_replace( "[^A-Za-z\-]", '', $this->language ).'.php' ) ) {
			require_once( realpath( dirname( dirname( __FILE__ ) ) ).'/_i18n/'.preg_replace( "[^A-Za-z\-]", '', $this->language ).'.php' );
		} else { // fall back on en-gb
			$this->language = 'en-gb';
			require_once( realpath( dirname( dirname( __FILE__ ) ) ).'/_i18n/en-gb.php' );
		}
		
		if ( mb_strlen( $this->language ) == 5 ) {
			setlocale( LC_ALL, mb_substr( $this->language, 0, 2 ).'_'.mb_strtoupper( mb_substr( $this->language, 3, 2 ) ).'.utf8' );
		} else {
			setlocale( LC_ALL, mb_substr( $this->language, 0, 2 ).'_'.mb_strtoupper( mb_substr( $this->language, 0, 2 ) ).'.utf8' );
		}
	}
	
	function &get_instance() {
		static $instance = array();
		if ( empty( $instance ) ) {
                        //
                        // ... B001 - begin
                        //
                        // ... old
                        //
			//$instance[] =& new SlimStatConfig();
                        //
                        // ... new
                        //
                        $instance[] = new SlimStatConfig();
                        //
                        // ... B001 - end
                        //
		}
		return $instance[0];
	}
}