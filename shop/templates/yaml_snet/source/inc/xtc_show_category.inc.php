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

E002 - 11.11.2010 - AB - Defaultwerte
E018 - 11.11.2010 - AB - Weiterleitung
*/

/* -----------------------------------------------------------------------------------------
   $Id: xtc_show_category.inc.php 1262 2006-10-27 10:00:32Z mz $

   YAML fuer xt:Commerce - Tabellenfreie Templates
   http://yaml.t3net.de

   Copyright (c) 2007 Bjoern Tessmann for Zerosoftware GbR zerosoft.de
   -----------------------------------------------------------------------------------------
   based on:
   (c) 2000-2001 The Exchange Project  (earlier name of osCommerce)
   (c) 2002-2003 osCommerce(categories.php,v 1.23 2002/11/12); www.oscommerce.com
   (c) 2003	 nextcommerce (xtc_show_category.inc.php,v 1.4 2003/08/13); www.nextcommerce.org
   (c) 2003-2007 XT-Commerce

   Released under the GNU General Public License
   ---------------------------------------------------------------------------------------*/

function xtc_show_category($counter, $levelNow = -1 , $getPrev = "-1" ) {
    global $foo, $categories_string, $id;

    // Kategoriennamen umwandeln, so dass eine id-Zuweisung fuer die CSS-Formatierung moeglich wird
    // Thanks to Reinhard Hiebl (www.joomla-template-yaml.de/)
    // Umlaute Ersetzen
    $getId = $foo[$counter]['name'] ;
    //
    // ... E002 - begin
    //
    // ... old
    //
    //$searchInId = array("�" , "�", "�", "�", "�", "�", "�", " ",);
    //
    // ... new
    //
    $searchInId = array("ä" , "ö", "ü", "ß", "Ä", "Ö", "Ü", " ",);
    //
    // ... E002 - end
    //
    $replaceInId = array("ae" , "oe", "ue", "ss", "Ae", "Oe", "Ue", "");
    $getId = str_replace($searchInId, $replaceInId, $getId);
    // Sonderzeichen entfernen
    $getId = preg_replace("/[^a-zA-Z0-9_]/" , "" , $getId);
    // Alles in klein
    $getId = strtolower($getId);

    // Wenn das erste Element wird als Ebene -1 zugewiesen
    if ($getPrev == '-1') {
        $foo[$getPrev]['level'] = "-1";
    }
    // Naechste ID wird als Variable definiert
    $getNext = $foo[$counter]['next_id'];

    // Wenn das erste Element wird die Body-Box und eine float-Box geoeffnet
    if ($foo[$counter]['level']=='') {
        if (strlen($categories_string)=='0') {
            $categories_string .= '';
	}
    }

    // oeffne Liste wenn Elementebene des vorherigen Elements kleiner dem aktuellen ist
    if ($foo[$getPrev]['level'] < $foo[$counter]['level']) {
    	$categories_string .= '<ul>';
    }

    // Ueberpruefung ob Elemnt aktiv, sowie Oeffnen des Listenelements
    if ( ($id) && (in_array($counter, $id)) ) {
        $categories_string .= '<li class="activeCat" id="'.$getId.'">';
    } else {
	$categories_string .= '<li id="'.$getId.'">';
    }

    // Linkausgabe
    $categories_string .= '<a href="';
    //
    // ... E018 + E002 - begin
    //
    // ... old
    //
    //$cPath_new=xtc_category_link($counter,$foo[$counter]['name']);
    //$categories_string .= xtc_href_link(FILENAME_DEFAULT, $cPath_new);
    //
    // ... new
    //
    if($foo[$counter]['target_url']) {
        if(!preg_match("/^http:\/\//",$foo[$counter]['target_url'])) {
            $foo[$counter]['target_url'] = "http://".$foo[$counter]['target_url'];
        }
        $categories_string .= $foo[$counter]['target_url'];
        $categories_string .= '" target="_blank';
    } else {
        $tempPath = str_replace($searchInId, $replaceInId, $foo[$counter]['name']);
        $cPath_new=xtc_category_link($counter,$tempPath);
        $categories_string .= xtc_href_link(FILENAME_DEFAULT, $cPath_new);
    }
    //
    // ... E018 + E002 - end
    //
    $categories_string .= '">';
    $categories_string .= $foo[$counter]['name'] ;

    // Gibt die Anzahl der Produkte in der Kategorie aus (wenn aktiviert)
    if (SHOW_COUNTS == 'true') {
    	$products_in_category = xtc_count_products_in_category($counter);
	if ($products_in_category > 0) {
            $categories_string .= '&nbsp;(' . $products_in_category . ')';
      	}
    }

    // Ueberpruefung ob Elemnt aktiv
    if ( ($id) && (in_array($counter, $id)) ) {
        // Wenn aktuelle Elementebene kleiner als die n�chste, schlie�e Listenelement, sowie Beenden des Links
	if ($foo[$counter]['level'] < $foo[$getNext]['level']) {
            $categories_string .= '</a>';
	} else {
            $categories_string .= '</a></li>';
	}
    } else {
	if ($foo[$counter]['level'] < $foo[$getNext]['level']) {
            $categories_string .= '</a>';
	} else {
            $categories_string .= '</a></li>';
	}
    }

    // Wenn naechste Elementebene kleiner ist als die aktuelle, soviele Schliesstags wie Differenz ist
    if ($foo[$getNext]['level'] < $foo[$counter]['level'] ) {
	$cul = $foo[$counter]['level'] - $foo[$getNext]['level'] ;
	for ($iul = 1; $iul <= $cul  ; $iul++ ) {
            $categories_string .= '</ul></li>';
	}
    }

    // Wenn weitere Elemente vorhanden sind, rufe Funktion mit naechstem Element auf, andernfalls schliesse Ebene 1 und Boxen
    if ($foo[$counter]['next_id']) {
	xtc_show_category($foo[$counter]['next_id'], $foo[$counter]['level'], $counter );
    } else {
	$categories_string .= '</ul>';
    }
}
?>
