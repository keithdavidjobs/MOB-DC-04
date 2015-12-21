//
//  ViewController.swift
//  caraoke
//
//  Created by Shalev on 12/21/15.
//  Copyright © 2015 Keith. All rights reserved.
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

    @IBAction func cickMic(sender: AnyObject) {
        var searchVC = self.storyboard?.instantiateViewControllerWithIdentifier("searchVC") as! SearchViewController
//        addVC.delegate = self
        self.presentViewController(searchVC, animated: true, completion: nil)
    }

}

