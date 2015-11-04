//
//  ViewController.swift
//  Programmatic views
//
//  Created by Tedi Konda on 10/28/15.
//  Copyright © 2015 Tedi Konda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let head = UIView()
    let leftEye = UIView()
    let rightEye = UIView()
    let mouth = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawHead(self.view.frame.width / 2 - 100, y: self.view.frame.height / 2 - 100, width: 200, height: 200)
        
        self.view.addSubview(self.head)
        self.head.addSubview(self.leftEye)
        self.head.addSubview(self.rightEye)
        self.head.addSubview(self.mouth)
        
    }
    
    func drawMouth() {
        self.mouth.frame = CGRect(x: 0, y: self.head.frame.height - 50, width: self.head.frame.width, height: 50)
        self.mouth.backgroundColor = UIColor.redColor()
    }
    
    func drawEyes() {
        self.leftEye.frame = CGRect(x: 10, y: 10, width: self.head.frame.width / 10, height: self.head.frame.height / 10)
        self.leftEye.backgroundColor = UIColor.blueColor()
        
        self.rightEye.frame = CGRect(x: self.head.frame.width - (self.head.frame.width / 10) - 10, y: 10, width: self.head.frame.width / 10, height: self.head.frame.height / 10)
        self.rightEye.backgroundColor = UIColor.blueColor()
    }
    
    func drawHead(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        self.head.frame = CGRect(x: x, y: y, width: width, height: height)
        
        self.head.backgroundColor = UIColor.yellowColor()
        
        self.drawEyes()
        self.drawMouth()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func yellowBoxFullScreen(sender: AnyObject) {
        UIView.animateWithDuration(1) { () -> Void in
            self.drawHead(0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }
    }


}

