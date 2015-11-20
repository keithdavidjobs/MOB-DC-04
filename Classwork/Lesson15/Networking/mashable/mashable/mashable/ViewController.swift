//
//  ViewController.swift
//  mashable
//
//  Created by Shalev on 11/18/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let mashableUrl = NSURL(string: "http://www.mashable.com/stories.json")
        {
            let task = NSURLSession.sharedSession().dataTaskWithURL(mashableUrl, completionHandler: { (data, response, error) -> Void in
                if error != nil
                {
                    print("error: \(error)")
                }
                else
                {
                    do
                    {
                        let mashableJSON = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
                        
                        if let mashableDict = mashableJSON["new"] as? NSArray
                        {
                            for child in mashableDict
                            {
                                if let author = child["author"] as? NSString
                                {
                                    if let title = child["title"] as? NSString
                                    {
                                        print("author: \(author), title: \(title)")
                                    }
                                }
                            }
                        }
                    }
                    catch _
                    {
                        print("error")
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

