//
//  LFLabel.swift
//  Lilith
//
//  Created by The Dark Master on 23/06/16.
//  Copyright © 2016 Josh Arnold. All rights reserved.
//

import UIKit

/** A perfect class for creating labels, fast. */
public class LFLabel: UILabel {
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /** Create a LFLabel using the values from LFConfiguration. */
    override init(frame: CGRect) {
        super.init(frame: frame)
        let configuration = LFConfiguration.sharedInstance
        self.font = configuration.font
        self.textColor = configuration.textColor
        
    }
    
    /** Create a LFLabel with text, font and text colour. */
    init(frame:CGRect, text:String, font:UIFont, color:UIColor) {
        super.init(frame: frame)
        self.text = text
        self.font = font
        self.textColor = color
    }
    
    /** Create a LFLabel with text, font and text colour, aswell as the number of lines and the option to resize the height of the label to fit the text. */
    init(frame:CGRect, text:String, font:UIFont, color:UIColor, textAlignment:NSTextAlignment, numberOfLines:Int, resize:Bool) {
        super.init(frame: frame)
        self.text = text
        self.font = font
        self.textColor = color
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        if resize == true {
            self.frame.size.height = text.heightWithConstrainedWidth(self.frame.width, font: font)
        }
    }
    
}

private extension String {
    private func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.max)
        let boundingBox = self.boundingRectWithSize(constraintRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return boundingBox.height
    }
}
