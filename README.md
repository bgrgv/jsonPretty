[![GitHub Follow](https://img.shields.io/github/followers/bgrgv?style=social&logo=github)](https://github.com/bgrgv)

# jsonPretty
#### Flutter-Web application for JSON formatting

# [Click to view live version](https://www.blessinspeaks.com/jsonpretty)


### Requirements :
- Flutter
- Chrome for hot restart on web
- Flutter Web is still in beta and isn't production ready yet.
- Guide to set up Flutter for web :
	
	Make sure that you have Flutter v1.12 or above
		Run the follwing commands to enable Flutter web support :

 - 1.` flutter channel beta ` 

 - 2.` flutter upgrade `

 - 3.` flutter config --enable-web
 `

### To run locally:
- For development :
	- Clone this repo
	- Inside the repo, run `flutter run -d chrome`
- For running the build :
	 - Extract th build.zip file from repo
	 - Serve files using any local server
		
## Notes
- Opening web link(s) [ in /lib/screens/views.dart line:38] is currently implemented using `dart:html` which is a web only implementation. Use `url_launcher` to implement the same for other platforms.
