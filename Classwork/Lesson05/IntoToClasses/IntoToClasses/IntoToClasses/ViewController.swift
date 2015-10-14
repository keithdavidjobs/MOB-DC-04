//
//  ViewController.swift
//  IntoToClasses
//
//  Created by Shalev on 10/12/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelField: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var buttonField: UIButton!
    @IBAction func buttonAction(sender: AnyObject) {
        self.labelField.text = "Changed yo!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.labelField.text = "Hello World"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

