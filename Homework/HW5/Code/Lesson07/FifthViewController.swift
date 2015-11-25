//
//  FifthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "fifthVCSeque" {
            let path = NSTemporaryDirectory() + "fifthVCText.txt"
            
            let text_str = self.textView.text
            let text_arr = NSArray(array: text_str.componentsSeparatedByString(" "))
            
            text_arr.writeToFile(path, atomically: true)
//            do
//            {
//             try tempStr.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding)
//            }
//            catch _
//            {
//                print("error writing to file")
//            }
        }
    }
}
