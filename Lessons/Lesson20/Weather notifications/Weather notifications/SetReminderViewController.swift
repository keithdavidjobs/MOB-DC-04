//
//  SetReminderViewController.swift
//  Weather notifications
//
//  Created by Tedi Konda on 12/7/15.
//  Copyright © 2015 Tedi Konda. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SetReminderViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var setReminderButton: UIButton!
    
    var apiKey = "2de143494c0b295cca9337e1e96b00e0"
    var tomorrowWeather: NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setReminderButton.alpha = 0
        getFutureWeather()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func getFutureWeather() {
        Alamofire.request(.GET, "http://api.openweathermap.org/data/2.5/forecast?q=washington,dc&appid=\(apiKey)").responseJSON { (response) -> Void in
            let weatherJson = JSON(data: response.data!)

            self.tomorrowWeather = weatherJson["list"][0].rawValue as? NSDictionary
            
            UIView.animateWithDuration(1, animations: { () -> Void in
                self.setReminderButton.alpha = 1
            })
        }
    }
    
    @IBAction func setReminder(sender: AnyObject) {
        let temp = self.tomorrowWeather!["main"]!["temp"]
        
        let notfication = UILocalNotification()
        
        notfication.alertBody = "The weather today is \(temp!)."
        notfication.fireDate = datePicker.date
        notfication.soundName = UILocalNotificationDefaultSoundName
        notfication.category = "GA_WEATHER_CATEGORY"
        notfication.userInfo = ["UUID": ["weather": "tomorrow", "date": datePicker.date]]
        UIApplication.sharedApplication().scheduleLocalNotification(notfication)
        
        
        // Example of how to convert linux time to Date format
//        var dt = self.tomorrowWeather!["dt"] as! NSTimeInterval
//        let givenDate = NSDate(timeIntervalSince1970: dt)
        
//        // Iterate over all current local notifications
//        if let notifications = UIApplication.sharedApplication().scheduledLocalNotifications {
//            for notification in notifications {
//                // Clear single notification
//                UIApplication.sharedApplication().cancelLocalNotification(notification)       
//            }
//        }
//        // Clear all notifications
//        UIApplication.sharedApplication().cancelAllLocalNotifications()
        

    }
    

}
