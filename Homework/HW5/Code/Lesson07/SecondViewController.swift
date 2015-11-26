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
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "defaultsChanged", 
                              name: NSUserDefaultsDidChangeNotification, object: nil)
        configureAppearance()
        
    }
    
    func defaultsChanged() {
      configureAppearance()
    }

    private func configureAppearance() {
      let userDefaults = NSUserDefaults.standardUserDefaults()
      var name_field: String
      if let temp_name = userDefaults.stringForKey("settings_name")
      {
        name_field = temp_name
      }
      else
      {
        name_field = " "
      }
      self.textView.text = name_field + "\n" + String(userDefaults.floatForKey("settings_slider"))
    }
}
