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
$Id: pricecalc.js.php,v 1.0 2005/10/22 17:09:08 André Estel

based on the Option Price Update for osCommerce

Copyright (c) 2005 Estelco / André Estel

Released under the GNU General Public License
---------------------------------------------------------------------------------------*/
global $xtPrice;
?>

<script type="text/javascript"><!--

function showPrice(form)
{
    var showUP = 0;
    //var myForms = "Hallo";
    var curPrice = 0;
    var num = 0;
    for (var i = 0; i < form.elements.length; i++)
    {
        var e = form.elements[i];
        //myForms = myForms + " - " + e.type
        if ( e.type == 'text' && e.name == 'products_qty')
        {
            showUP = 1;

            for (var j=0; j < price.length; j=j+2)
            {
                if (getPriceArray(j) <= e.value)
                {
                    curPrice = getPriceArray(j+1);
                }
            }
            //myPrice = curPrice;
            num = (curPrice * e.value * 100);
            if (num == 0)
            {
                myPrice = <?php echo "'" . TEXT_MIN_QTY_NOT_REACHED . "'"; ?>;
            } else {
                num = Math.floor(num+0.50000000001);
                cents = num%100;
                num = Math.floor(num/100).toString();
                if(cents<10) { cents = "0" + cents; }
                if (num.length>3)
                {
                    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
                    {
                        num = num.substring(0,num.length-(4*i+3))+<?php echo "'" . $xtPrice->currencies[$_SESSION['currency']]['thousands_point']."'"; ?>+ num.substring(num.length-(4*i+3));
                    }
                }
                myPrice = <?php echo "'" . TEXT_MIN_QTY_TOTAL . " " . $xtPrice->currencies[$_SESSION['currency']]['symbol_left'] . "'"; ?> + num + <?php echo "'" . $xtPrice->currencies[$_SESSION['currency']]['decimal_point'] . "'"; ?> + cents + " " + <?php echo "'" . $xtPrice->currencies[$_SESSION['currency']]['symbol_right'] . "'"; ?>;
            }
        }
        if ( showUP == 1 )
        {
            document.getElementById("NEWprice").innerHTML = myPrice;
        }
    }
}



var price;

function initPriceArray(max) {
    price = new Array(max);
}

function setPriceArray(key,val) {
    price[key] = val;
}

function getPriceArray(val) {
    return price[val];
}
//--></script>
