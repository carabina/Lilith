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
    
    var font = UIFont(name: "Avenir Next", size: 20)
    var textColor = UIColor.blackColor()
    var textAlignment:NSTextAlignment = .Center
    var numberOfLines:Int = 0
    var resize:Bool = false
    
    /** A instance of LFConfiguration using default values.*/
    public override init() {
        super.init()
    }
    
    /** Initialize an LFConfiguration with properties. */
    public init(font:UIFont, textColor:UIColor, textAlignment:NSTextAlignment, numberOfLines:Int, resize:Bool) {
        super.init()
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.resize = resize
    }
    
}
