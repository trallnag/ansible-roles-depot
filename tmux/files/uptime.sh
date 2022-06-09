#!/bin/sh

awk '{print int($1/86400)"d:"int(($1%86400)/3600)"h:"int(($1%3600)/60)"m"}' /proc/uptime
