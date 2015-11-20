//
//  ViewController.swift
//  Networking
//
//  Created by Shalev on 11/18/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Step 1: Create NSURL object of the URL/API endpoint
        if let url = NSURL(string: "http://www.gasdoogle.com")
        {
            //Step 2: create the task
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
                //Do something with the data and see if there's an error
                if error != nil
                {
                    print("error: \(error)")
                }
                else
                {
                    if let tempData = NSString(data: data!, encoding: NSUTF8StringEncoding)
                    {
                        print("data: \(tempData)")
                    }
                }
                print("response: \(response)")
            })
            //Step 3: resume/start task
            task.resume()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

