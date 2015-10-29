//
//  OtherHeadViewController.swift
//  Programmatic Views
//
//  Created by Shalev on 10/28/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import UIKit

class OtherHeadViewController: UIViewController {

    let mouth = UIView()
    let leftEye = UIView()
    let rightEye = UIView()
    let head = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        drawHead()
        self.view.addSubview(self.head)
        self.head.addSubview(self.leftEye)
        self.head.addSubview(self.rightEye)
        self.head.addSubview(self.mouth)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawMouth()
    {
        self.mouth.frame = CGRect(x: 0, y: self.head.frame.origin.y - 50, width: self.head.frame.width, height: 50)
        self.mouth.backgroundColor = UIColor.redColor()
    }
    
    func drawEyes()
    {
        self.leftEye.frame = CGRect(x: 10, y: 10, width: self.head.frame.width / 10, height: self.head.frame.height / 10)
        self.leftEye.backgroundColor = UIColor.blueColor()
        
        self.rightEye.frame = CGRect(x: self.head.frame.width - (self.head.frame.width / 10) - 10, y: 10, width: self.head.frame.width / 10, height: self.head.frame.height / 10)
        self.rightEye.backgroundColor = UIColor.blueColor()
    }
    
    func drawHead()
    {
        self.head.frame = CGRect(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2 - 100, width: 200, height: 200)
        self.head.backgroundColor = UIColor.yellowColor()
        self.drawEyes()
        self.drawMouth()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
