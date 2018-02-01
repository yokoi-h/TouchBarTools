//
//  ViewController.swift
//  TouchBarTools
//
//  Created by Hiroshi Yokoi on 2018/02/01.
//  Copyright © 2018 Hiroshi Yokoi. All rights reserved.
//

import Cocoa
import AppKit

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

@available(OSX 10.12.2, *)
extension ViewController: NSTouchBarDelegate {
    override func makeTouchBar() -> NSTouchBar? {
        // 1
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.customizationIdentifier = .customBar
        touchBar.defaultItemIdentifiers = [.infoLabelItem]
        touchBar.customizationAllowedItemIdentifiers = [.infoLabelItem]
        return touchBar
    }
    
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        switch identifier {
        case NSTouchBarItem.Identifier.infoLabelItem:
            let customViewItem = NSCustomTouchBarItem(identifier: identifier)
            customViewItem.view = NSTextField(labelWithString: "execute")
            return customViewItem
        default:
            return nil
        }
    }
    
}

@available(OSX 10.12.2, *)
extension NSTouchBarItem.Identifier {
    static let infoLabelItem = NSTouchBarItem.Identifier("tb.InfoLabel")
    static let script_1_Item = NSTouchBarItem.Identifier("tb.exec.script1")
    static let script_2_Item = NSTouchBarItem.Identifier("tb.exec.script2")
    static let script_3_Item = NSTouchBarItem.Identifier("tb.exec.script3")
}

@available(OSX 10.12.2, *)
extension NSTouchBar.CustomizationIdentifier {
    static let customBar = NSTouchBar.CustomizationIdentifier("tb.ViewController.CustomBar")
}

func applicationDidFinishLaunching(_ aNotification: Notification) {
    if #available(OSX 10.12.2, *) {
        NSApplication.shared.isAutomaticCustomizeTouchBarMenuItemEnabled = true
    }
}
