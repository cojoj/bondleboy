# Bundleboy
If you've ever tried to pull `CFBundleIdentifier` from your **Xcode project** using shell script, well... You've probably did BUT if you'd like to get `CFBundleIdentifier` automatically eg. while using **Xcode Bots pre-script** you've probably face the wall.
This simple script is a solution to this problem.

## Installation

#### The fast way

This is a `shell` script so the installation is pretty basic.  
Just clone this repo 
```
git clone https://github.com/cojoj/bundleboy.git
```

and `cd` to this directory:
```
cd bundleboy/
```

For the sake of success allow execution of this script by calling:
```
chown u_x bundleboy.sh
```

From now on you can use this script by calling:
```
./bundleboy.sh
```

#### The global way

If you want to use this script globally with easy access you'll have to move it to either `/usr/bin` or `/usr/local/bin`. In this example I'll move it to the first location by calling:
```
mv bundleboy.sh /usr/bin
```

Now you can use `bundleboy` command from whenever you want!

## Usage

If you run `bundleboy` script without any argument it'll execute in current directory, so be sure this directory contains either `.xcodeproj` or `.xcworkspace` file.  
Besides this `bundleboy` offers tho argument options:

- `p` - accepts the given path as a path to Xcode project directory (which contains `.xcodeproj` or `.xcworkspace`)
- `x` - this argument is to be used with **Xcode Bots** so it automatically grabs project path from bots variables (`$XCS_SOURCE_DIR`)

## Why would I need this anyway?

I'll provide with my real-life scenario for this script. I use **Xcode Server** for Continous Integration in my company bu we also wanted to implement Continous Delivery with [fastlane](https://fastlane.tools) tools.
Unfortunately, it's really hard to automatize this whole process because you have to provide some pre-script and post-script which may require some use input (Xcode don't allow you to interact with these). In my case what I needed was `CFBundleIdentifier` to check provisioning with [sigh](https://github.com/KrauseFx/sigh). Xcode Bots don't give you sufficient info with their variables but they give you enough info to write proper script and fetch those info by yourself - so that's why `bundleboy` was created.

## The MIT License (MIT)

Copyright (c) 2015 Mateusz Zając

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.