
//
//  SixthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let path = NSTemporaryDirectory() + "fifthVCText.txt"

        let readArray:NSArray? = NSArray(contentsOfFile: path)

        if let array = readArray
        {
            let temp_str = array.componentsJoinedByString(" ")
            self.textView.text = temp_str
        }
    }
}
