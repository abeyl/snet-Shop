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
E018 - 11.11.2010 - AB - Weiterleitung
*/

/* -----------------------------------------------------------------------------------------
   $Id: categories.php 1302 2005-10-12 16:21:29Z mz $   

   XT-Commerce - community made shopping
   http://www.xt-commerce.com

   Copyright (c) 2003 XT-Commerce
   -----------------------------------------------------------------------------------------
   based on: 
   (c) 2000-2001 The Exchange Project  (earlier name of osCommerce)
   (c) 2002-2003 osCommerce(categories.php,v 1.23 2002/11/12); www.oscommerce.com 
   (c) 2003	 nextcommerce (categories.php,v 1.10 2003/08/17); www.nextcommerce.org

   Released under the GNU General Public License 
   -----------------------------------------------------------------------------------------
   Third Party contributions:
   Enable_Disable_Categories 1.3        	Autor: Mikel Williams | mikel@ladykatcostumes.com

   Released under the GNU General Public License 
   ---------------------------------------------------------------------------------------*/
// reset var
$start = microtime();
$box_smarty = new smarty;
$box_content = '';

$box_smarty->assign('language', $_SESSION['language']);
// set cache ID
if (!CacheCheck()) {
	$cache=false;
	$box_smarty->caching = 0;
} else {
	$cache=true;
	$box_smarty->caching = 1;
	$box_smarty->cache_lifetime = CACHE_LIFETIME;
	$box_smarty->cache_modified_check = CACHE_CHECK;
	$cache_id = $_SESSION['language'].$_SESSION['customers_status']['customers_status_id'].$cPath;
}

if(!$box_smarty->is_cached(CURRENT_TEMPLATE.'/boxes/box_categories.html', $cache_id) || !$cache){

$box_smarty->assign('tpl_path', 'templates/'.CURRENT_TEMPLATE.'/');

// include needed functions
require_once (DIR_FS_CATALOG.'templates/'.CURRENT_TEMPLATE.'/source/inc/xtc_show_category.inc.php');
require_once (DIR_FS_INC.'xtc_has_category_subcategories.inc.php');
require_once (DIR_FS_INC.'xtc_count_products_in_category.inc.php');


$categories_string = '';
if (GROUP_CHECK == 'true') {
	$group_check = "and c.group_permission_".$_SESSION['customers_status']['customers_status_id']."=1 ";
}
    //
    // ... E018 - begin
    //
    // ... old
    //
    //$categories_query = "select c.categories_id,
    //                       cd.categories_name,
    //                       c.parent_id from ".TABLE_CATEGORIES." c, ".TABLE_CATEGORIES_DESCRIPTION." cd
    //                       where c.categories_status = '1'
    //                       and c.parent_id = '0'
    //                       ".$group_check."
    //                       and c.categories_id = cd.categories_id
    //                       and cd.language_id='".(int) $_SESSION['languages_id']."'
    //                       order by sort_order, cd.categories_name";
    //
    // ... new
    //
    $categories_query = "SELECT c.categories_id, cd.categories_name, c.parent_id, c.target_url
                           FROM ".TABLE_CATEGORIES." c, ".TABLE_CATEGORIES_DESCRIPTION." cd
                           WHERE c.categories_status = '1'
                           AND c.parent_id = '0'
                           ".$group_check."
                           AND c.categories_id = cd.categories_id
                           AND cd.language_id='".(int) $_SESSION['languages_id']."'
                           ORDER BY sort_order, cd.categories_name";
    //
    // ... E018 - end
    //
    $categories_query = xtDBquery($categories_query);

while ($categories = xtc_db_fetch_array($categories_query, true)) {
	$foo[$categories['categories_id']] = array ('name' => $categories['categories_name'], 'parent' => $categories['parent_id'], 'level' => 0, 'path' => $categories['categories_id'], 'next_id' => false);

        //
        // ... E018 - begin
        //
        $foo[$categories['categories_id']]['target_url'] = $categories['target_url'];
        //
        // ... E018 - end
        //

        if (isset ($prev_id)) {
		$foo[$prev_id]['next_id'] = $categories['categories_id'];
	}

	$prev_id = $categories['categories_id'];

	if (!isset ($first_element)) {
		$first_element = $categories['categories_id'];
	}
}

//------------------------
if ($cPath) {
	$new_path = '';
	//
	// ... B001 - begin
	//
	// ... old
	//
	//$id = split('_', $cPath);
	//
	// ... new
	//
	$id = preg_split('/_/', $cPath);
	//
	// ... B001 - end
	//
	reset($id);
	while (list ($key, $value) = each($id)) {
		unset ($prev_id);
		unset ($first_id);
                //
                // ... E018 - begin
                //
                // ... old
                //
		//$categories_query = "select c.categories_id, cd.categories_name, c.parent_id from ".TABLE_CATEGORIES." c, ".TABLE_CATEGORIES_DESCRIPTION." cd where c.categories_status = '1' and c.parent_id = '".$value."' ".$group_check." and c.categories_id = cd.categories_id and cd.language_id='".$_SESSION['languages_id']."' order by sort_order, cd.categories_name";
                //
                // ... new
                //
		$categories_query = "select c.categories_id, cd.categories_name, c.parent_id, c.target_url from ".TABLE_CATEGORIES." c, ".TABLE_CATEGORIES_DESCRIPTION." cd where c.categories_status = '1' and c.parent_id = '".$value."' ".$group_check." and c.categories_id = cd.categories_id and cd.language_id='".$_SESSION['languages_id']."' order by sort_order, cd.categories_name";
                //
                // ... E018 - end
                //
		$categories_query = xtDBquery($categories_query);
		$category_check = xtc_db_num_rows($categories_query, true);
		if ($category_check > 0) {
			$new_path .= $value;
			while ($row = xtc_db_fetch_array($categories_query, true)) {
				$foo[$row['categories_id']] = array ('name' => $row['categories_name'], 'parent' => $row['parent_id'], 'level' => $key +1, 'path' => $new_path.'_'.$row['categories_id'], 'next_id' => false);

                                //
                                // ... E018 - begin
                                //
                                $foo[$row['categories_id']]['target_url'] = $row['target_url'];
                                //
                                // ... E018 - end
                                //

                                if (isset ($prev_id)) {
					$foo[$prev_id]['next_id'] = $row['categories_id'];
				}

				$prev_id = $row['categories_id'];

				if (!isset ($first_id)) {
					$first_id = $row['categories_id'];
				}

				$last_id = $row['categories_id'];
			}
			$foo[$last_id]['next_id'] = $foo[$value]['next_id'];
			$foo[$value]['next_id'] = $first_id;
			$new_path .= '_';
		} else {
			break;
		}
	}
}

xtc_show_category($first_element);

$box_smarty->assign('BOX_CONTENT', $categories_string);

}

// set cache ID
if (!$cache) {
	$box_categories = $box_smarty->fetch(CURRENT_TEMPLATE.'/boxes/box_categories.html');
} else {
	$box_categories = $box_smarty->fetch(CURRENT_TEMPLATE.'/boxes/box_categories.html', $cache_id);
}

$smarty->assign('box_CATEGORIES', $box_categories);
?>