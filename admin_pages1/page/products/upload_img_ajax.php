<?php
if($_FILES['file']['name'] != ''){
    $test = explode('.', $_FILES['file']['name']);
    $extension = end($test);    

    $location = '../../../uploads/'.$_FILES['file']['name'];
    move_uploaded_file($_FILES['file']['tmp_name'], $location);

    echo '<img src="'.$location.'" height="100" width="100" />';
}

?>