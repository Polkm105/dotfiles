#!/bin/bash 

current=`brightnessctl g`
max=`brightnessctl m`
value=`printf %.2f "$((10**2 * $current / $max))e-2"`
dunstify "Brightness: $value"
