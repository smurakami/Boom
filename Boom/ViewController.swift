//
//  ViewController.swift
//  Boom
//
//  Created by 村上晋太郎 on 2016/12/06.
//  Copyright © 2016年 S. Murakami. All rights reserved.
//

import Cocoa
import MASShortcut

class ViewController: NSViewController {
    
    @IBOutlet weak var sv: MASShortcutView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sv.associatedUserDefaultsKey = "test"
        
        MASShortcutBinder.shared().bindShortcut(withDefaultsKey: "test", toAction: {
            pow()
        })
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

