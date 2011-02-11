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

B001 - 14.04.2010 - AB - Deprecated Functions
*/

/* -----------------------------------------------------------------------------------------
   $Id: xtc_remove_non_numeric.inc.php 829 2005-03-12 21:34:16Z mz $   

   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce
   -----------------------------------------------------------------------------------------
   by Mario Zanier for XTcommerce
   
   based on:
   (c) 2003	 nextcommerce (xtc_remove_non_numeric.inc.php,v 1.3 2003/08/13); www.nextcommerce.org

   Released under the GNU General Public License 
   ---------------------------------------------------------------------------------------*/
   
function xtc_remove_non_numeric($var) 
	{	  
	  //
	  // ... B001 - begin
	  //
	  // ... old
	  //
	  //$var=ereg_replace('[^0-9]','',$var);
	  //
	  // ... new
	  //
	  $var=preg_replace('/[^0-9]/','',$var);
	  //
	  // ... B001 - end
	  //
	  return $var;
     }
 ?>