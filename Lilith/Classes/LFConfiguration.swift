//
//  LFConfiguration.swift
//  Lilith
//
//  Created by The Dark Master on 23/06/16.
//  Copyright © 2016 Josh Arnold. All rights reserved.
//

import UIKit

/** Configure Lilith. */
public class LFConfiguration: NSObject {
    
    /** A shared instance of LFConfiguration. */
    public static let sharedInstance = LFConfiguration()
    private override init() {}
    
    var font = UIFont(name: "Avenir Next", size: 20)
    var textColor = UIColor.whiteColor()
    
    public func configureText(font:UIFont, textColor:UIColor) {
        self.font = font
        self.textColor = textColor
    }
    
}
