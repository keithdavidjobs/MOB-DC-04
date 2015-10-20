//
//  lockScreenViewController.swift
//  secretPlaybook
//
//  Created by Shalev on 10/19/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import UIKit

class lockScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animateWithDuration(1) { () -> Void in
            self.view.backgroundColor = UIColor.redColor()
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func swipeUp(sender: AnyObject) {
//        self.performSegueWithIdentifier("showMainScreen", sender: sender)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
