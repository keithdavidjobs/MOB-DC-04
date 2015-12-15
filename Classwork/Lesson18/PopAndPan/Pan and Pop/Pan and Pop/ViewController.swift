//
//  ViewController.swift
//  Pan and Pop
//
//  Created by Shalev on 12/2/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import UIKit
import pop

class ViewController: UIViewController, POPAnimationDelegate {

    @IBOutlet weak var ball: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.ball.userInteractionEnabled = true
        self.ball.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "ballPanned:"))
        
        
    }
    
    func animateBall()
    {
//        let ballAnimation = POPSpringAnimation(propertyNamed: kPOPViewCenter)
//        let ballAnimation = POPDecayAnimation(propertyNamed: kPOPViewCenter)
//        var ballAnimation = POPBasicAnimation(propertyNamed: kPOPViewCenter)
        let ballAnimation = POPBasicAnimation.easeInAnimation()
//        ballAnimation.fromValue = NSValue(CGPoint: self.ball.center)
        ballAnimation.toValue = NSValue(CGPoint: CGPoint(x: self.view.center.x, y: self.view.center.y))
//        ballAnimation.velocity = NSValue(CGPoint: CGPoint(x: 1000, y: 1000))
        ballAnimation.duration = 3
        ballAnimation.delegate = self
//        ballAnimation.springBounciness = 15
        //POPBasicAnimation.easeInAnimation()
        self.ball.pop_addAnimation(ballAnimation, forKey: nil)
    }
    
    func pop_animationDidStop(anim: POPAnimation!, finished: Bool) {
        //code
        print("animation stopped")
    }
    
    func pop_animationDidStart(anim: POPAnimation!) {
        print("animation started")
    }
    
    func pop_animationDidApply(anim: POPAnimation!) {
        print("before starting to move")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ballPanned(pan: UIPanGestureRecognizer)
    {
        //code
        print("panning")
        switch pan.state
        {
            case .Began:
                print("began pan")
                self.ball.pop_removeAllAnimations()
            case .Changed:
                self.ball.center = pan.locationInView(self.view)
                print("changed: \(self.ball.center)")
            case .Ended:
                print("ended")
                animateBall()
            case .Failed:
                print("failed")
            case .Cancelled:
                print("cancelled")
            case .Possible:
                print("possible")
            default:
                break
        }
//        self.ball.layer.position.x = pan.
    }


}

