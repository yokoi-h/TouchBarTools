//
//  WindowController.swift
//  TouchBarTools
//
//  Created by Hiroshi Yokoi on 2018/02/01.
//  Copyright © 2018 Hiroshi Yokoi. All rights reserved.
//

import Cocoa

class WindowsController: NSWindowController {
    
    override func windowDidLoad() {
        super.windowDidLoad()
    }
    
    @available(OSX 10.12.2, *)
    override func makeTouchBar() -> NSTouchBar? {
        guard let viewController = contentViewController as? ViewController else {
            return nil
        }
        return viewController.makeTouchBar()
    }
}
