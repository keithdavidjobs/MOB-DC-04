//
//  faceViewController.swift
//  Programmatic Views
//
//  Created by Shalev on 10/28/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController {

    let leftEye = UIView()
    let rightEye = UIView()
    let mouth = UIView()
    
    let toggleBtn = UIButton()
    
    var toggleState: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.leftEye.frame = CGRectMake(10, 10, 100, 100)
        self.leftEye.backgroundColor = UIColor.blueColor()
        self.view.addSubview(self.leftEye)
        
        self.rightEye.frame = CGRectMake(self.view.frame.width - 110, 10, 100, 100)
        self.rightEye.backgroundColor = UIColor.greenColor()
        self.view.addSubview(self.rightEye)
        
        self.mouth.frame = CGRectMake(10, self.view.frame.height - 50, self.view.frame.width - 20, 40)
        self.mouth.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.mouth)
        
        self.toggleBtn.setTitle("Toggle Size", forState: UIControlState.Normal)
        self.toggleBtn.frame = CGRectMake(20, 20, 100, 100)
        self.toggleBtn.sizeToFit()
        self.toggleBtn.backgroundColor = UIColor.grayColor()
        self.toggleBtn.addTarget(self, action: "toggleFace:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.toggleBtn)
        self.toggleBtn.frame.origin.x = self.view.frame.width / 2 - self.toggleBtn.frame.width / 2
        self.toggleBtn.frame.origin.y = self.view.frame.height / 2 - self.toggleBtn.frame.height / 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func toggleFace(sender: UIButton!)
    {
        if self.toggleState == 0
        {
            //make smaller
            UIView.animateWithDuration(1, animations: { () -> Void in
                self.leftEye.frame = CGRect(x: (self.view.frame.width / 2) - 55, y: (self.view.frame.height / 2) - 50, width: 50, height: 50)
                self.rightEye.frame = CGRect(x: (self.view.frame.width / 2) + 5, y: (self.view.frame.height / 2) - 50, width: 50, height: 50)
                self.mouth.frame = CGRect(x: (self.view.frame.width / 2) - (self.view.frame.width / 4), y: (self.view.frame.height / 2) + 20, width: self.view.frame.width / 2, height: 40)
            })
            self.toggleState = 1
        }
        else
        {
            //make full screen
            UIView.animateWithDuration(1, animations: { () -> Void in
                self.leftEye.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
                self.rightEye.frame = CGRect(x: self.view.frame.width - 110, y: 10, width: 100, height: 100)
                self.mouth.frame = CGRect(x: 10, y: self.view.frame.height - 50, width: self.view.frame.width - 20, height: 40)
            })
            self.toggleState = 0
        }
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
