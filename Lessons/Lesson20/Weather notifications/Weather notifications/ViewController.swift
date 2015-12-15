//
//  ViewController.swift
//  Weather notifications
//
//  Created by Tedi Konda on 12/7/15.
//  Copyright © 2015 Tedi Konda. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var weatherInfoLabel: UILabel!
    @IBOutlet weak var weatherCity: UITextField!
    @IBOutlet weak var weatherState: UITextField!
    
    let apiKey = "2de143494c0b295cca9337e1e96b00e0"
    var temp: Float?
    var condition: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherInfoLabel.alpha = 0
        UIApplication.sharedApplication().applicationIconBadgeNumber = 3
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    @IBAction func getCurrentWeather(sender: AnyObject) {
        let requestUrl = "http://api.openweathermap.org/data/2.5/weather?q=\(weatherCity.text!),\(weatherState.text!)&appid=\(apiKey)"
        
        Alamofire.request(.GET, requestUrl).responseJSON { (response) -> Void in
            let weatherJson = JSON(data: response.data!)
            self.weatherInfoLabel.text = "Today's temperature is \(weatherJson["main"]["temp"]) and \(weatherJson["weather"][0]["description"])."
            UIView.animateWithDuration(1, animations: { () -> Void in
                self.weatherInfoLabel.alpha = 1
            })
        }
    }
    


}

