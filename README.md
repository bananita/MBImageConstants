MBImageConstants
================

MBImageConstants is a simple XCode 5 precompile script that generates precompiler defines 
corresponding to image sets found in a project's assets. 
It allows autocompletion for image names and protects against typos.

Requirements
------------
Script works with XCode 5 and project using Images.xcassets to store images. It is a Ruby script so it needs Ruby installed on the build machine.

Installation
------------
Installation is divided at three steps. First, add proper line to your project's Podfile:

    pod 'MBImageConstants'

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

Using
-----
Constants for all image sets will be created with 'image_' prefix. For example:

    UIImage* background = [UIImage imageNamed:image_Background];

Contributing
------------
If you'd like to contribute code, fork the project at [github](https://github.com/bananita/mbimageconstants), 
make your changes, then send a pull request.

License
-------
This code is free to use under the terms of the MIT license.
