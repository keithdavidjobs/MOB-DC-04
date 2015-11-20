//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

//Let asynchronous code run
XCPSetExecutionShouldContinueIndefinitely()

//XCPlaygroundPage.ne
var str = "Hello, playground"

////Step 1: Create NSURL object of the URL/API endpoint
//if let url = NSURL(string: "http://www.lifeofpeaceful.com")
//{
//    //Step 2: create the task
//    let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
//        //Do something with the data and see if there's an error
//        if error != nil
//        {
//            print("error: \(error)")
//        }
//        else
//        {
//            if let tempData = NSString(data: data!, encoding: NSUTF8StringEncoding)
//            {
//                print("data: \(tempData)")
//            }
//        }
//        print("response: \(response)")
//    })
//    //Step 3: resume/start task
//    task.resume()
//}

if let redditUrl = NSURL(string: "https://www.reddit.com/.json")
{
    let task = NSURLSession.sharedSession().dataTaskWithURL(redditUrl, completionHandler: { (data, response, error) -> Void in
        if error != nil
        {
            print("error: \(error)")
        }
        else
        {
            do
            {
                let redditJSON = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
                print(redditJSON)
                
                if let redditDict = redditJSON["data"] as? NSDictionary
                {
                    if let children = redditDict["children"] as? NSArray
                    {
                        for child in children
                        {
                            if let data = child["data"] as? NSDictionary
                            {
                                if let title = data["title"] as? NSString
                                {
                                    print(title)
                                }
                            }
                        }
//                        if let firstArticle = children[0] as? NSDictionary
//                        {
//                            if let data = firstArticle["data"] as? NSDictionary
//                            {
//                                if let title = data["title"] as? NSString
//                                {
//                                    print(title)
//                                }
//                            }
//                        }
                    }
                }
            }
            catch _
            {
                print("error")
            }
//            let redditString = NSString(data: data!, encoding: NSUTF8StringEncoding)
//            print(redditString)
        }
    })
    //task.resume()
}

if let mashableURL = NSURL(string: "http://www.mashable.com/stories.json")
{
    let task = NSURLSession.sharedSession().dataTaskWithURL(mashableURL, completionHandler: { (data, response, error) -> Void in
        if error != nil
        {
            print("error: \(error)")
        }
        else
        {
            do
            {
                let mashableJSON = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
                print(mashableJSON)
                
                if let mashableArray = mashableJSON["new"] as? NSArray
                {
                    for elem in mashableArray
                    {
                        let title = elem["title"] as? NSString
                        print(title)
                    }
                }
                
//                if let redditDict = redditJSON["data"] as? NSDictionary
//                {
//                    if let children = redditDict["children"] as? NSArray
//                    {
//                        for child in children
//                        {
//                            if let data = child["data"] as? NSDictionary
//                            {
//                                if let title = data["title"] as? NSString
//                                {
//                                    print(title)
//                                }
//                            }
//                        }
////                        if let firstArticle = children[0] as? NSDictionary
////                        {
////                            if let data = firstArticle["data"] as? NSDictionary
////                            {
////                                if let title = data["title"] as? NSString
////                                {
////                                    print(title)
////                                }
////                            }
////                        }
//                    }
//                }
            }
            catch _
            {
                print("error")
            }
        }
    })
    task.resume()
}
