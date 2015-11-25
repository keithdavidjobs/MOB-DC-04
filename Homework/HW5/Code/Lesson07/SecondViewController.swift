//
//  SecondViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = NSUserDefaults.standardUserDefaults()

        self.textView.text = ""
        let userDefaults = NSUserDefaults.standardUserDefaults()
        self.textView.text = "name: " + userDefaults.stringForKey("settings_name")!
        self.textView.text = self.textView.text + "\nslider: " + String(userDefaults.floatForKey("settings_slider"))
//        if let settingsPath = NSBundle.mainBundle().pathForResource("Root", ofType: "plist", inDirectory: "Settings.bundle")
//        {
//            let settingsDictionary = NSDictionary(contentsOfFile: settingsPath)
//            //defaults.registerDefaults(<#T##registrationDictionary: [String : AnyObject]##[String : AnyObject]#>)
//            let specifiers = settingsDictionary!["PreferenceSpecifiers"] as! NSArray
//            
//            let temp_string = specifiers[1]["settings_name"]
//            let temp_slider = specifiers[2]["settings_slider"]
//            
//            self.textView.text = String(temp_string)
//            self.textView.text = self.textView.text + "\n" + String(temp_slider)
//            
////            for (key, val) in settingsDictionary!
////            {
////                self.textView.text = self.textView.text + "key: \(key), val: \(val)\n"
////            }
//        }
        
    }
}
