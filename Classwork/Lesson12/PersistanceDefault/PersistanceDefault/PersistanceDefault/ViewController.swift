//
//  ViewController.swift
//  PersistanceDefault
//
//  Created by Shalev on 11/4/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var currentTheme = NSUserDefaults.standardUserDefaults().objectForKey("theme")
        
        if String(currentTheme!) == "light"
        {
            changeViewToLight()
        }
        else
        {
            changeViewToDark()
        }
        
        //self.helloLabel.text = String(currentTheme!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeViewToDark()
    {
        self.view.backgroundColor = UIColor.blackColor()
        self.helloLabel.textColor = UIColor.whiteColor()
    }
    
    func changeViewToLight()
    {
        self.view.backgroundColor = UIColor.whiteColor()
        self.helloLabel.textColor = UIColor.blackColor()
    }

    @IBAction func clickLight(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setObject("light", forKey: "theme")
        changeViewToLight()
    }

    @IBAction func clickDark(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setObject("dark", forKey: "theme")
        changeViewToDark()
    }
}

