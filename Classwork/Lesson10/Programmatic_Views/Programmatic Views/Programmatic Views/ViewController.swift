//
//  ViewController.swift
//  Programmatic Views
//
//  Created by Shalev on 10/28/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let yellowBox = UIView()
    let redBox = UIView()
    let myTextField = UITextField()

    @IBOutlet weak var moveYellow: UIButton!
    @IBOutlet weak var makeFullYellow: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.yellowBox.frame = CGRectMake(10, 10, 100, 100)
        self.yellowBox.backgroundColor = UIColor.yellowColor()
        
        self.view.addSubview(yellowBox)
        
        self.redBox.frame = CGRectMake(45, 45, 10, 10)
        self.redBox.backgroundColor = UIColor.redColor()
        self.yellowBox.addSubview(self.redBox)
        
        self.myTextField.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
        self.myTextField.backgroundColor = UIColor.greenColor()
        self.myTextField.text = "Hello World"
        
        self.view.addSubview(self.myTextField)
        
        //set zPositions
        self.yellowBox.layer.zPosition = 5
        //self.redBox.layer.zPosition = 2
        self.moveYellow.layer.zPosition = 41
        self.makeFullYellow.layer.zPosition = 3
        self.myTextField.layer.zPosition = 6
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func moveYellowBox(sender: AnyObject) {
        UIView.animateWithDuration(1) { () -> Void in
            self.redBox.frame = CGRect(x: 38, y: 38, width: 25, height: 25)
            self.yellowBox.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        }
    }

    @IBAction func makeYellowBoxFullScreen(sender: AnyObject) {
    
        UIView.animateWithDuration(1) { () -> Void in
            self.yellowBox.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            self.myTextField.frame.origin.y = 300
//            self.view.sendSubviewToBack(self.yellowBox)
//            self.yellowBox.layer.zPosition = 1
        }
    }
    
    @IBAction func showFace(sender: AnyObject) {
        let mouthVC = self.storyboard?.instantiateViewControllerWithIdentifier("faceVC") as! FaceViewController
        self.presentViewController(mouthVC, animated: true, completion: nil)
        
//        let otherVC = self.storyboard?.instantiateViewControllerWithIdentifier("OtherVC") as! OtherHeadViewController
//        self.presentViewController(otherVC, animated: true, completion: nil)
    }
}

