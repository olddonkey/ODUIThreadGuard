# ODUIThreadGuard

```
Quick update: Thanks for everyone's issue, I will update a new version soon. This is a small component I created for myself use at first, but now, looks like it is more popular than I expected.
Thanks again for your help and support, I will make a update ASAP
```

</p>

ODUIThreadGuard is a guard to help check if you make UI changes not in main thread.
Highly recommend you add this file to your project as early as possible.


## Features

- [x] Passive implementation
- [x] Throw an assertion if setNeedsDisplay, setNeedsLayout, or setNeedsDisplayInRect: is called for instantiation of any UIView
- [x] Get the thread stack to help you locate where you make the mistake


## Usage

Use CocoaPods or Carthage or just pull the ODUIThreadGuard.swift file into your project.

You can change the pre compile flag to change the setting, in default, this only runs in DEBUG mode, so won't affect users in Release.

## Requirements

- iOS 8.0+
- Swift 3

The main development of ODUIThreadGuard is based on Swift 3.

### Contact

Follow and contact me through [email](olddonkeyblog@gmail.com). If you find an issue, just [open a ticket](https://github.com/olddonkey/ODUIThreadGuard/issues/new) on it. Pull requests are warmly welcome as well.

### License

ODUIThreadGuard is released under the MIT license. See LICENSE for details.
