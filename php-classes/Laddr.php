<?php

class Laddr
{
    public static $siteName;
    public static $siteAbbr;
    public static $siteSlogan;

    static function __classLoaded()
    {
        if (empty(static::$siteName)) {
            static::$siteName = Site::getConfig('label');
        }

        if (empty(static::$siteAbbr)) {
            static::$siteAbbr = preg_replace('/[^A-Z]/', '', static::$siteName);
        }
    }
}