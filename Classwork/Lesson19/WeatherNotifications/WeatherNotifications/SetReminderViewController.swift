//
//  SetReminderViewController.swift
//  WeatherNotifications
//
//  Created by Shalev on 12/7/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SetReminderViewController: UIViewController {

    @IBOutlet weak var dateField: UIDatePicker!
    @IBOutlet weak var setReminderButton: UIButton!
    
    let apiKey = "41f495072528f688d0616bdef72effe8"
    let appId = "2de143494c0b295cca9337e1e96b00e0"
    let baseUrl = "http://api.openweathermap.org/data/2.5/forecast"
    
    var jsonData: JSON?
    var tomorrowWeather: NSDictionary?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getFutureWeather { () -> Void in
            //print(self.tomorrowWeather)
        }
//        print(self.tomorrowWeather)
        self.setReminderButton.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getFutureWeather(completion: () -> Void)
    {
        //var firstCity: NSDictionary
        
        var tempDict = ["empty": "empty"]
        let tempParams = ["q": "Washington,DC", "appid": self.appId, "units": "imperial"]
        Alamofire.request(.GET, baseUrl, parameters: tempParams, encoding: .URL, headers: nil).response { (request, response, data, error) -> Void in
            if error != nil
            {
                print("error: \(error!)")
                return
            }
            self.jsonData = JSON(data: data!)
            self.tomorrowWeather = self.jsonData!["list"][0].rawValue as! NSDictionary
            UIView.animateWithDuration(1, animations: { () -> Void in
                self.setReminderButton.alpha = 1
            })
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion()
            })
        }
    }

    @IBAction func setReminder(sender: AnyObject) {
        let temp = self.tomorrowWeather!["main"]!["temp"] as! Int
        print(temp + 45)
        
        //Adding a notification
        var notification = UILocalNotification()
        notification.alertBody = "The weather today is \(temp)"
        notification.fireDate = self.dateField.date
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.category = "GA_WEATHER_CATEGORY"
        notification.userInfo = ["UUID": ["weather": "tomorrow", "date": self.dateField.date]]
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
        //Example of how to convert linux time to Date format
        //Method 1
//        let dt = self.tomorrowWeather!["dt"] as! NSTimeInterval
//        let givenDate = NSDate(timeIntervalSince1970: dt)
        
        
        //Method 2 (my method)
        print(self.tomorrowWeather!["dt"]!)
        let givenDate = NSDate(timeIntervalSince1970: NSTimeInterval(self.tomorrowWeather!["dt"]! as! Double))
        print(givenDate)
        
        //How to cancel a notification
//        var x = 0
//        if let notifications = UIApplication.sharedApplication().scheduledLocalNotifications
//        {
//            for notificationX in notifications
//            {
//                print("\(x): notificationX")
//                UIApplication.sharedApplication().cancelLocalNotification(notificationX)
//            }
//        }
    }
}
