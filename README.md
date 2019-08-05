# HDvis
HD visualization

install by: bash install.sh or

cmake -DCMAKE_BUILD_TYPE= -G "CodeBlocks - Unix Makefiles" /path/containing/CMakeLists.txt
cmake --build /path/containing/CMakeCache.txt --target hdvis -- -j 4

Run by ./hdvis [file]


Libraries:

* https://github.com/yhirose/cpp-httplib
* https://threejs.org/
* https://github.com/vue-bulma/vue-admin

In general HDvis is structured in two halves:
1) a jana plugin (EventReader) which takes in physics objects stored in, say, an evio file, and returns JSON objects (via tao json) for display
2) a webpage (event.html) which acts a frontend containing a GUI as well as all the code that renders the JSON physics objects and xml geometry

A light-weight http server (WaitingLogic.h,httplib.h,HttpController.h,ControlLoop.h) handles the transmission of the JSON to the web front end as well as taking some
commands from the webpage (eg "next event").  When built a copy of the entire webpage gets produced and placed in build/www/* and is what is actually being run.  I
have never really liked this, but it has been a low priority to redo. HDvis dumbly detects changes in any of the cpp/.h files and will recopy on the next build.
This can lead to lost work if you are modifying the web page in buid/www/ (which one has to do if one wants immediate feedback) and you rebuild without moving
those changes out of /build/.

from the root directory:
/tao/ contains the tao json library for conversion
/EventReader/ contains the converter code
/js/ contains the frontend

/js/ contains event.html and a dummy event.json which allows for development in "offline" mode.  It also contains dat.gui.css which handles the GUI styling

there are also 2 sub folders:
/hdds/ which contains the geometry information (main_full_HDDS.xml is what is used and is a simple concatenation of the other HDDS.xml files)
/js/ contains everything needed for the webpage

In /js/ there are 3 main js files.  GluexEventLoader.js which takes information from event.json and renders the contained objects.  GluexGUI.js which is responsible
for the GUI (webpage upper right).  And GluexHDDSLoader.js which is responsible for taking the geometry data from main_full_HDDS.xml and rendering it in the scene.

event.html handles the animations and utilizes the above js files to render the scene.  Currently, the animations are driven by the clock displayed above my rendition of
a scrubber bar.  In other words only the clock gets updated.  The animation functions use this value instead of doing their own clock updates.


