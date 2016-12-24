# ODUIThreadGuard

</p>

ODUIThreadGuard is a guard to help me check if you make UI changes not in main thread. 
Highly recommand you add this file to your project as early as possible.


## Features

- [x] Easily know if you make UI changes not in main thread accidently
- [x] Get the thread stack to help you locate where you make the mistake


## Usage

Use CocoaPods or Cathage or just pull the ODUIThreadGuard.swift file into your project.

You can change the pre compile flag to change the setting, in default, this only runs in DEBUG mode, so won't affact users in Release.

## Requirements

- iOS 8.0+ 
- Swift 3 

The main development of ODUIThreadGuard is based on Swift 3.

### Contact

Follow and contact me through [email](olddonkeyblog@gmail.com). If you find an issue, just [open a ticket](https://github.com/olddonkey/ODUIThreadGuard/issues/new) on it. Pull requests are warmly welcome as well.

### License

ODUIThreadGuard is released under the MIT license. See LICENSE for details.


