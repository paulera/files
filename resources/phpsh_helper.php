<?php

function array_remove_value(&$array, $value) {
    if(($key = array_search($value, $array)) !== false) {
        unset($array[$key]);
    }
}

function ls($dir = null) {
    $scan = scandir(getcwd());
    array_remove_value($scan, '.');
    array_remove_value($scan, '..');

    if ($dir === false) {
        return $scan;
    }

    l($scan);
    return $scan;
}

function cd($dir = null) {
    if ($dir === null) {
        echo getcwd();
        return;
    }
    if ($dir === 'home') {
        $dir = getenv('HOME');
    } 
    if (is_dir($dir)) {
        chdir($dir);
    }
}

function grep($pattern, $array) {
    $result = array();
    foreach ($array as $item) {
        if (preg_match($pattern, $item)) {
            $result[] = $item;
        }
    }
    return $result;
}

function l($array) {
    foreach ($array as $item) {
        echo $item."\n";
    }
}

function home() {
    cd('home');
    cd(null);
}

cd();


