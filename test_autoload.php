<?php
$path = __DIR__ . '/vendor/autoload.php';
echo "Checking path: $path\n";
if (file_exists($path)) {
    echo "File exists!\n";
    require $path;
    echo "Require successful!\n";
} else {
    echo "File DOES NOT exist!\n";
}
