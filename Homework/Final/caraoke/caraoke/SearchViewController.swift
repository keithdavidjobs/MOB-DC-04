//
//  SearchViewController.swift
//  caraoke
//
//  Created by Shalev on 12/21/15.
//  Copyright © 2015 Keith. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class SearchViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchTable: UITableView!
    
    let youtubeSearch = "https://www.googleapis.com/youtube/v3/search"
    let youtubeVideos = "https://www.googleapis.com/youtube/v3/videos"
    var videosString = ""
    let apiKey = "AIzaSyDpTjRwD90798BV9TS7hGSsxrynRSwXYJE"
    
    var jsonData: JSON?
    var jsonDataVideos: JSON?
    var videoIDToPlay: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.searchTable.delegate = self
        self.searchField.delegate = self
        
        self.searchTable.rowHeight = UITableViewAutomaticDimension
        self.searchTable.estimatedRowHeight = 180.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("hello")
        if var tempSearch = self.searchField.text
        {
            if tempSearch.lowercaseString.rangeOfString("lyric") == nil
            {
                tempSearch += " lyrics"
            }
            print("search: \(tempSearch)")
            searchYouTube(tempSearch, completionHandler: {() -> Void in
                self.searchTable.reloadData()
            })
        }
        return true
    }
    
    
    func searchYouTube(search: String, completionHandler: () -> Void)
    {
        let tempParams = ["part": "snippet", "q": search, "key": apiKey, "maxResults": 25, "type": "video"]
        Alamofire.request(.GET, youtubeSearch, parameters: tempParams as! [String : AnyObject], encoding: .URL, headers: nil).response { (req, resp, data, error) -> Void in
                if error != nil
                {
                    print("error \(error)")
                    return
                }
                self.jsonData = JSON(data: data!)
                //print(self.jsonData!)
                self.videosString = ""
                //for video in self.jsonData!["items"] as! JSON
                let tempCount = self.jsonData!["items"].count
                for x in 0..<tempCount
                {
                    self.videosString += self.jsonData!["items"][x]["id"]["videoId"].string! + ","
                }
                self.videosString = String(self.videosString.characters.dropLast())
                let tempParams2 = ["part": "contentDetails", "id": self.videosString, "key": self.apiKey]
                Alamofire.request(.GET, self.youtubeVideos, parameters: tempParams2, encoding: .URL, headers: nil).response(completionHandler: { (reqV, respV, dataV, errorV) -> Void in
                    if error != nil
                    {
                        print("error getting contentDetails: \(error)")
                    }
                    self.jsonDataVideos = JSON(data: dataV!)
                    print(self.jsonDataVideos!)
                })
                print("videos \(self.videosString)")
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    completionHandler()
                })
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.videoIDToPlay = self.jsonData!["items"][indexPath.row]["id"]["videoId"].string!
        var singVC = self.storyboard?.instantiateViewControllerWithIdentifier("singVC") as! SingingViewController
//        addVC.delegate = self
        singVC.videoID = self.videoIDToPlay
        self.presentViewController(singVC, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("videoCell") as! SearchTableViewCell

        cell.videoThumb?.image = UIImage(data: NSData(contentsOfURL: NSURL(string: self.jsonData!["items"][indexPath.row]["snippet"]["thumbnails"]["default"]["url"].string as! String!)!)!)

        if indexPath.row % 2 == 0
        {
            cell.layer.borderColor = UIColor.redColor().CGColor
            cell.layer.backgroundColor = UIColor.grayColor().CGColor
        }
        else
        {
            cell.layer.borderColor = UIColor.blueColor().CGColor
        }
        cell.titleText?.text = self.jsonData!["items"][indexPath.row]["snippet"]["title"].string
        cell.descText?.text = self.jsonData!["items"][indexPath.row]["snippet"]["description"].string
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.jsonData != nil
        {
            return self.jsonData!["items"].count
        }
        return 0
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
