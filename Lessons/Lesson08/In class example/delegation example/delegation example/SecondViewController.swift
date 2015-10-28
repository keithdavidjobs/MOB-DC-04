//
//  SecondViewController.swift
//  delegation example
//
//  Created by Tedi Konda on 10/21/15.
//  Copyright © 2015 Tedi Konda. All rights reserved.
//

import UIKit

protocol UpdateUsernameDelegate {
    func updateUsername(name: String)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    var delegate: UpdateUsernameDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveAndGoBack(sender: AnyObject) {
        self.delegate?.updateUsername(self.usernameField.text!)

        self.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
