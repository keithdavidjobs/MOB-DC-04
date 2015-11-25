//
//  ViewController.swift
//  Feedr
//
//  Created by Tedi Konda on 3/2/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UITableViewController {
    var tempData = ["Ena's tail is apperantly OK", "MOB Class is awesome", "Pigs sighted flying"]
    
    var redditData: JSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = NSURL(string: "http://www.reddit.com/.json") {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
                
                self.redditData = JSON(data: data!)
                print(self.redditData!)
                self.tableView.reloadData()
            })
            task.resume()
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.redditData != nil {
            return self.redditData!["data"]["children"].count
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        if cell == nil  {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "cell")
        }
        cell.textLabel?.text = self.redditData!["data"]["children"][indexPath.row]["data"]["title"].string
        let numberOfUps = self.redditData!["data"]["children"][indexPath.row]["data"]["ups"].int
        cell.detailTextLabel?.text = "Number of ups: \(numberOfUps!)"
        return cell
    }
    
    //on click
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if self.redditData != nil {
            let permalink = self.redditData!["data"]["children"][indexPath.row]["data"]["permalink"].string
            let url = NSURL(string: "http://www.reddit.com" + permalink!)
            performSegueWithIdentifier("web", sender: NSURLRequest(URL: url!))
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let request = sender as? NSURLRequest {
            let destinationViewController = segue.destinationViewController as! WebViewController
            destinationViewController.request = request
        }
    }


}

