# ODUIThreadGuard

</p>

ODTouchID is a guard to help me check if you make UI changes not in main thread


## Features

- [x] Easily know if you make UI changes not in main thread accidently
- [x] Get the thread stack to help you locate where you make the mistake

```swift
ODTouchID.StartODTouchID(messageOnAuth: "Your message", fallbackTitle: "Your fallback message", delegate: your delegate target)

//Protocol
    func ODTouchIDAuthorizeSuccess() {
        //succeeded
    }
    
    func ODTouchIDAuthorizeFail() {
        //failed
    }
```

It will download the image from `url`, send it to both memory and disk cache, then show it in the `imageView`. When you use the same code later, the image will be retrieved from cache and show immediately.

## Requirements

- iOS 8.0+ 
- Swift 3 

The main development of Kingfisher is based on Swift 3.

### Contact

Follow and contact me through [email](olddonkeyblog@gmail.com). If you find an issue, just [open a ticket](https://github.com/olddonkey/ODTouchID/issues/new) on it. Pull requests are warmly welcome as well.

### License

ODTouchID is released under the MIT license. See LICENSE for details.


