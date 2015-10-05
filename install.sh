#!/bin/bash  

echo "making dir ./apk-repository"
mkdir apk-repository

echo "installing apk-updater"
npm install

echo "patching apk-updater"
patch -p0 < patch.d

echo "done."