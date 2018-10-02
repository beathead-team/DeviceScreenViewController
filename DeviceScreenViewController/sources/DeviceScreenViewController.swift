//
//  DeviceScreenViewController.swift
//  DeviceScreenViewController
//
//  Created by Pavel Marchenko on 10/2/18.
//  Copyright © 2018 pgmarchenko. No rights reserved.
//

import UIKit

public enum Device {
    case phone4
    case phone5
    case phone6
    case phone6Plus
    case phoneX
    case phoneXSMax
    case pad
    case padPro
    
    public var portraitSize: CGRect {
        let size: CGSize = {
            switch self {
            case .phone4: return .init(width: 320, height: 480)
            case .phone5: return .init(width: 320, height: 568)
            case .phone6: return .init(width: 375, height: 667)
            case .phone6Plus: return .init(width: 414, height: 736)
            case .phoneX: return .init(width: 375, height: 812)
            case .phoneXSMax: return .init(width: 414, height: 896)
            case .pad: return .init(width: 768, height: 1024)
            case .padPro: return .init(width: 1024, height: 1366)
            }
        }()
        
        return .init(origin: .zero, size: size)
    }
    
    public var landscapeSize: CGRect {
        let size: CGSize = {
            switch self {
            case .phone4: return .init(width: 480, height: 320)
            case .phone5: return .init(width: 568, height: 320)
            case .phone6: return .init(width: 667, height: 375)
            case .phone6Plus: return .init(width: 736, height: 414)
            case .phoneX: return .init(width: 812, height: 375)
            case .phoneXSMax: return .init(width: 896, height: 414)
            case .pad: return .init(width: 1024, height: 768)
            case .padPro: return .init(width: 1366, height: 1024)
            }
        }()
        
        return .init(origin: .zero, size: size)
    }
}

public enum Orientation {
    case portrait
    case landscape
}

/**
 Creates a controller that represents a specific device, orientation with specific traits.
 
 - parameter device:           The device the controller should represent.
 - parameter orientation:      The orientation of the device.
 - parameter child:            An optional controller to put inside the parent controller. If omitted
 a blank controller will be used.
 - parameter additionalTraits: An optional set of traits that will also be applied. Traits in this collection
 will trump any traits derived from the device/orientation comboe specified.
 
 - returns: Two controllers: a root controller that can be set to the playground's live view, and a content
 controller which should have UI elements added to it
 */
public func playgroundControllers(device: Device = .phone6,
                                  orientation: Orientation = .portrait,
                                  child: UIViewController = UIViewController(),
                                  additionalTraits: UITraitCollection = .init(),
                                  showStatusBar: Bool = true)
    -> (parent: UIViewController, child: UIViewController) {
        
        let parent = UIViewController()
        parent.addChild(child)
        parent.view.addSubview(child.view)
        
        child.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let traits: UITraitCollection
        
        parent.view.frame = orientation == .portrait ? device.portraitSize : device.landscapeSize
        
        if showStatusBar {
            if #available(iOS 11.0, *) {
                child.additionalSafeAreaInsets = .init(top: 20, left: 0, bottom: 0, right: 0)
            }
            
            let timeLabel = UILabel(frame: .init(origin: .zero, size: .init(width: 49, height: 14)))
            timeLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            timeLabel.textColor = .white
            timeLabel.text = "9:41 AM"
            timeLabel.textAlignment = .center
            timeLabel.center.x = parent.view.bounds.midX
            timeLabel.frame.origin.y = 3.5
            
            parent.view.addSubview(timeLabel)
        }
        
        switch (device, orientation) {
        case (.phone4, .portrait):
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .regular),
                .init(userInterfaceIdiom: .phone)
                ])
            
        case (.phone4, .landscape):
            
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .compact),
                .init(userInterfaceIdiom: .phone)
                ])
        case (.phone5, .portrait):
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .regular),
                .init(userInterfaceIdiom: .phone)
                ])
        case (.phone5, .landscape):
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .compact),
                .init(userInterfaceIdiom: .phone)
                ])
        case (.phone6, .portrait):
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .regular),
                .init(userInterfaceIdiom: .phone)
                ])
        case (.phone6, .landscape):
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .compact),
                .init(userInterfaceIdiom: .phone)
                ])
        case (.phone6Plus, .portrait):
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .regular),
                .init(userInterfaceIdiom: .phone)
                ])
        case (.phone6Plus, .landscape):
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .regular),
                .init(verticalSizeClass: .compact),
                .init(userInterfaceIdiom: .phone)
                ])
            
        case (.phoneX, .portrait):
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .regular),
                .init(userInterfaceIdiom: .phone)
                ])
            
            if #available(iOS 11.0, *) {
                child.additionalSafeAreaInsets = .init(top: 44, left: 0, bottom: 34, right: 0)
            }
            
            let notch = UIView(frame: .init(x: 0, y: 0, width: 230, height: 32))
            notch.center.x = parent.view.bounds.midX
            notch.backgroundColor = .black
            notch.layer.borderWidth = 1
            notch.layer.borderColor = UIColor.white.cgColor
            parent.view.addSubview(notch)
            
            let homeIndicator = UIView(frame: .init(x: 0, y: 0, width: 158, height: 5))
            homeIndicator.center.x = parent.view.bounds.midX
            homeIndicator.frame.rb.y = parent.view.bounds.maxY - 8
            homeIndicator.backgroundColor = .black
            homeIndicator.layer.borderWidth = 1
            homeIndicator.layer.borderColor = UIColor.white.cgColor
            
            parent.view.addSubview(homeIndicator)
            
        case (.phoneX, .landscape):
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .regular),
                .init(verticalSizeClass: .compact),
                .init(userInterfaceIdiom: .phone)
                ])
            
        case (.phoneXSMax, .portrait):
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .regular),
                .init(userInterfaceIdiom: .phone)
                ])
            
            if #available(iOS 11.0, *) {
                child.additionalSafeAreaInsets = .init(top: 44, left: 0, bottom: 34, right: 0)
            }
            let notch = UIView(frame: .init(x: 0, y: 0, width: 140, height: 20))
            notch.center.x = parent.view.bounds.midX
            notch.backgroundColor = .black
            parent.view.addSubview(notch)
            
            let homeIndicator = UIView(frame: .init(x: 0, y: 0, width: 134, height: 5))
            homeIndicator.center.x = parent.view.bounds.midX
            homeIndicator.frame.rb.y = parent.view.bounds.maxY - 9
            homeIndicator.backgroundColor = .white
            parent.view.addSubview(homeIndicator)
            
        case (.phoneXSMax, .landscape):
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .regular),
                .init(verticalSizeClass: .compact),
                .init(userInterfaceIdiom: .phone)
                ])
            
        case (.pad, .portrait):
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .regular),
                .init(verticalSizeClass: .regular),
                .init(userInterfaceIdiom: .pad)
                ])
        case (.pad, .landscape):
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .regular),
                .init(verticalSizeClass: .regular),
                .init(userInterfaceIdiom: .pad)
                ])
        case (.padPro, .portrait):
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .regular),
                .init(verticalSizeClass: .regular),
                .init(userInterfaceIdiom: .pad)
                ])
        case (.padPro, .landscape):
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .regular),
                .init(verticalSizeClass: .regular),
                .init(userInterfaceIdiom: .pad)
                ])
        }
        
        child.view.frame = parent.view.bounds
        parent.preferredContentSize = parent.view.frame.size
        parent.view.backgroundColor = .white
        //
        let allTraits = UITraitCollection.init(traitsFrom: [traits, additionalTraits])
        parent.setOverrideTraitCollection(allTraits, forChild: child)
        //
        return (parent, child)
}
