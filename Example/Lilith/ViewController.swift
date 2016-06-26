//
//  ViewController.swift
//  Lilith
//
//  Created by joshuaarnold on 06/23/2016.
//  Copyright (c) 2016 joshuaarnold. All rights reserved.
//

import UIKit
import Lilith

class ViewController: UIViewController {
    
    var config:LFConfiguration!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create a configuration that can be used multiple times
        config = LFConfiguration(font: UIFont(name: "Avenir Next", size: 20)!, textColor: .blackColor(), textAlignment: .Left, numberOfLines: 0, resize: true)
        
        //Create an LFLabel (using a configuration) that is the width of a view at a certain point (adjusts height automatically)
        let label = LFLabel(text: "Welcome to Lilith.", view: view, point: 32, configuration: config)
        label.centerText()
        view.addSubview(label)
        
        //Create an LFLabel using the same configuration
        let label2 = LFLabel(frame: CGRect(x: 16, y: 0, width: view.frame.width-32, height: 64), configuration: config, text: "Lilith makes UI simple.")
        label2.below(label, padding: 16) //Move label2 to the max Y of the label + padding of 16
        label2.fontSize(15) //Set font size
        view.addSubview(label2)
        
        //Create a LFButton witht the full width of the view (adjusts height automatically)
        let button = LFButton(text: "Click me", view: view, point: 0, configuration: config)
        button.below(label2, padding: 16)//Move button to the max Y of label2 + padding of 32
        button.textColor(UIColor.orangeColor())//Automatically set button's text color for normal & highlighted state
        button.fontSize(15)
        button.target("doSomething", object: self) //Quickly Target a method (assumes the control event is TouchUpInside)
        view.addSubview(button)
        
    }
    
    func doSomething() {
        print("Hello world!")
    }
    
}

