//
//  ODUIThreadGuard.swift
//  ODUIThreadGuard
//
//  Created by olddonkey on 2016/12/23.
//  Copyright © 2016年 Old Donkey. All rights reserved.
//
//  Based on the idea of https://gist.github.com/steipete/5664345
//  MIT license
//  Copyright © {olddonkey}
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

/// It is better to use a debug flag here for not add this extension to Release build. (You don't want user see App crash)
#if debug
private let swizzle: (String, String, UIView.Type) -> Void = { (originalMethod, swizzledMethod, view) in
    let originalSelector = Selector(originalMethod)
    let swizzledSelector = Selector(swizzledMethod)

    let originalMethod = class_getInstanceMethod(view, originalSelector)
    let swizzledMethod = class_getInstanceMethod(view, swizzledSelector)

    let didAddMethod = class_addMethod(view, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))

    if didAddMethod {
        class_replaceMethod(view, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
}
    
// MARK: - A extension of UIView, basic idea is use runtime to exchange setNeedsLayout, setNeedsDisplay and setNeedsDisplayInRect with our customized method, and do the checking process in that method
extension UIView{
    open override class func initialize() {
        //If self is the subclass of UIView, return
        if self !== UIView.self {
            return
        }
        
        let methods = [
            "setNeedsLayout": "guardSetNeedsLayout",
            "setNeedsDisplay": "guardSetNeedsDisplay",
            "setNeedsDisplayInRect:": "guardSetNeedsDisplayInRect:"
        ]

        methods.forEach {(key, value) in
            swizzle(key, value, self)
        }
    }
    
    func guardSetNeedsLayout() {
        checkThread()
        guardSetNeedsLayout()
    }

    func guardSetNeedsDisplay() {
        checkThread()
        guardSetNeedsDisplay()
    }

    func guardSetNeedsDisplayInRect(_ rect: CGRect) {
        checkThread()
        guardSetNeedsDisplayInRect(rect)
    }
    //If not on main thread, assert the app. From the left side thread stack view, you can easily find which line has problem
    func checkThread() {
        assert(Thread.isMainThread, "You changed UI element not on main thread")
    }
    
}
#endif

