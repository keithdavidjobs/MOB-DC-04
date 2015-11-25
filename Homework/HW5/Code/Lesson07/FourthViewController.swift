//
//  FourthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let path = NSTemporaryDirectory() + "thirdVCText.txt"

        do
        {
            let readStr:NSString? = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            if let temp_str = readStr
            {
                self.textView.text = String(temp_str)
            }
        }
        catch let error as NSError
        {
            print("error reading contents of array:\n\(error)")
        }
    }
}
