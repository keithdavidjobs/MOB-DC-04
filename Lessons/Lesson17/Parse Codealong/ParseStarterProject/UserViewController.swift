//
//  UserViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Tedi Konda on 11/25/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class UserViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerUser(sender: AnyObject) {
        let user = PFUser()
        user.username = self.username.text!
        user.password = self.password.text!
        user.email = self.email.text!
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                print(errorString)
            } else {
                print("User created successfully!")
            }
        }
    }
    
    @IBAction func loginUser(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(self.username.text!, password:self.password.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                print("Logged in!")
            } else {
                print(error)
            }
        }
    }
    
    
    @IBAction func signOutUser(sender: AnyObject) {
        PFUser.logOut()
    }
    
    @IBAction func checkIfUserLoggedIn(sender: AnyObject) {
        let currentUser = PFUser.currentUser()
        if currentUser != nil {
            print("user is loggedin \(currentUser)")
        } else {
            print("User not logged in")
        }
    }
    
    

}
