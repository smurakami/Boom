//
//  AppDelegate.swift
//  Boom
//
//  Created by 村上晋太郎 on 2016/12/06.
//  Copyright © 2016年 S. Murakami. All rights reserved.
//

import Cocoa
import MASShortcut

func pow() {
    let powImages = [
        "pow0",
//        "pow1",
        "pow2",
//        "pow3",
    ]
    
    var rect = NSScreen.main()?.frame
    let window = NSWindow(contentRect: rect!, styleMask: NSWindowStyleMask.borderless, backing: .buffered, defer: false)
    window.backgroundColor = NSColor.clear
    window.isOpaque = false
    window.alphaValue = 1
    window.makeKeyAndOrderFront(NSApplication.shared())
    window.level = Int(CGWindowLevelForKey(CGWindowLevelKey.statusWindow))
    let iv = NSImageView(frame: window.contentView!.bounds)
    
    let mousePos = NSEvent.mouseLocation()
    
    iv.frame.size.width *= 2
    iv.frame.size.height *= 2
    iv.frame.origin.x = rect!.size.width/2 - iv.frame.size.width/2
    iv.frame.origin.y = rect!.size.height/2 - iv.frame.size.height/2
//    iv.frame.origin.x = mousePos.x - iv.frame.size.width/2
//    iv.frame.origin.y = mousePos.y - iv.frame.size.height/2
    
    iv.wantsLayer = true
    iv.image = NSImage(named: powImages[Int(arc4random()) % powImages.count])
//    iv.image = NSImage(named: somenImages[Int(arc4random()) % somenImages.count])
    window.contentView!.addSubview(iv)
    
    iv.layer?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    let animation = CABasicAnimation(keyPath: "transform.scale")
//    animation.fromValue = 0.8
//    animation.toValue = 12
    animation.fromValue = 0.4
    animation.toValue = 6
    
    let opacityAnimation = CABasicAnimation(keyPath: "opacity")
    opacityAnimation.fromValue = 1
    opacityAnimation.toValue = 00
    
    
    let group = CAAnimationGroup()
    group.duration = 0.5
    group.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
    group.fillMode = kCAFillModeForwards
    group.isRemovedOnCompletion = false
    group.animations = [animation, opacityAnimation]
    
    CATransaction.begin()
    CATransaction.setCompletionBlock {
        print(window)
    }
    iv.layer?.add(group, forKey: "")
    CATransaction.commit()
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
    }
    
    
}
