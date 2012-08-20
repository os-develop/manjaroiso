#!/bin/bash

# do UID checking here so someone can at least get usage instructions
if [ "$EUID" != "0" ]; then
    echo "error: This script must be run as root."
    exit 1
fi

xfce="Y"
gnome="Y"
kde="Y"

if [ "$xfce" == "Y" ] ; then
   echo ">> build xfce image"
   ln -sfv ../xfce/isomounts isomounts
   ln -sfv ../xfce/Packages-Xfce Packages-Xfce
   buildiso
   echo ">> done build xfce image"
   rm Packages-Xfce
   rm -R work*/*xfce*
   rm -R work*/*isomounts*
   rm work*/iso/manjaro/*/xfce-image.sqfs
fi
if [ "$gnome" == "Y" ] ; then
   echo ">> build gnome image"
   ln -sfv ../gnome/isomounts isomounts
   ln -sfv ../gnome/Packages-gnome Packages-gnome
   buildiso
   echo ">> done build gnome image"
   rm Packages-gnome
   rm -R work*/*gnome*
   rm -R work*/*isomounts*
   rm work*/iso/manjaro/*/gnome-image.sqfs
fi
if [ "$kde" == "Y" ] ; then
   echo ">> build kde image"
   ln -sfv ../kde/isomounts isomounts
   ln -sfv ../kde/Packages-Kde Packages-Kde
   buildiso
   echo ">> done build kde image"
   rm Packages-Kde
   rm -R work*/*kde*
   rm -R work*/*isomounts*
   rm work*/iso/manjaro/*/kde-image.sqfs
fi

