//
//  ViewController.swift
//  secretPlaybook
//
//  Created by Shalev on 10/19/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showRoster(sender: AnyObject) {
        self.performSegueWithIdentifier("showRoster", sender: sender)
    }
    
    @IBAction func openNotes(sender: AnyObject) {
        self.performSegueWithIdentifier("showNotes", sender: sender)
    }
    
    @IBAction func showLockScreen(sender: AnyObject) {
        self.performSegueWithIdentifier("showLockScreen", sender: sender)
    }
}

