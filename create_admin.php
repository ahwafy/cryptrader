<?php
$db = new PDO('sqlite:Y:/cryptrader/database/database.sqlite');
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$hash = password_hash('password', PASSWORD_BCRYPT);
$stmt = $db->prepare("INSERT INTO users (name, email, password) VALUES ('Admin', 'admin@cryptrader.test', ?)");
$stmt->execute([$hash]);

echo "Admin user created successfully.\n";
