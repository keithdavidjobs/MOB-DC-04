//
//  VC2.swift
//  Lesson08
//
//  Created by Shalev on 10/21/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import UIKit

protocol UpdateUsernameDelegate
{
    func updateUsername(name: String)
}

class VC2: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    
    var delegate: UpdateUsernameDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

    @IBAction func saveName(sender: AnyObject) {
        self.delegate?.updateUsername(self.nameText.text!)
        self.dismissViewControllerAnimated(true, completion: nil)
//        self.dismissViewControllerAnimated(true) { () -> Void in
//            //something
//        }
    }
}
