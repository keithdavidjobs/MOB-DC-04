//
//  SecondViewController.swift
//  Lesson02
//
//  Created by Tedi Konda on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    //TODO five: Display the cumulative sum of all numbers added every time the ‘add’ button is pressed. Hook up the label, text box and button to make this work.
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var labelField: UILabel!
    
    
    @IBAction func btnAdd(sender: AnyObject)
    {
        if let tempInt = Int(self.numberField.text!)
        {
            self.labelField.text = String(Int(self.labelField.text!)! + tempInt)
        }
//        self.labelField.text = String(Int(self.labelField.text!)! + Int(self.numberField.text!)!)
    }
}
