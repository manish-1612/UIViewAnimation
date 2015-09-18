//
//  ViewController.swift
//  ViewAnimationPractice
//
//  Created by Manish Kumar on 15/09/15.
//  Copyright (c) 2015 Innofied Solutions Pvt. Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var iOSLabel: UILabel!
    @IBOutlet weak var swiftAnimationLabel: UILabel!
    var animatingView : UIView!
    var button1 : UIButton!
    var button2 : UIButton!
    var button3 : UIButton!

    
    // MARK :- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        iOSLabel.hidden = true
        swiftAnimationLabel.hidden = true
        
        //animateUILabel()
        //draw8WithAnimation()
        //animateViewWithUIBezierPath()
        //makeAnimatingText()
        makeSpringAnimation()
        
    }
    
    
    func draw8WithAnimation(){
        
        var path = UIBezierPath()
        
        // ----------------------------------------------------------------
        //  drawing parth for 8
        // ----------------------------------------------------------------
        path.moveToPoint(CGPoint(x: 160.0, y: 50.0))
        path.addCurveToPoint(CGPoint(x: 210.0, y: 100.0), controlPoint1: CGPoint(x: 185.0, y: 50.0), controlPoint2: CGPoint(x: 210.0, y: 75.0))
        path.addCurveToPoint(CGPoint(x: 160.0, y: 150.0), controlPoint1: CGPoint(x: 210.0, y: 125.0), controlPoint2: CGPoint(x: 185.0, y: 150.0))
        path.addCurveToPoint(CGPoint(x: 110.0, y: 200.0), controlPoint1: CGPoint(x: 135.0, y: 150.0), controlPoint2: CGPoint(x: 110.0, y: 175.0))
        path.addCurveToPoint(CGPoint(x: 160.0, y: 250.0), controlPoint1: CGPoint(x: 110.0, y: 225.0), controlPoint2: CGPoint(x: 135.0, y: 250.0))
        path.addCurveToPoint(CGPoint(x: 210.0, y: 200.0), controlPoint1: CGPoint(x: 185.0, y: 250.0), controlPoint2: CGPoint(x: 210.0, y: 225.0))
        path.addCurveToPoint(CGPoint(x: 160.0, y: 150.0), controlPoint1: CGPoint(x: 210.0, y: 175.0), controlPoint2: CGPoint(x: 185.0, y: 150.0))
        path.addCurveToPoint(CGPoint(x: 110.0, y: 100.0), controlPoint1: CGPoint(x: 135.0, y: 150.0), controlPoint2: CGPoint(x: 110.0, y: 125.0))
        path.addCurveToPoint(CGPoint(x: 160.0, y: 50.0), controlPoint1: CGPoint(x: 110.0, y: 75.0), controlPoint2: CGPoint(x: 135.0, y: 50.0))
        path.closePath()
        
        
        var pathLayer = CAShapeLayer()
        pathLayer.frame = view.bounds
        pathLayer.path = path.CGPath
        pathLayer.strokeColor = UIColor.redColor().CGColor
        pathLayer.fillColor = nil
        pathLayer.lineWidth = 1.0
        pathLayer.lineJoin = kCALineJoinBevel
        view.layer.addSublayer(pathLayer)
        
        
        var pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 2.0
        pathAnimation.fromValue = 0.0
        pathAnimation.toValue = 1.0
        pathLayer.addAnimation(pathAnimation, forKey: "strokeEnd")
    }
    
    
    func animateUILabel(){
        
        iOSLabel.hidden = false
        swiftAnimationLabel.hidden = false

        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
            self.swiftAnimationLabel.center = CGPoint(x: self.swiftAnimationLabel.center.x, y: 200.0)
        }, completion: nil)
        
        
        UIView.animateWithDuration(3.0, delay: 0.5, usingSpringWithDamping: 0.25, initialSpringVelocity: 10.0, options: nil, animations: { () -> Void in
            self.iOSLabel.center = CGPoint(x: self.iOSLabel.center.x, y: 350.0)
            }, completion: nil)

    }
    
    func animateViewWithUIBezierPath(){
        
        var path = UIBezierPath()
        // ----------------------------------------------------------------
        //  drawing path for 8
        // ----------------------------------------------------------------
        path.moveToPoint(CGPoint(x: 160.0, y: 50.0))
        path.addCurveToPoint(CGPoint(x: 210.0, y: 100.0), controlPoint1: CGPoint(x: 185.0, y: 50.0), controlPoint2: CGPoint(x: 210.0, y: 75.0))
        path.addCurveToPoint(CGPoint(x: 160.0, y: 150.0), controlPoint1: CGPoint(x: 210.0, y: 125.0), controlPoint2: CGPoint(x: 185.0, y: 150.0))
        path.addCurveToPoint(CGPoint(x: 110.0, y: 200.0), controlPoint1: CGPoint(x: 135.0, y: 150.0), controlPoint2: CGPoint(x: 110.0, y: 175.0))
        path.addCurveToPoint(CGPoint(x: 160.0, y: 250.0), controlPoint1: CGPoint(x: 110.0, y: 225.0), controlPoint2: CGPoint(x: 135.0, y: 250.0))
        path.addCurveToPoint(CGPoint(x: 210.0, y: 200.0), controlPoint1: CGPoint(x: 185.0, y: 250.0), controlPoint2: CGPoint(x: 210.0, y: 225.0))
        path.addCurveToPoint(CGPoint(x: 160.0, y: 150.0), controlPoint1: CGPoint(x: 210.0, y: 175.0), controlPoint2: CGPoint(x: 185.0, y: 150.0))
        path.addCurveToPoint(CGPoint(x: 110.0, y: 100.0), controlPoint1: CGPoint(x: 135.0, y: 150.0), controlPoint2: CGPoint(x: 110.0, y: 125.0))
        path.addCurveToPoint(CGPoint(x: 160.0, y: 50.0), controlPoint1: CGPoint(x: 110.0, y: 75.0), controlPoint2: CGPoint(x: 135.0, y: 50.0))
        path.closePath()
        
        
        var pathLayer = CAShapeLayer()
        pathLayer.frame = view.bounds
        pathLayer.path = path.CGPath
        pathLayer.strokeColor = UIColor.blueColor().CGColor
        pathLayer.fillColor = nil
        pathLayer.lineWidth = 1.0
        pathLayer.strokeStart = 0.0
        pathLayer.strokeEnd = 0.1
        pathLayer.lineJoin = kCALineJoinBevel
        view.layer.addSublayer(pathLayer)

        var pathAnimationStart = CABasicAnimation(keyPath: "strokeStart")
        pathAnimationStart.toValue = 0.8

        var pathAnimationStop = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimationStop.toValue = 1.0
        
        var animationGroup = CAAnimationGroup()
        animationGroup.animations = [pathAnimationStart , pathAnimationStop]
        animationGroup.duration = 0.5
        animationGroup.repeatCount = HUGE
        animationGroup.autoreverses = false
        pathLayer.addAnimation(animationGroup, forKey: "animateView")
    }
    
    
    func makeAnimatingText(){
        
        var baseView = UIView(frame: CGRect(x: 0.0, y: 250.0, width:self.view.frame.size.width, height: 1.0))
        baseView.backgroundColor = UIColor.redColor()
        //self.view.addSubview(baseView)
        
        var baseView2 = UIView(frame: CGRect(x: 0.0, y: 235.0, width:self.view.frame.size.width, height: 1.0))
        baseView2.backgroundColor = UIColor.redColor()
        //self.view.addSubview(baseView2)

        
        var path = UIBezierPath()
        // ----------------------------------------------------------------
        //  drawing path for MANISH
        // ----------------------------------------------------------------
        
        //path for M
        path.moveToPoint(CGPoint(x: 25.0, y: 250.0))
        path.addLineToPoint(CGPoint(x: 35.0, y: 210.0))
        path.addLineToPoint(CGPoint(x: 42.0, y: 235.0))
        path.addLineToPoint(CGPoint(x: 55.0, y: 210.0))
        path.addLineToPoint(CGPoint(x: 45.0, y: 248.0))
        
        path.addCurveToPoint(CGPoint(x: 50.0, y: 248.0), controlPoint1: CGPoint(x: 47.0, y: 250.0), controlPoint2: CGPoint(x: 48.0, y: 250.0))
        
        
        //path for a
        path.addLineToPoint(CGPoint(x: 60.0, y: 235.0))
        path.addCurveToPoint(CGPoint(x: 68.0, y: 235.0), controlPoint1: CGPoint(x: 62.50, y: 232.0), controlPoint2: CGPoint(x: 65.5, y: 232.0))
        path.moveToPoint(CGPoint(x: 54.0, y: 243.0))
        path.addCurveToPoint(CGPoint(x: 68.0, y: 235.0), controlPoint1: CGPoint(x: 56.5, y: 252.0), controlPoint2: CGPoint(x: 66.0, y: 252.0))
        path.moveToPoint(CGPoint(x: 66.0, y: 244.0))
        path.addCurveToPoint(CGPoint(x: 73.0, y: 245.0), controlPoint1: CGPoint(x: 67.0, y: 250.0), controlPoint2: CGPoint(x: 70.0, y: 250.0))
        
        //path for n
        path.addLineToPoint(CGPoint(x: 80.0, y: 237.0))
        path.addCurveToPoint(CGPoint(x: 85.0, y: 235.0), controlPoint1: CGPoint(x: 83.0, y: 232.0), controlPoint2: CGPoint(x: 84.0, y: 232.0))
        path.addLineToPoint(CGPoint(x: 80.0, y: 250.0))
        path.moveToPoint(CGPoint(x: 84.0, y: 240.0))
        path.addCurveToPoint(CGPoint(x: 94.0, y: 240.0), controlPoint1: CGPoint(x: 90.0, y: 232.0), controlPoint2: CGPoint(x: 93.0, y: 232.0))
        path.addLineToPoint(CGPoint(x: 91.0, y: 248.0))
        path.addCurveToPoint(CGPoint(x: 97.0, y: 248.0), controlPoint1: CGPoint(x: 92.0, y: 250.0), controlPoint2: CGPoint(x: 96.0, y: 250.0))
        
        //path for i
        path.addLineToPoint(CGPoint(x: 101.0, y: 236.0))
        path.moveToPoint(CGPoint(x: 101.0, y: 234.0))
        path.addLineToPoint(CGPoint(x: 103.0, y: 232.0))
        path.moveToPoint(CGPoint(x: 97.0, y: 248.0))
        path.addCurveToPoint(CGPoint(x: 102.0, y: 248.0), controlPoint1: CGPoint(x: 98.0, y: 250.0), controlPoint2: CGPoint(x: 101.0, y: 250.0))

        
        //path for s
        path.addLineToPoint(CGPoint(x: 115.0, y: 235.0))
        path.addCurveToPoint(CGPoint(x: 110.0, y: 235.0), controlPoint1: CGPoint(x: 114.5, y: 232.0), controlPoint2: CGPoint(x: 110.5, y: 232.0))
        path.addLineToPoint(CGPoint(x: 115.0, y: 245.0))
        path.addCurveToPoint(CGPoint(x: 106.0, y: 247.0), controlPoint1: CGPoint(x: 115.0, y: 246.0), controlPoint2: CGPoint(x: 110.0, y: 255.0))
        path.addLineToPoint(CGPoint(x: 103.0, y: 242.0))
        
        
        //path for h
        path.moveToPoint(CGPoint(x: 110.0, y: 250.0))
        path.addCurveToPoint(CGPoint(x: 119.0, y: 245.0), controlPoint1: CGPoint(x: 113.0, y: 250.0), controlPoint2: CGPoint(x: 117.0, y: 246.20))
        path.addCurveToPoint(CGPoint(x: 129.0, y: 213.0), controlPoint1: CGPoint(x: 124.0, y: 235.0), controlPoint2: CGPoint(x: 129.0, y: 225.0))
        path.addCurveToPoint(CGPoint(x: 127.0, y: 213.0), controlPoint1: CGPoint(x: 128.0, y: 210.0), controlPoint2: CGPoint(x: 128.0, y: 210.0))
        path.addLineToPoint(CGPoint(x: 117.0, y: 250.0))
        path.addCurveToPoint(CGPoint(x: 130.0, y: 247.0), controlPoint1: CGPoint(x: 122.0, y: 232.0), controlPoint2: CGPoint(x: 135.0, y: 232.0))
        path.addCurveToPoint(CGPoint(x: 135.0, y: 248.0), controlPoint1: CGPoint(x: 131.5, y: 250.0), controlPoint2: CGPoint(x: 133.5, y: 250.0))
        
        
        var pathLayer = CAShapeLayer()
        pathLayer.frame = view.bounds
        pathLayer.path = path.CGPath
        pathLayer.strokeColor = UIColor.blueColor().CGColor
        pathLayer.fillColor = nil
        pathLayer.lineWidth = 1.0
        pathLayer.strokeStart = 0.0
        pathLayer.strokeEnd = 0.1
        pathLayer.lineJoin = kCALineJoinBevel
        view.layer.addSublayer(pathLayer)
        
        
        var pathAnimationStart = CABasicAnimation(keyPath: "strokeStart")
        pathAnimationStart.toValue = 0.95
        
        var pathAnimationStop = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimationStop.toValue = 1.0
        
        var animationGroup = CAAnimationGroup()
        animationGroup.animations = [pathAnimationStart , pathAnimationStop]
        animationGroup.duration = 5.0
        animationGroup.repeatCount = HUGE
        animationGroup.autoreverses = true
        pathLayer.addAnimation(animationGroup, forKey: "animateView")
    
    }
    
    
    func makeSpringAnimation(){
        
        let buttonWidth : CGFloat = 50.0
        
        //creating center button
        var centreButton = UIButton()
        centreButton.frame = CGRectMake((self.view.frame.size.width - buttonWidth)/2.0, 350.0, buttonWidth, 50.0)
        centreButton.setImage(UIImage(named: "cross.png"), forState: UIControlState.Normal)
        centreButton.imageEdgeInsets = UIEdgeInsetsMake(20.0, 20.0, 20.0, 20.0)
        centreButton.backgroundColor = UIColor.greenColor()
        centreButton.addTarget(self, action: "showButtonVertically:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(centreButton)
        centreButton.layer.cornerRadius = 50.0/2
        centreButton.clipsToBounds = true
        
        //creating button1
        button1 = UIButton()
        button1.frame = CGRectMake((self.view.frame.size.width - buttonWidth)/2.0, 350.0, buttonWidth, 50.0)
        button1.imageEdgeInsets = UIEdgeInsetsMake(20.0, 20.0, 20.0, 20.0)
        button1.backgroundColor = UIColor.purpleColor()
        button1.addTarget(self, action: "animateButtonsHorizontally:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button1)
        self.view.sendSubviewToBack(button1)
        button1.layer.cornerRadius = 50.0/2
        button1.clipsToBounds = true

        
        //creating button2
        button2 = UIButton()
        button2.frame = CGRectMake((self.view.frame.size.width - buttonWidth)/2.0, 350.0, buttonWidth, 50.0)
        button2.imageEdgeInsets = UIEdgeInsetsMake(20.0, 20.0, 20.0, 20.0)
        button2.backgroundColor = UIColor.purpleColor()
        button2.addTarget(self, action: "animateButtonsHorizontally:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button2)
        self.view.sendSubviewToBack(button2)
        button2.layer.cornerRadius = 50.0/2
        button2.clipsToBounds = true

        
        //creating button3
        button3 = UIButton()
        button3.frame = CGRectMake((self.view.frame.size.width - buttonWidth)/2.0, 350.0, buttonWidth, 50.0)
        button3.imageEdgeInsets = UIEdgeInsetsMake(20.0, 20.0, 20.0, 20.0)
        button3.backgroundColor = UIColor.purpleColor()
        button3.addTarget(self, action: "animateButtonsHorizontally:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button3)
        self.view.sendSubviewToBack(button3)
        button3.layer.cornerRadius = 50.0/2
        button3.clipsToBounds = true
    }
    
    
    func showButtonVertically(sender : UIButton){
        sender.selected = !sender.selected
        
        if sender.selected {
            UIView.animateWithDuration(0.6, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
               
                //rotate centre button
                sender.transform = CGAffineTransformMakeRotation(CGFloat(135 * M_PI/180))
                sender.backgroundColor = UIColor.orangeColor()
                
                //animate button 1
                self.button1.frame = CGRectMake(self.button1.frame.origin.x, self.button1.frame.origin.y - 75.0, self.button1.frame.size.width, self.button1.frame.size.height)
                
                //animate button 2
                self.button2.frame = CGRectMake(self.button2.frame.origin.x, self.button2.frame.origin.y - 150.0, self.button2.frame.size.width, self.button2.frame.size.height)
                
                //animate button 3
                self.button3.frame = CGRectMake(self.button3.frame.origin.x, self.button3.frame.origin.y - 225.0, self.button3.frame.size.width, self.button3.frame.size.height)

                }, completion: nil)
        }else{
            UIView.animateWithDuration(0.6, delay: 0.0, usingSpringWithDamping:1.0, initialSpringVelocity: 15.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
               
                //rotate centre button
                sender.transform = CGAffineTransformMakeRotation(CGFloat(-135 * M_PI/180))
                sender.backgroundColor = UIColor.greenColor()
                
                //animate button 1
                self.button1.frame = CGRectMake(self.button1.frame.origin.x, 350.0, self.button1.frame.size.width, self.button1.frame.size.height)
                
                //animate button 2
                self.button2.frame = CGRectMake(self.button2.frame.origin.x, 350.0, self.button2.frame.size.width, self.button2.frame.size.height)
                
                //animate button 3
                self.button3.frame = CGRectMake(self.button3.frame.origin.x, 350.0, self.button3.frame.size.width, self.button3.frame.size.height)

                }, completion: nil)
        }
    }
    
    
    
    func animateButtonsHorizontally(sender: UIButton){
        var animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.6
        animation.values = [ -40, 40, -30, 30, -20, 20, -10, 10, -5, 5, 0]
        sender.layer.addAnimation(animation, forKey: "shake")
    }
    
    override func viewWillAppear(animated: Bool) {
        //do as per your desire
    }
    
    override func viewWillDisappear(animated: Bool) {
        //do as per your desire
    }
    
    override func viewDidAppear(animated: Bool) {
        //do as per your desire
    }
    
    override func viewDidDisappear(animated: Bool) {
        //do as per your desire
    }
    
    // MARK :- Memory warning handling
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

