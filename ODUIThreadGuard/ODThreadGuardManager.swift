//
//  ODThreadGuardManager.swift
//  ODUIThreadGuard
//
//  Created by olddonkey on 2017/3/15.
//  Copyright © 2017年 Old Donkey. All rights reserved.
//

import UIKit

/// Delegate
protocol ODThreadGuardDelegate {
    func didFindThreadIssue()
}

extension ODThreadGuardDelegate {
    func didFindThreadIssue(){
        //Default implementation
        assert(Thread.isMainThread, "You changed UI element not on main thread")
    }
}

class ODThreadGuardManager: ODThreadGuardDelegate {
    static let guardManager = ODThreadGuardManager()
    var delegate: ODThreadGuardDelegate?
    
    func foundThreadError(){
        guard let delegate = delegate else{
            assert(Thread.isMainThread, "You changed UI element not on main thread")
            return
        }
        delegate.didFindThreadIssue()
    }
    
    func start(){
        guardSwitch = true
    }
    
    func stop(){
        guardSwitch = false
    }
}
