<?php
/**
 *
 *
 * @version Sofortüberweisung 1.9  05.06.2007
 * @author Henri Schmidhuber  info@in-solution.de
 * @copyright 2006 - 2007 Henri Schmidhuber
 * @link http://www.in-solution.de
 * @link http://www.xt-commerce.com
 * @link http://www.sofort-ueberweisung.de
 * @license http://opensource.org/licenses/gpl-license.php GNU Public License
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 2 of the License
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
 * USA
 *
 ***********************************************************************************
 * this file contains code based on:
 * (c) 2000 - 2001 The Exchange Project
 * (c) 2001 - 2003 osCommerce, Open Source E-Commerce Solutions
 * (c) 2003	 nextcommerce (account_history_info.php,v 1.17 2003/08/17); www.nextcommerce.org
 * (c) 2003 - 2006 XT-Commerce
 * Released under the GNU General Public License
 ***********************************************************************************
 *
 */



 $sofortueberweisung_string .= '<a href="http://www.sofortueberweisung.de/" target="_blank"><img src="'.'templates/'.CURRENT_TEMPLATE.'/buttons/' . $_SESSION['language'].'/sofortueberweisung_block.gif" alt="Sofortüberweisung"></a> ';

 $box_smarty = new smarty;
 $box_smarty->assign('tpl_path','templates/'.CURRENT_TEMPLATE.'/');
 $box_content='';
 $box_smarty->assign('BOX_CONTENT', $sofortueberweisung_string);
 $box_smarty->assign('language', $_SESSION['language']);


    	  // set cache ID

  $box_smarty->caching = 0;
  $box_sofortueberweisung = $box_smarty->fetch(CURRENT_TEMPLATE.'/boxes/box_sofortueberweisung.html');


  $smarty->assign('box_SOFORTUEBERWEISUNG',$box_sofortueberweisung);

   ?>