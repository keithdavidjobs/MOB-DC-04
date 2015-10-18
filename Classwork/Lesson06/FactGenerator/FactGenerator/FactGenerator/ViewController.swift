//
//  ViewController.swift
//  FactGenerator
//
//  Created by Shalev on 10/14/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var gButton: UIButton!
    @IBOutlet weak var factLabel: UILabel!
    var facts = Factbook()
    var colors = Colorwheel(redColor: 0, greenColor: 0, blueColor: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.factLabel.text = "You have not yet generated a random fact"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func generateFactAction(sender: AnyObject)
    {
        self.factLabel.text = self.facts.getRandomFact()
        //self.view.backgroundColor = UIColor.redColor()
        var colorTuple = self.colors.getRandomColor()
        self.view.backgroundColor = UIColor(red: colorTuple.redColor, green: colorTuple.greenColor, blue: colorTuple.blueColor, alpha: 1)
        self.gButton.setTitleColor(UIColor(red: colorTuple.redColor, green: colorTuple.greenColor, blue: colorTuple.blueColor, alpha: 1), forState: UIControlState.Normal)
        
        colorTuple = self.colors.getRandomColor()
        self.factLabel.textColor = UIColor(red: colorTuple.redColor, green: colorTuple.greenColor, blue: colorTuple.blueColor, alpha: 1)
        
    }

}

