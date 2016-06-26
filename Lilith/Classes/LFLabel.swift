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
    
    /** Create a LFLabel using the default LFConfiguration. */
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setConfiguration(LFConfiguration())
    }
    
    /** Create a LFLabel using an LFConfiguration . */
    public init(frame: CGRect, configuration: LFConfiguration) {
        super.init(frame: frame)
        self.setConfiguration(configuration)
    }
    
    /** Create a LFLabel using the configuration from LFConfiguration. */
    public init(frame: CGRect, configuration: LFConfiguration, text:String) {
        super.init(frame: frame)
        self.text = text
        self.setConfiguration(configuration)
    }
    
    /** Create a LFLabel with text, font and text colour. */
    public init(frame:CGRect, text:String, font:UIFont, color:UIColor) {
        super.init(frame: frame)
        self.text = text
        self.font = font
        self.textColor = color
    }
    
    /** Create a LFLabel with text, font and text colour, aswell as the number of lines and the option to resize the height of the label to fit the text. */
    public init(frame:CGRect, text:String, font:UIFont, color:UIColor, textAlignment:NSTextAlignment, numberOfLines:Int, resize:Bool) {
        super.init(frame: frame)
        self.text = text
        self.font = font
        self.textColor = color
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        if resize == true {
            self.resize()
        }
    }
    
    /** Creates an LFLabel that fills the width of the view at a specific point with a configuration. */
    public init(text:String, view:UIView, point:CGFloat, configuration:LFConfiguration) {
        super.init(frame:CGRect(x: 16, y: point, width: view.frame.width-32, height: 0))
        self.text = text
        setConfiguration(configuration)
    }
    
    /** Configure the LFLabel using an LFConfiguration. */
    public func setConfiguration(configuration:LFConfiguration) {
        self.font = configuration.font
        self.textColor = configuration.textColor
        self.textAlignment = configuration.textAlignment
        self.numberOfLines = configuration.numberOfLines
        if configuration.resize == true {
            self.resize()
        }
    }
    
    /** Move's the LFLabel directly below a view + optional padding. */
    public func below(view:UIView, padding:CGFloat) {
        self.frame.origin.y = CGRectGetMaxY(view.frame) + padding
    }
    
    /** Move's the LFLabel directly above a view - optional padding. */
    public func above(view:UIView, padding:CGFloat) {
        self.frame.origin.y = CGRectGetMinY(view.frame) - padding - view.frame.height
    }
    
    /** Set the text alignment to the left. */
    public func leftText() {
        self.textAlignment = .Left
    }
    
    /** Set the text alignment to the center. */
    public func centerText() {
        self.textAlignment = .Center
    }
    
    /** Set the text alignment to the right. */
    public func rightText() {
        self.textAlignment = .Right
    }
    
    /** Set the font size. */
    public func fontSize(size:CGFloat) {
        self.font = self.font.fontWithSize(size)
    }
    
    /** Resizes the height of the label to fit the text, while maintaining the original width. */
    public func resize() {
        if text == nil {
            self.text = ""
        }
        self.frame.size.height = self.text!.heightWithConstrainedWidth(self.frame.width, font: self.font)
    }
    
    /** Set the number of lines for the label. */
    public func lines(lines:Int) {
        self.numberOfLines = lines
    }
    
}

private extension String {
    private func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.max)
        let boundingBox = self.boundingRectWithSize(constraintRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return boundingBox.height
    }
}
