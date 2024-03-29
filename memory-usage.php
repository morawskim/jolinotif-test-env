<?php

use Joli\JoliNotif\Notification;
use Joli\JoliNotif\Notifier\LibNotifyNotifier;

require_once __DIR__ . '/vendor/autoload.php';

$icons = [
    __DIR__  .'/icons/addressbook.svg',
    __DIR__  .'/icons/adriconf.svg',
    __DIR__  .'/icons/applications-system.svg',
    __DIR__  .'/icons/applications-system-orange.svg',
    __DIR__  .'/icons/calendar-turquoise-31.svg',
    __DIR__  .'/icons/distributor-logo-linux.svg',
];
$numberOfIcons = count($icons);

$start = memory_get_peak_usage(true);
$notifier = new LibNotifyNotifier();

if (!$notifier->isSupported()) {
    fprintf(STDERR, 'LibNotify is not supported!' . PHP_EOL);
    die(1);
}

for ($i = 0; $i < 4; ++$i) {
    $notification = (new Notification())
        ->setTitle(sprintf('Example via ffi %03d', $i))
        ->setBody('Lorem ipsum dolor sit amet, consectetur adipiscing elit')
        ->setIcon($icons[$i % $numberOfIcons])
    ;
    $notifier->send($notification);
    sleep(3);
}
$end = memory_get_peak_usage(true);

echo sprintf('Peak memory difference: %d', $end - $start);
echo PHP_EOL;
