MBImageConstants
================

MBImageConstants is a simple XCode precompile script that generates precompiler defines 
corresponding to .png images found in a project. 
It allows autocompletion for image names and protects against typos.

Installation
------------
Installation is divided at three steps. First, add proper line to your project's Podfile:

    pod 'MBImageConstants', :git => 'https://github.com/bananita/MBImageConstants.git', :tag => '0.1.0'

Next, you have to add a new phase to your Project's Build Phases between Check Pods Manifest.lock and Compile Sources.
It is simple invocation of ruby with MBImageConstants script:

    ruby ${PODS_ROOT}/MBImageConstants/imageconsts.rb ${SRCROOT}

Third, the last step is inserting import to your application prefix file (.pch):

    #ifdef __OBJC__
    ...
    #import <MBImageConstants/MBImageConstants.h>
    ...
    #endif

That's all! You can build your project now.

Contributing
------------
If you'd like to contribute code, fork the project at [github](https://github.com/bananita/mbimageconstants), 
make your changes, then send a pull request.

License
-------
This code is free to use under the terms of the MIT license.
