//
//  SaveJobsViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Cobo, Javier on 11/25/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class SaveJobsViewController: UIViewController {
    
    @IBOutlet weak var jobTitle: UITextField!

    @IBOutlet weak var city: UITextField!
    
    @IBOutlet weak var state: UITextField!
    
    @IBOutlet weak var salary: UITextField!
    
    @IBOutlet weak var experience: UITextField!

    @IBOutlet weak var jobDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveJobButton(sender: AnyObject) {
        let job = PFObject(className:"Jobs")
        job["title"] = self.jobTitle.text!
        job["city"] =  self.city.text!
        job["state"] = self.state.text!
        job["description"] = self.jobDescription.text!
        job["salary"] = Int(self.salary.text!)
        job["experience"] = Int(self.experience.text!)
        job.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                print("Successfully saved job")
            } else {
                print("There was an error :(")
            }
        }
    }

}
