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

A002 - 08.04.2010 - AB - Mindestmenge
*/

/* -----------------------------------------------------------------------------------------
$Id: xtc_check_qty.inc.php 1000 2007-08-30 12:33:57Z Anotherone $

Estelco - Ebusiness & more
http://www.estelco.de

Copyright (c) 2007 Estelco
-----------------------------------------------------------------------------------------
Released under the GNU General Public License
---------------------------------------------------------------------------------------*/
// include needed functions
require_once(DIR_FS_INC . 'xtc_get_products_min_qty.inc.php');
function xtc_check_qty($products_id, $products_quantity) {
    $min_qty = xtc_get_products_min_qty($products_id);
    $too_less_qty = '';

    if ($products_quantity < $min_qty) {
        $too_less_qty = '<span class="markProductOutOfStock">' . STOCK_MARK_PRODUCT_LESS_QTY . '</span>';
    }

    return $too_less_qty;
}
?>