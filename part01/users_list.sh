#!/bin/bash
# Name: users_list.sh
# Purpose: List all normal user and system accounts in the system. Tested on RHEL / Debian Linux
# Author: Ehsan Ghaffar <ehsanghaffarii.ir>
# -----------------------------------------------------------------------------------

_l="/etc/login.defs"
_p="/etc/passwd"

## get mini UID limit ##
l=$(grep "^UID_MIN" $_l)

## get max UID limit ##
l1=$(grep "^UID_MAX" $_l)

## use awk to print if UID >= $MIN and UID <= $MAX and shell is not /sbin/nologin   ##
echo "----------[ Normal User Accounts ]---------------"
awk -F':' -v "min=${l##UID_MIN}" -v "max=${l1##UID_MAX}" '{ if ( $3 >= min && $3 <= max  && $7 != "/sbin/nologin" ) print $0 }' "$_p"

echo ""
echo "----------[ System User Accounts ]---------------"
awk -F':' -v "min=${l##UID_MIN}" -v "max=${l1##UID_MAX}" '{ if ( !($3 >= min && $3 <= max  && $7 != "/sbin/nologin")) print $0 }' "$_p"
