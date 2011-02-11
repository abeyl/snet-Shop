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

B007 - 31.03.2010 - AB - Bugfixes 2.12
*/

/* -----------------------------------------------------------------------------------------
   $Id: xtc_get_attributes_model.inc.php 899 2005-04-29 02:40:57Z hhgag $   

   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce
   -----------------------------------------------------------------------------------------
   based on:
   (c) 2003	 nextcommerce (xtc_get_attributes_model.inc.php,v 1.1 2003/08/19); www.nextcommerce.org
   
   Released under the GNU General Public License
   ---------------------------------------------------------------------------------------*/
   
function xtc_get_attributes_model($product_id, $attribute_name,$options_name,$language='') {
    	
    if ($language=='') $language=$_SESSION['languages_id'];
    //
    // ... B007
    //
    // ... old
    //$options_value_id_query=xtc_db_query("SELECT
    //pa.attributes_model
    //FROM
    //".TABLE_PRODUCTS_ATTRIBUTES." pa
    //Inner Join ".TABLE_PRODUCTS_OPTIONS." po ON po.products_options_id = pa.options_id
    //Inner Join ".TABLE_PRODUCTS_OPTIONS_VALUES." pov ON pa.options_values_id = pov.products_options_values_id
    //WHERE
    //po.language_id = '".$language."' AND
    //po.products_options_name = '".$options_name."' AND
    //pov.language_id = '".$language."' AND
    //pov.products_options_values_name = '".$attribute_name."'");
    //
    // ... new
    //
    $options_value_id_query = xtc_db_query("select pa.attributes_model
        from ".TABLE_PRODUCTS_ATTRIBUTES." pa
        inner join ".TABLE_PRODUCTS_OPTIONS." po on po.products_options_id = pa.options_id
        inner join ".TABLE_PRODUCTS_OPTIONS_VALUES." pov on pa.options_values_id = pov.products_options_values_id
        where po.language_id = '".$language."' and
        pa.products_id = '".$product_id."' AND
        po.products_options_name = '".$options_name."' and
        pov.language_id = '".$language."' and
        pov.products_options_values_name = '".$attribute_name."'");
    //
    // ... B007 - end
    //

    $options_attr_data = xtc_db_fetch_array($options_value_id_query);
    return $options_attr_data['attributes_model'];	
    	
    }
?>