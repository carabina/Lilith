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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configure default values
        LFConfiguration.sharedInstance.configureText(UIFont(name: "Avenir Next", size: 20)!, textColor: UIColor.blackColor())
        
        let label = LFLabel(frame: CGRect(x: 16, y: 32, width: view.frame.width-32, height: 64), text: "Hello world.", font: UIFont(name: "Avenir Next", size: 20)!, color: UIColor.blackColor())
        view.addSubview(label)
        
    }

}

