//
//  LFButton.swift
//  Pods
//
//  Created by The Dark Master on 25/06/16.
//
//

import UIKit

public class LFButton: UIButton {
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /** Create a LFButton using the default LFConfiguration. */
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setConfiguration(LFConfiguration())
    }
    
    /** Create a LFButton using an LFConfiguration . */
    public init(frame: CGRect, configuration: LFConfiguration) {
        super.init(frame: frame)
        self.setConfiguration(configuration)
    }
    
    /** Create a LFButton using the configuration from LFConfiguration. */
    public init(frame: CGRect, configuration: LFConfiguration, text:String) {
        super.init(frame: frame)
        self.setTitle(text, forState: UIControlState.Normal)
        self.setConfiguration(configuration)
    }
    
    /** Create a LFButton with text, font and text colour. */
    public init(frame:CGRect, text:String, font:UIFont, color:UIColor) {
        super.init(frame: frame)
        self.titleLabel?.font = font
        self.setTitleColor(color, forState: UIControlState.Normal)
        self.setTitleColor(color.adjustBrightness(), forState: UIControlState.Highlighted)
    }
    
    /** Create a LFButton with text, font and text colour, aswell as the number of lines and the option to resize the height of the label to fit the text. */
    public init(frame:CGRect, text:String, font:UIFont, color:UIColor, textAlignment:NSTextAlignment, numberOfLines:Int, resize:Bool) {
        super.init(frame: frame)
        self.titleLabel?.font = font
        self.setTitleColor(color, forState: UIControlState.Normal)
        self.setTitleColor(color.adjustBrightness(), forState: UIControlState.Highlighted)
        switch textAlignment {
        case .Left: self.contentHorizontalAlignment = .Left
        case .Center: self.contentHorizontalAlignment = .Center
        case .Right: self.contentHorizontalAlignment = .Right
        default: self.contentHorizontalAlignment = .Left
        }
        self.titleLabel?.numberOfLines = numberOfLines
        if resize == true {
            self.frame.size.height = text.heightWithConstrainedWidth(self.frame.width, font: font)
        }
    }
    
    /** Creates an LFButton that fills the width of the view at a specific point with a configuration. */
    public init(text:String, view:UIView, point:CGFloat, configuration:LFConfiguration) {
        super.init(frame:CGRect(x: 16, y: point, width: view.frame.width-32, height: text.heightWithConstrainedWidth(view.frame.width-32, font: configuration.font!)))
        self.setTitle(text, forState: UIControlState.Normal)
        setConfiguration(configuration)
    }
    
    /** Configure the LFButton using an LFConfiguration. */
    public func setConfiguration(configuration:LFConfiguration) {
        self.titleLabel?.font = configuration.font
        self.setTitleColor(configuration.textColor, forState: UIControlState.Normal)
        self.setTitleColor(configuration.textColor.adjustBrightness(), forState: UIControlState.Highlighted)
        switch configuration.textAlignment {
        case .Left: self.contentHorizontalAlignment = .Left
        case .Center: self.contentHorizontalAlignment = .Center
        case .Right: self.contentHorizontalAlignment = .Right
        default: self.contentHorizontalAlignment = .Left
        }
        self.titleLabel?.numberOfLines = configuration.numberOfLines
        if configuration.resize == true {
            self.frame.size.height = (self.titleLabel?.text!.heightWithConstrainedWidth(self.frame.width, font: configuration.font!))!
        }
    }
    
    /** Resizes the height of the button's label to fit the text, while maintaining the original width. */
    public func resize() {
        if self.titleLabel?.text != nil {
            self.frame.size.height = (self.titleLabel?.text!.heightWithConstrainedWidth(self.frame.width, font: (self.titleLabel?.font!)!))!
        }
    }
    
   /** Move's the LFLabel directly below a view + optional padding. */
    public func below(view:UIView, padding:CGFloat) {
        self.frame.origin.y = CGRectGetMaxY(view.frame) + padding
    }
    
    /** Move's the LFButton directly above a view - optional padding. */
    public func above(view:UIView, padding:CGFloat) {
        self.frame.origin.y = CGRectGetMinY(view.frame) - padding - view.frame.height
    }
    
    /** Set the text alignment to the left. */
    public func leftText() {
        self.contentHorizontalAlignment = .Left
    }
    
    /** Set the text alignment to the center. */
    public func centerText() {
        self.contentHorizontalAlignment = .Center
    }
    
    /** Set the text alignment to the right. */
    public func rightText() {
        self.contentHorizontalAlignment = .Right
    }
    
    /** Set the font size. */
    public func fontSize(size:CGFloat) {
        self.titleLabel?.font = self.titleLabel?.font.fontWithSize(size)
    }
    
    /** Set the number of lines for the button. */
    public func lines(lines:Int) {
        self.titleLabel?.numberOfLines = lines
    }
    
    /** Set the buttons text color. Automatically adjusts brightness of the color for the highlighted state.*/
    public func textColor(textColor:UIColor) {
        self.setTitleColor(textColor, forState: UIControlState.Normal)
        self.setTitleColor(textColor.adjustBrightness(), forState: UIControlState.Highlighted)
    }
    
    /** Target a method fast using the touch up inside control event. */
    public func target(action:String, object:AnyObject) {
        self.addTarget(object, action: Selector(action), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
}

extension UIColor {
    func adjustBrightness() -> UIColor {
        var white:CGFloat = 0
        getWhite(&white, alpha: nil)
        if white > 0.5 {
            return darkerColor()
        }else{
            return lighterColor()
        }
    }
    func lighterColor() -> UIColor {
        var hue : CGFloat = 0
        var saturation : CGFloat = 0
        var brightness : CGFloat = 0
        var alpha : CGFloat = 0
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return UIColor(hue: hue, saturation: saturation, brightness: brightness+0.4, alpha: alpha)
        } else {
            return self
        }
    }
    func darkerColor() -> UIColor {
        var hue : CGFloat = 0
        var saturation : CGFloat = 0
        var brightness : CGFloat = 0
        var alpha : CGFloat = 0
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return UIColor(hue: hue, saturation: saturation, brightness: brightness-0.4, alpha: alpha)
        } else {
            return self
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
