//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

//Let asynchronous code run
XCPSetExecutionShouldContinueIndefinitely()


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
//    task.resume()
}
