# unxwb_linux
unxwb for linux hosts. You can use either the prebuilt binaries or you can build it yourself.
This version was made by Stephan Sokolow. Credit: http://blog.ssokolow.com/archives/2014/04/21/extracting-music-from-xwb-files-on-linux/
# Building
0. Clone the repository 
1. sudo apt-get install build-essential zlib1g-dev
2. unzip unxwb_linux.zip
3. cd unxwb
4. make
# Usage
unxwb.x86_64 -b music.xsb music.xwb
