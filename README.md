THEOplayer
=========

This repository contains a demo app for THEOplayer.


---
# Installation

To install the dependencies
* Open a terminal and cd to the directory containing the Podfile
* Run the `pod install` command

(For further details regarding cocoapod installation see https://cocoapods.org/)

Add THEOplayerSDK.framework
* Open finder and add THEOplayerSDK.framework to the project directory
* Open 'THEOplayer.xcworkspace' and go to project configuration, select the General tab and scroll down to the Embedded Binaries section and click '+'
* A submenu will open, click 'Add Other..'
* Select the previously added THEOplayerSDK.framework
* A menu will open. They have sufficient defaults. Click 'Finish'


---
# Existing Functionalities

The app is currently able to load video source from JSON file, and play it with THEOplayer.

* When the app loads, it will load the video list from JSON file, and show them in the tableView
* Upon selecting a video source, it will open a view with THEOplayer to play the selected video source

---
# Development Steps

1. Create new project based on single view app
2. Create folders for MVVM pattern
3. Design the UI layout to show video list in storyboard
4. Add video list's JSON file and Model to handle video source data
5. Add view model and dataSource, that will show the video list at VideoListViewController
6. Design the UI layout to play the selected video source
7. Add dynamic video source configuration for the player
8. Add picture-in-picture feature
9. Add VR feature
10. Add Unit Test to test the process


