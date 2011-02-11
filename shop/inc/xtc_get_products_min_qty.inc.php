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
E017 - 10.11.2010 - AB - Tabellenprefix
*/

/* -----------------------------------------------------------------------------------------
$Id: xtc_get_products_min_qty.inc.php 1.0 2007-08-30 12:35:40 Anotherone $

Estelco - Ebusiness & more
http://www.estelco.de

Copyright (c) 2007 Estelco
--------------------------------------------------------------------------------------------
Released under the GNU General Public License
------------------------------------------------------------------------------------------*/

function xtc_get_products_min_qty($products_id) {
    $products_id = xtc_get_prid($products_id);
    //
    // ... E017 - begin
    //
    // ... old
    //
    //$min_qty_query = "SELECT personal_offer
    //                  FROM personal_offers_by_customers_status_".$_SESSION['customers_status']['customers_status_id']."
    //                  WHERE products_id='".$products_id."'
    //                  AND quantity='1'";
    //
    // ... new
    //
    $min_qty_query = "SELECT personal_offer
                        FROM xtc_personal_offers_by_customers_status_".$_SESSION['customers_status']['customers_status_id']."
                        WHERE products_id='".$products_id."'
                        AND quantity='1'";
    //
    // ... E017 - end
    //

    $min_qty_query = xtDBquery($min_qty_query);
    $min_qty_data = xtc_db_fetch_array($min_qty_query, true);
    if ($min_qty_data['personal_offer']==0.00) {
        //
        // ... E017 - begin
        //
        // ... old
        //
        //$min_qty_query = "SELECT min(quantity) as qty
        //                      FROM personal_offers_by_customers_status_".$_SESSION['customers_status']['customers_status_id']."
        //                      WHERE products_id='".$products_id."'
        //                      AND quantity>'1'";
        //
        // ... new
        //
        $min_qty_query = "SELECT min(quantity) as qty
                            FROM xtc_personal_offers_by_customers_status_".$_SESSION['customers_status']['customers_status_id']."
                            WHERE products_id='".$products_id."'
                            AND quantity>'1'";
        //
        // ... E017 - end
        //
        $min_qty_query = xtDBquery($min_qty_query);
        if (xtc_db_num_rows($min_qty_query)) {
            $min_qty_data = xtc_db_fetch_array($min_qty_query, true);
            return $min_qty_data['qty'];
        } else {
            return false;
        }
    } else {
        return '1';
    }
}
?>