<?php
  require('includes/configure.php');

  require('includes/application_top.php');

    // connect do database
  xtc_db_connect() or die('Unable to connect to database server!');



  // get configuration data
  //$configuration_query = xtc_db_query('ALTER TABLE xtc_categories ADD target_url varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL AFTER last_modified;');


?>
