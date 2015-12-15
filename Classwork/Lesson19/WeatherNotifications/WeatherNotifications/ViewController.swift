//
//  ViewController.swift
//  WeatherNotifications
//
//  Created by Shalev on 12/7/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var stateText: UITextField!
    
    
    let apiKey = "41f495072528f688d0616bdef72effe8"
    let appId = "2de143494c0b295cca9337e1e96b00e0"
    let baseUrl = "http://api.openweathermap.org/data/2.5/weather"
    
    var temp: Float?
    var condition: String?
    
    var jsonData: JSON?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.resultsLabel.alpha = 0
        UIApplication.sharedApplication().applicationIconBadgeNumber = 3
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getCurrentWeather(sender: AnyObject) {
        if let tempCity = self.cityText.text
        {
            if let tempState = self.stateText.text
            {
                let tempParams = ["q": tempCity+","+tempState, "appid": self.appId, "units": "imperial"]
                Alamofire.request(.GET, baseUrl, parameters: tempParams, encoding: .URL, headers: nil).response(completionHandler: { (request, response, data, error) -> Void in
                    if error != nil
                    {
                        print("error: \(error)")
                        return
                    }
                    self.jsonData = JSON(data: data!)
                    print(self.jsonData)
                    let tempTemp = self.jsonData!["main"]["temp"].string
                    self.condition = self.jsonData!["weather"]["condition"].string
                    self.resultsLabel.text = "Main temp: \(tempTemp) and \(self.condition)"
                    UIView.animateWithDuration(1, animations: { () -> Void in
                        self.resultsLabel.alpha = 1
                    })
                })
            }
        }
    }

}

