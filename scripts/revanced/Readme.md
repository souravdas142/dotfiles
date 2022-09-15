

**Internet connection is required for this script**

JDK 17 is recommended

If all recent binaries are present 
just run `revanced-builder`

otherwise pass `-d` option to download all binaries.
this ensure all recent version of binaries present under current directory


also make sure an original version of recommended youtube apk is present under
current directory which is needed to patch to make revanced-youtube.        
you can download an apk version from : https://m.apkpure.com/youtube/com.google.android.youtube        
Best Version: 17.33.42          

Also modify the script with the name of original youtube apk file of the  previous line.
https://github.com/souravdas142/dotfiles/blob/ab712cff227bb418ab26cf6889b2516af74ce5a9/scripts/revanced/revanced-builder#L3
Also modify the version: https://github.com/souravdas142/dotfiles/blob/ab712cff227bb418ab26cf6889b2516af74ce5a9/scripts/revanced/revanced-builder#L4

also make sure to install VancedMicroG from : https://github.com/TeamVanced/VancedMicroG/releases

the file `prev_key.keystore` is required to be present unless you don't want to install revanced-youtube
by uninstalling the previous one, otherwise it will install as an update on the top of existing one


For more see:        
https://github.com/revanced          
https://www.reddit.com/r/revancedapp     
