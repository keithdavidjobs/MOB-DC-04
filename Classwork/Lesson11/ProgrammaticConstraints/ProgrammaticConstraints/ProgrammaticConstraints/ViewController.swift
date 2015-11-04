//
//  ViewController.swift
//  ProgrammaticConstraints
//
//  Created by Shalev on 11/2/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var head: UIView!
    
    var body = UIView()
    var leftArm = UIView()
    var rightArm = UIView()
    var leftLeg = UIView()
    var rightLeg = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        drawLeftLeg()
        drawBody()
        drawLeftArm()
        drawRightArm()
        drawLeftLeg()
        drawRightLeg()
        
        
        UIView.animateWithDuration(1, animations: <#T##() -> Void#>)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Create body
    func drawBody()
    {
        self.body.backgroundColor = UIColor.blueColor()
        
        //First step add our main objet to the superview
        self.view.addSubview(self.body)
        
        self.body.translatesAutoresizingMaskIntoConstraints = false
        
        let bodyWidth = NSLayoutConstraint(
        item: self.body,
        attribute: NSLayoutAttribute.Width,
        relatedBy: NSLayoutRelation.Equal,
        toItem: self.head,
        attribute: NSLayoutAttribute.Width,
        multiplier: 0.5,
        constant: 0)
        
        let bodyVerticalPos = NSLayoutConstraint(
        item: self.body,
        attribute: NSLayoutAttribute.Top,
        relatedBy: NSLayoutRelation.Equal,
        toItem: self.head,
        attribute: NSLayoutAttribute.Bottom,
        multiplier: 1,
        constant: 0)
        
//        let bodyBottomPos = NSLayoutConstraint(
//        item: self.body,
//        attribute: NSLayoutAttribute.Bottom,
//        relatedBy: NSLayoutRelation.Equal,
//        toItem: self.view,
//        attribute: NSLayoutAttribute.Bottom,
//        multiplier: 1,
//        constant: 0)
        
        let bodyHorizontalPos = NSLayoutConstraint(
        item: self.body,
        attribute: NSLayoutAttribute.Leading,
        relatedBy: NSLayoutRelation.Equal,
        toItem: self.head,
        attribute: NSLayoutAttribute.Leading,
        multiplier: 1,
        constant: self.head.frame.width / 4)
        
        self.view.addConstraints([bodyWidth, bodyVerticalPos, bodyHorizontalPos])
    }
    
    // MARK: Create left arm
    func drawLeftArm()
    {
        self.leftArm.backgroundColor = UIColor.brownColor()
        
        self.view.addSubview(self.leftArm)
        
        self.leftArm.translatesAutoresizingMaskIntoConstraints = false
        
        let leftArmLeading = NSLayoutConstraint(
        item: self.leftArm,
        attribute: NSLayoutAttribute.Leading,
        relatedBy: NSLayoutRelation.Equal,
        toItem: self.view,
        attribute: NSLayoutAttribute.Leading,
        multiplier: 1,
        constant: 20)
        
        let leftArmTrailing = NSLayoutConstraint(
        item: self.leftArm,
        attribute: NSLayoutAttribute.Trailing,
        relatedBy: NSLayoutRelation.Equal,
        toItem: self.body,
        attribute: NSLayoutAttribute.Leading,
        multiplier: 1,
        constant: 0)
        
        let leftArmTopPos = NSLayoutConstraint(
        item: self.leftArm,
        attribute: NSLayoutAttribute.Top,
        relatedBy: NSLayoutRelation.Equal,
        toItem: self.head,
        attribute: NSLayoutAttribute.Bottom,
        multiplier: 1,
        constant: 20)
        
        let leftArmHeight = NSLayoutConstraint(
        item: self.leftArm,
        attribute: NSLayoutAttribute.Height,
        relatedBy: NSLayoutRelation.Equal,
        toItem: nil,
        attribute: NSLayoutAttribute.Height,
        multiplier: 0,
        constant: 30)
        
        self.view.addConstraints([leftArmHeight, leftArmLeading, leftArmTopPos, leftArmTrailing])
    }
    
    // MARK: draw right arm
    func drawRightArm()
    {
        self.rightArm.backgroundColor = UIColor.brownColor()
        
        self.view.addSubview(self.rightArm)
        
        self.rightArm.translatesAutoresizingMaskIntoConstraints = false
        
        let rightArmLeading = NSLayoutConstraint(
        item: self.rightArm,
        attribute: NSLayoutAttribute.Leading,
        relatedBy: NSLayoutRelation.Equal,
        toItem: self.body,
        attribute: NSLayoutAttribute.Trailing,
        multiplier: 1,
        constant: 0)
        
        let rightArmTrailing = NSLayoutConstraint(
        item: self.rightArm,
        attribute: NSLayoutAttribute.Trailing,
        relatedBy: NSLayoutRelation.Equal,
        toItem: self.view,
        attribute: NSLayoutAttribute.Trailing,
        multiplier: 1,
        constant: -20)
        
        let rightArmTopPos = NSLayoutConstraint(
        item: self.rightArm,
        attribute: NSLayoutAttribute.Top,
        relatedBy: NSLayoutRelation.Equal,
        toItem: self.head,
        attribute: NSLayoutAttribute.Bottom,
        multiplier: 1,
        constant: 20)
        
        let rightArmHeight = NSLayoutConstraint(
        item: self.rightArm,
        attribute: NSLayoutAttribute.Height,
        relatedBy: NSLayoutRelation.Equal,
        toItem: nil,
        attribute: NSLayoutAttribute.Height,
        multiplier: 0,
        constant: 30)
        
        self.view.addConstraints([rightArmHeight, rightArmLeading, rightArmTopPos, rightArmTrailing])
    }
    
    // MARK: draw left leg
    func drawLeftLeg()
    {
        self.leftLeg.backgroundColor = UIColor.brownColor()
        
        self.view.addSubview(self.leftLeg)
        
        self.leftLeg.translatesAutoresizingMaskIntoConstraints = false
        
        let leftLegBottom = NSLayoutConstraint(
        item: self.leftLeg,
        attribute: NSLayoutAttribute.Bottom,
        relatedBy: NSLayoutRelation.Equal,
        toItem: self.view,
        attribute: NSLayoutAttribute.Bottom,
        multiplier: 1,
        constant: 0)
        
        let leftLegWidth = NSLayoutConstraint(
        item: self.leftLeg,
        attribute: NSLayoutAttribute.Width,
        relatedBy: NSLayoutRelation.Equal,
        toItem: self.body,
        attribute: NSLayoutAttribute.Width,
        multiplier: 1,
        constant: 0)
        
        let leftLegTrailing = NSLayoutConstraint(
        item: self.leftLeg,
        attribute: NSLayoutAttribute.Trailing,
        relatedBy: NSLayoutRelation.Equal,
        toItem: self.body,
        attribute: NSLayoutAttribute.Leading,
        multiplier: 1,
        constant: 0)
        
        let leftLegHeight = NSLayoutConstraint(
        item: self.leftLeg,
        attribute: NSLayoutAttribute.Height,
        relatedBy: NSLayoutRelation.Equal,
        toItem: self.view,
        attribute: NSLayoutAttribute.Height,
        multiplier: 0.2,
        constant: 0)
        
        self.view.addConstraints([leftLegBottom, leftLegHeight, leftLegTrailing, leftLegWidth])
        
        updateBodyOnLeg()
    }
    
    func drawRightLeg()
    {
        self.rightLeg.backgroundColor = UIColor.brownColor()
    
        self.view.addSubview(self.rightLeg)
        
        self.rightLeg.translatesAutoresizingMaskIntoConstraints = false
        
        let rightLegLeading = NSLayoutConstraint(
        item: self.rightLeg,
        attribute: NSLayoutAttribute.Leading,
        relatedBy: NSLayoutRelation.Equal,
        toItem: self.body,
        attribute: NSLayoutAttribute.Trailing,
        multiplier: 1,
        constant: 0)
        
        let rightLegWidth = NSLayoutConstraint(
        item: self.rightLeg,
        attribute: NSLayoutAttribute.Width,
        relatedBy: NSLayoutRelation.Equal,
        toItem: self.leftLeg,
        attribute: NSLayoutAttribute.Width,
        multiplier: 1,
        constant: 0)
        
        let rightLegBottom = NSLayoutConstraint(
        item: self.rightLeg,
        attribute: NSLayoutAttribute.Bottom,
        relatedBy: NSLayoutRelation.Equal,
        toItem: self.view,
        attribute: NSLayoutAttribute.Bottom,
        multiplier: 1,
        constant: 0)
        
        let rightLegHeight = NSLayoutConstraint(
        item: self.rightLeg,
        attribute: NSLayoutAttribute.Height,
        relatedBy: NSLayoutRelation.Equal,
        toItem: self.leftLeg,
        attribute: NSLayoutAttribute.Height,
        multiplier: 1,
        constant: 0)
        
        self.view.addConstraints([rightLegBottom, rightLegHeight, rightLegLeading, rightLegWidth])
        
    }
    
    func updateBodyOnLeg()
    {
        let bodyBottomPos = NSLayoutConstraint(
        item: self.body,
        attribute: NSLayoutAttribute.Bottom,
        relatedBy: NSLayoutRelation.Equal,
        toItem: self.leftLeg,
        attribute: NSLayoutAttribute.Top,
        multiplier: 1,
        constant: 0)
        
        self.view.addConstraint(bodyBottomPos)
    }


}

