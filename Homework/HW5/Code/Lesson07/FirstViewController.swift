//
//  FirstViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let test_string = defaults.objectForKey("test_string") as? String
        {
            if let test_number = defaults.objectForKey("test_number") as? Float
            {
                self.textView.text = "test_string: \(test_string)\ntest_number: \(test_number)"
            }
        }
    }
}