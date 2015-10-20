//
//  ViewController.swift
//  Lesson07
//
//  Created by Shalev on 10/19/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var coloredBox: UIView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeViewColor(sender: AnyObject) {
    
        UIView.animateWithDuration(1) { () -> Void in
            //code
            if self.coloredBox.backgroundColor == UIColor.redColor()
            {
                self.coloredBox.backgroundColor = UIColor.greenColor()
                self.coloredBox.frame = CGRect(x: 10, y: 10, width: 300, height: 100)
            }
            else
            {
                self.coloredBox.backgroundColor = UIColor.redColor()
                self.view.backgroundColor = UIColor.blueColor()
//                var pWidth = self.view.widthAnchor
//                var pHeight = self.view.heightAnchor
//                var tempW = Double(pWidth!)! * 0.8
//                var tempH = Double(pHeight!)! * 0.25
//                self.coloredBox.frame = CGRect(x: 0, y: 0, width: tempW, height: tempH)
            }
        }
        
        if self.textField.text == "yes"
        {
            self.performSegueWithIdentifier("popupSecondView", sender: sender)
        }
    }

    @IBAction func viewSwipeRight(sender: AnyObject) {
        print("Gesture worked")
        UIView.animateWithDuration(1) { () -> Void in
            self.coloredBox.backgroundColor = UIColor.blueColor()
        }
    }
    
    @IBAction func viewSwipeLeft(sender: AnyObject) {
        UIView.animateWithDuration(1) { () -> Void in
            self.coloredBox.backgroundColor = UIColor.redColor()
        }
    }
    
    
}

