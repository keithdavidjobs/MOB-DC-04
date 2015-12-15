//
//  ViewController.swift
//  Kareoke
//
//  Created by Shalev on 12/3/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var searchYT: UITextField!
    //@IBOutlet weak var table: UITableView!
    
    let youtubeSearch = "https://www.googleapis.com/youtube/v3/search"
    let apiKey = "AIzaSyDpTjRwD90798BV9TS7hGSsxrynRSwXYJE"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.table.delegate = self
        searchYT.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        if segDisplayedContent.selectedSegmentIndex == 0 {
////            return channelsDataArray.count
////        }
////        else {
////            return videosArray.count
////        }
//     
//        return 0
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
////        let cell: UITableViewCell = UITableViewCell()
////        
////        return cell
//        
//        var cell: UITableViewCell!
// 
////        if segDisplayedContent.selectedSegmentIndex == 0 {
////            cell = tableView.dequeueReusableCellWithIdentifier("idCellChannel", forIndexPath: indexPath) as! UITableViewCell
////            let channelTitleLabel = cell.viewWithTag(10) as! UILabel
////            let channelDescriptionLabel = cell.viewWithTag(11) as! UILabel
////            let thumbnailImageView = cell.viewWithTag(12) as! UIImageView
////            
////            //print("count: \(channelsDataArray.count)")
////            
////            let channelDetails = channelsDataArray[indexPath.row]
////            channelTitleLabel.text = channelDetails["title"] as? String
////            channelDescriptionLabel.text = channelDetails["description"] as? String
////            thumbnailImageView.image = UIImage(data: NSData(contentsOfURL: NSURL(string: (channelDetails["thumbnail"] as? String)!)!)!)
////        }
////        else {
////            cell = tableView.dequeueReusableCellWithIdentifier("idCellVideo", forIndexPath: indexPath) as! UITableViewCell
////     
////            let videoTitle = cell.viewWithTag(10) as! UILabel
////            let videoThumbnail = cell.viewWithTag(11) as! UIImageView
////     
////            let videoDetails = videosArray[indexPath.row]
////            videoTitle.text = videoDetails["title"] as? String
////            videoThumbnail.image = UIImage(data: NSData(contentsOfURL: NSURL(string: (videoDetails["thumbnail"] as? String)!)!)!)
////        }    
//     
//        return cell
//    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        searchYouTube(self.searchYT.text!)
        return true
    }
    
    func searchYouTube(search: String)
    {
        print("search: \(search)")
        let tempParameters = ["key": apiKey, "q": search, "part": "snippet"]
        Alamofire.request(.GET, youtubeSearch, parameters: tempParameters, encoding: .URL, headers: nil).response { (request, response, data, error) -> Void in
            print(request)
            print(response)
            print(data)
            print(error)
        }
    }


}

