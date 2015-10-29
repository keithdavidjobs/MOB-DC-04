//
//  ViewController.swift
//  Lesson08
//
//  Created by Shalev on 10/21/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UpdateUsernameDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUsername(name: String) {
        self.nameLabel.text = name
        print(name)
    }

    @IBAction func changeName(sender: AnyObject)
    {
//        let secondVC = self.storyboard?.instantiateViewControllerWithIdentifier("newVC") as! VC2
//        
//        secondVC.delegate = self
//        self.presentViewController(secondVC, animated: true, completion: nil)
//        self.performSegueWithIdentifier("changeNameSeque", sender: sender)
    }
    
}

