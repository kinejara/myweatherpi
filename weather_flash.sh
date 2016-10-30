#!/bin/sh

echo "CHECKIN WHEATER..."
OUTPUT="$(inxi -w)"
echo "${OUTPUT}"

#OUTPUT="Weather:   Conditions: 56 F (13 C) - Mostly Cloudy Time: October 30, 7:00 AM CDT"
case "$OUTPUT" in 
  *rain*)
    echo "SET RAIN COLOR"
    hyperion-remote --effect "Green mood blobs" --priority 10 --duration 900000
    ;;
  *snow*)
    echo "SET SNOW"
    hyperion-remote --effect "Blue mood blobs" --priority  9 --duration 900000
    ;;
  *fog*)
    echo "SET FOG"
    hyperion-remote --effect "Cold mood blobs" --priority 8 --duration 900000
    ;;
  *12:00* | *12:01* | *12:02* | *12:03*)
    case "$OUTPUT" in
     *AM*)
     echo "TURN ON LIGHT"
     hyperion-remote --color gray --priority 1
     ;;
    esac
    ;;
  *8:05* | *8:06* | *8:07* | *8:08*)
    case "$OUTPUT" in
     *AM*)
     echo "TURN OFF LIGHT"
     hyperion-remote --color black --priority 2
     ;;
    esac
    ;;
esac
