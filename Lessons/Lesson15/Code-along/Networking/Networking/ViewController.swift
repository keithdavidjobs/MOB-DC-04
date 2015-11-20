//
//  ViewController.swift
//  Networking
//
//  Created by Tedi Konda on 11/18/15.
//  Copyright © 2015 Tedi Konda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        // Step 1: Create NSURL object of the URL/API endpoint
//        if let url = NSURL(string: "http://www.google.com") {
//            // Step 2: create the task
//            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
//                // Do something with the data and see if there's an error
//                if error == nil {
//                    let googleSource = NSString(data: data!, encoding: NSUTF8StringEncoding)
//                    print(googleSource)
//                }else {
//                    print("There was an error talking to the google")
//                }
//            })
//            // Step 3: resume/start task
//            task.resume()
//        }
        if let redditUrl = NSURL(string: "https://www.reddit.com/.json") {
            let task = NSURLSession.sharedSession().dataTaskWithURL(redditUrl, completionHandler: { (data, response, error) -> Void in
//                let redditString = NSString(data: data!, encoding: NSUTF8StringEncoding)
//                print(redditString)
                let redditJson = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
//                print(redditJson)
                
                if let redditData = redditJson["data"] as? NSDictionary {
                    if let children = redditData["children"] as? NSArray {
                        for child in children {
                            if let data = child["data"] as? NSDictionary {
                                if let title = data["title"] as? NSString {
                                    print(title)
                                }
                            }
                        }
                    }
                }
            })
            task.resume()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

