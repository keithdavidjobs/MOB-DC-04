//
//  FirstViewController.swift
//  Lesson02
//
//  Created by Tedi Konda on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var labelField: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    /*
    TODO one: hook up a button in interface builder to a new function (to be written) in this class. Also hook up the label to this class. When the button is clicked, the function to be written must make a label say ‘hello world!’
    
    
    TODO two: Connect the ‘name’ and ‘age’ text boxes to this class. Hook up the button to a NEW function (in addition to the function previously defined). That function must look at the string entered in the text box and print out “Hello {name}, you are {age} years old!”
    
    TODO three: Hook up the button to a NEW function (in addition to the two above). Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”
    
    TODO four: Hook up the button to a NEW function (in additino to the three above). Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.
    */
    
    @IBAction func btnClicked(sender: AnyObject)
    {
        helloWorld()
        func2()
        func3()
        func4()
    }
    
    func helloWorld()
    {
        self.labelField.text = "Hello world!\n"
    }
    
    func func2()
    {
        self.labelField.text = self.labelField.text! + "Hello \(self.nameField.text!), you are \(self.ageField.text!) years old!\n"
    }
    
    func func3()
    {
        if let tempAge = Int(self.ageField.text!)
        {
            if tempAge > 21
            {
                self.labelField.text = self.labelField.text! + "You can drink\n"
            }
            if tempAge > 18
            {
                self.labelField.text = self.labelField.text! + "you can vote\n"
            }
            if tempAge > 16
            {
                self.labelField.text = self.labelField.text! + "you can drive\n"
            }
        }
    }
    
    func func4()
    {
        
        if let tempAge2 = Int(self.ageField.text!)
        {
            if tempAge2 > 16 && tempAge2 < 18
            {
                //self.labelField.text = "1"
                self.labelField.text = self.labelField.text! + "you can drive\n"
            }
            else if tempAge2 > 18 && tempAge2 < 21
            {
                //self.labelField.text = "2"
                self.labelField.text = self.labelField.text! + "You can drive and vote!\n"
            }
            else if tempAge2 > 21
            {
                self.labelField.text = self.labelField.text! + "You can drink\n"
                //self.labelField.text = "3"
                //self.labelField.text = self.labelField.text! + "you can drive, vote and drink (but not at the same time!)\n"
            }
        }
        
        //self.labelField.text = "yo"
    }
    
}