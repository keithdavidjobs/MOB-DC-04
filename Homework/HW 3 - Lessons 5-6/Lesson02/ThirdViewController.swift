//
//  ThirdViewController.swift
//  Lesson02
//
//  Created by Tedi Konda on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
/*
    TODO six: Hook up the number input text field, button and text label to this class. When the button is pressed, a message should be printed to the label indicating whether the number is even.

*/

    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var labelField: UILabel!

    @IBAction func calculate(sender: AnyObject) {
        if let tempNumber = Int(self.numberField.text!)
        {
            if tempNumber % 2 == 0
            {
                self.labelField.text = "Even"
            }
            else
            {
                self.labelField.text = "Odd"
            }
        }
    }
}
