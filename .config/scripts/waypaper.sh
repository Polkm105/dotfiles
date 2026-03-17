#!/bin/sh

hyprctl dispatch workspace special && hyprctl dispatch exec [ scratchpad special:term silent ] waypaper
