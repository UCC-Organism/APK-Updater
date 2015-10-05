# APK-Updater
What you need to run the APK Updater on the MacMinis.  
First download the files in this repo and expand or copy them to your UCC library in a subfolder called "apk-updater".

**STEP 1: SETUP NODE.JS AND START APK SERVER**

A. If you haven't already, install node.js (see [here](http://blog.teamtreehouse.com/install-node-js-npm-mac) for instructions) 

B. Install forever using npm
```
$> npm install -g forever
```
C. When Node.js is installed properly (with forever) - open a terminal and cd to **apk-updater** and execute the command (download all software and configure the system)
```
$> . install.sh
```
D. Now to start the **apk-updater** 
```
$> forever start start.js
```
![](https://raw.githubusercontent.com/UCC-Organism/APK-Updater/master/README.rtfd/Screen%20Shot%202014-11-07%20at%2016.26.53.png)
E. apk-updater should now be started - to make sure it is, open a browser and point it to: **localhost:8088/organism** (or serverIP:**8088/organism**) - you should see a list containing asks that are in the folder **apk-repository**
![](https://raw.githubusercontent.com/UCC-Organism/APK-Updater/master/README.rtfd/Screen%20Shot%202014-11-07%20at%2016.29.12.png)
at the moment the **apk-repository** should be empty - hence the empty list above.
![](https://raw.githubusercontent.com/UCC-Organism/APK-Updater/master/README.rtfd/Screen%20Shot%202014-11-07%20at%2016.33.44.png)
The idea with apk-updater is that whatever file it finds in **apk-repository** will be server.  
F. Next step is to add an apk to and see if the system serves the new file (for example here - ucc_organims-0.apk)
![](https://raw.githubusercontent.com/UCC-Organism/APK-Updater/master/README.rtfd/Screen%20Shot%202014-11-07%20at%2016.34.00.png)
now open a browser and point it to: **localhost:8088/organism** (or serverIP:**8088/organism**) - you should see a list similar to:
![](https://raw.githubusercontent.com/UCC-Organism/APK-Updater/master/README.rtfd/Screen%20Shot%202014-11-07%20at%2016.34.24.png)
G. To see the logs of apk-updaterm issue the command
```
$> forever list
```
![](https://raw.githubusercontent.com/UCC-Organism/APK-Updater/master/README.rtfd/Screen%20Shot%202014-11-07%20at%2016.50.47.png)
identify the “uid” — in the above it’s 0  
now to see the log, issue the command:
```
$> forever logs <index>
```
where `<index>` is the “uid”
![](https://raw.githubusercontent.com/UCC-Organism/APK-Updater/master/README.rtfd/Screen%20Shot%202014-11-07%20at%2016.46.46.png)
whatever requests made to the server will show in the log (the above example being an odroid requesting an update)  

H. To stop the apk-updater, issue the command
```
$> forever stop <index>
```
where `<index>` is the “uid”
