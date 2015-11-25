//
//  ThirdViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "saveThirdVCText" {
            let path = NSTemporaryDirectory() + "thirdVCText.txt"
            //let arrayOfNames:NSArray = ["Steve", "John", "Edward"]
            let tempStr = self.textView.text
            do
            {
             try tempStr.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding)
            }
            catch _
            {
                print("error writing to file")
            }
        }
    }
}
