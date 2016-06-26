![Lilith Banner](/images/banner.png)

[![CI Status](http://img.shields.io/travis/joshuaarnold/Lilith.svg?style=flat)](https://travis-ci.org/joshuaarnold/Lilith)
[![Version](https://img.shields.io/cocoapods/v/Lilith.svg?style=flat)](http://cocoapods.org/pods/Lilith)
[![License](https://img.shields.io/cocoapods/l/Lilith.svg?style=flat)](http://cocoapods.org/pods/Lilith)
[![Platform](https://img.shields.io/cocoapods/p/Lilith.svg?style=flat)](http://cocoapods.org/pods/Lilith)

Lilith is a UI Library written in Swift designed to make working with UIKit faster and more user friendly.

## Usage

LFConfigurations are a set of appearance properties that can be applied to most of Lilith's text based classes, for example LFLabel and LFButton.

```swift
let config = LFConfiguration(font: UIFont(name: "Avenir Next", size: 20)!, textColor: .blackColor(), textAlignment: .Left, numberOfLines: 0, resize: true)
```
Once you've created a LFConfiguration, you can then use it to create certain classes such as LFLabel and LFButton. This allows you to avoid having to retype excessive code.

```swift
//A label made with Lilith
let frame = CGRect(x: 16, y: 0, width: view.frame.width-32, height: 64)
let label = LFLabel(frame: frame, configuration: config, text: "Hello world!")
view.addSubview(label)
```

Here is what the same label would look like using the default UIKit.

```swift
//Original label made with UIKit
let frame = CGRect(x: 16, y: 0, width: view.frame.width-32, height: 64)
let label = UILabel(frame: frame)
label.text = "Hello world!"
label.font = UIFont(named:"Avenir Next", size:20)
label.textColor = .BlackColor
label.textAlignment = .Left
label.numberOfLines = 0
label.sizeToFit()
view.addSubview(label)
```

Lilith configurations can be used for many text based classes, for example LFButton. The same properties from the configuration being applied to the above LFLabel can be directly applied to an LFButton without having to retype the same code. Oh, and should I mention Lilith has custom initializers to help speed up your coding.  

```swift
//Create a LFButton with the full width of the view (adjusts height automatically)
let button = LFButton(text: "Click me", view: view, point: 0, configuration: config)  
button.below(label2, padding: 16)//Move button to the max Y of label2 + padding of 32  button.textColor(UIColor.orangeColor()) //Automatically set button's text color for normal & highlighted state  button.fontSize(15)  
button.target("doSomething", object: self) //Quickly Target a method (assumes the control event is TouchUpInside)  
view.addSubview(button)
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
- iOS 8.0+
- Xcode 7.3+

## Installation

Lilith is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Lilith"
```

## Author

Josh Arnold, josharnold997@gmail.com

## License

Lilith is available under the MIT license. See the LICENSE file for more info.
