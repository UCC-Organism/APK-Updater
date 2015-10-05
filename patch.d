Binary files node_modules/.DS_Store and node_modules_pp/.DS_Store differ
diff -rupN node_modules/apk-updater/lib/apkReader.js node_modules_pp/apk-updater/lib/apkReader.js
--- node_modules/apk-updater/lib/apkReader.js	2014-02-04 14:31:00.000000000 +0100
+++ node_modules_pp/apk-updater/lib/apkReader.js	2014-11-07 13:37:32.000000000 +0100
@@ -7,8 +7,7 @@ var fs = require('fs')
 var apk = {}
   , initialized = false
   , repoDir = '.apk_repo'
-	  /** APK filenames pattern. */
-  , apkPattern = /([\w\.]+)-(\d+)\.apk/;
+  , apkPattern = /([\w]+)-(\d+)\.apk/;
 
 
 function init(){
@@ -34,6 +33,9 @@ function init(){
       // console.log("New APK : " + RegExp.$1 + "\n" + JSON.stringify(apk[RegExp.$1]));
       apk[RegExp.$1] = _.sortBy(apk[RegExp.$1], function(def){ return def.version; });
     }
+    else {
+      console.log('else #1 - ' + file);
+    }
   }
 
   function removeApk(file){
diff -rupN node_modules/apk-updater/lib/updater.js node_modules_pp/apk-updater/lib/updater.js
--- node_modules/apk-updater/lib/updater.js	2014-03-05 16:16:14.000000000 +0100
+++ node_modules_pp/apk-updater/lib/updater.js	2014-11-07 15:04:18.000000000 +0100
@@ -12,10 +12,18 @@ var androidUpdate = {}
   , links = [];
 
 androidUpdate.updater = function (req, res){
+
+  console.log('+++++++++++++++++++++++++++++++');
+  console.log('update request from: ' + req.ip);
+
   var name = req.body.pkgname,
      version = req.body.version,
      last = reader.last(name),
      key;
+
+  console.log('name: ' + name);
+  console.log('version: ' + version);
+
   if(last && last.version > version){
     key = name + "-" + version;
   	if(!links[key]){
@@ -38,12 +46,17 @@ androidUpdate.updater = function (req, r
   		// hack to put this route at first
   		expressApp.routes.get.unshift(expressApp.routes.get.pop());
   	}
-    winston.info("have update for version " + version + "\n" + links[key].url + "\n" + last.version);
+    winston.info("update for version " + version + "\nfile: " + links[key].url + " - version: " + last.version + "\n");
+    console.log('sending update...');
     res.send("have update\n" + links[key].url + "\n" + last.version);
   } else {
-    winston.debug("No update for " + name + " - " + version + " / Last : " + last );
-  	res.send(200);
+    if(last)
+      winston.info("no update for " + name + " - " + version + " / version up-to-date: " + last.version );
+    else 
+      winston.info("no update for " + name + " - " + version);
+  	res.sendStatus(200);
   }
+  console.log('+++++++++++++++++++++++++++++++');
 };
 
 
@@ -62,8 +75,10 @@ function enable(app, route, repoDir){
   app.post(route, androidUpdate.updater);
 
   app.get(route, function (req, res){
+    console.log('--- request ---')
     res.send(reader.available());
   });
+
 };
 
 
