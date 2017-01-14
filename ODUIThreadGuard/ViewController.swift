//
//  ViewController.swift
//  ODUIThreadGuard
//
//  Created by olddonkey on 2016/12/23.
//  Copyright © 2016年 Old Donkey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func runNotOnMainThread(_ sender: Any) {
        DispatchQueue.global().async {
            self.testLabel.text = "Not on main thread"
        }
    }
    
    @IBAction func runOnMainThread(_ sender: Any) {
        DispatchQueue.main.async {
            self.testLabel.text = "On main thread"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

