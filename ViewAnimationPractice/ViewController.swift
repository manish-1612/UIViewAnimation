//
//  ViewController.swift
//  ViewAnimationPractice
//
//  Created by Manish Kumar on 15/09/15.
//  Copyright (c) 2015 Innofied Solutions Pvt. Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var optionsButton: UIButton!
    @IBOutlet weak var iOSLabel: UILabel!
    @IBOutlet weak var swiftAnimationLabel: UILabel!
    var animatingView : UIView!
    let buttonDiameter : CGFloat = 50.0
    let numberOfButtons : Int = 8
    var button : UIButton!
    let perRowButton : Int = 3
    var arrayOfButtons : [UIButton] = []
    var arrayOfCustomButtons : [CustomButton] = []
    var arrayOfVisitedButtons : [CustomButton] = []
    
    // MARK :- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        iOSLabel.hidden = true
        swiftAnimationLabel.hidden = true
        optionsButton.hidden = true
        
        //animateUILabel()
        //draw8WithAnimation()
        //animateViewWithUIBezierPath()
        //makeAnimatingText()
        makeSpringAnimation()
        
    }
    
    //MARK:- draw 8 with text overflow
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
    
    
    //MARK:- animating UILabel
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
    
    //MARK:- draw 8 using stroke animation
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
    
    //MARK:- animate text(not working now)
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
    
    //MARK:- spring animation for UIButton
    func makeSpringAnimation(){
        
        //for vertical spring animation
        //createButtonForVerticalAnimation()
        
        
        //for central throw animation
        //createButtonForCentralThrowAnimation()
        
        
        //for right inwards animation
        //createButtonsWithInwarsAnimation()
        
        
        //for clockwise animation of button
        //createClockWiseButtonAnimation()
        
        
        //animate buttons with fall animation
        createButtonForDownwardFallAnimation()
    }
    
    
    func setButtonBehindMainButton(targetSelector : Selector){
        
        arrayOfButtons = [UIButton]()
        
        //creating buttons
        for i in 0..<numberOfButtons{
            var backButton = UIButton()
            backButton.frame = CGRectMake(button.frame.origin.x, button.frame.origin.y, buttonDiameter, buttonDiameter)
            backButton.tag = i
            backButton.setTitle(String(i), forState:.Normal)
            backButton.backgroundColor = UIColor.purpleColor()
            backButton.addTarget(self, action: targetSelector, forControlEvents: .TouchUpInside)
            self.view.addSubview(backButton)
            self.view.sendSubviewToBack(backButton)
            backButton.layer.cornerRadius = buttonDiameter/2
            backButton.clipsToBounds = true
            arrayOfButtons.append(backButton)
        }
    }
    

    
    //MARK:- animate buttons vertically
    func createButtonForVerticalAnimation(){
        //creating center button
        button = UIButton()
        button.frame = CGRectMake((self.view.frame.size.width - buttonDiameter)/2.0, 400.0, buttonDiameter, buttonDiameter)
        button.setImage(UIImage(named: "cross.png"), forState: UIControlState.Normal)
        button.imageEdgeInsets = UIEdgeInsetsMake(20.0, 20.0, 20.0, 20.0)
        button.backgroundColor = UIColor.greenColor()
        button.addTarget(self, action: "showButtonVertically:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        button.layer.cornerRadius = buttonDiameter/2
        button.clipsToBounds = true
        
        setButtonBehindMainButton("animateButtonsHorizontally:")

    }
    
    
    func showButtonVertically(sender : UIButton){
        sender.selected = !sender.selected
        
        if sender.selected {
            UIView.animateWithDuration(0.6, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10.0, options: .CurveEaseInOut | .AllowUserInteraction, animations: { () -> Void in
               
                //rotate centre button
                sender.transform = CGAffineTransformMakeRotation(CGFloat(135 * M_PI/180))
                sender.backgroundColor = UIColor.orangeColor()

                    for i in 0..<self.numberOfButtons{
                        for backButton in self.arrayOfButtons{
                            if backButton.tag == i{
                                //animate button 1
                                var yOriginFactor : CGFloat = CGFloat(CGFloat(i + 1) * 75.0)
                                
                                backButton.frame = CGRectMake(backButton.frame.origin.x, backButton.frame.origin.y - yOriginFactor, backButton.frame.size.width, backButton.frame.size.height)
                            }
                        }
                    }
                }, completion: nil)
        }else{
            UIView.animateWithDuration(0.6, delay: 0.0, usingSpringWithDamping:1.0, initialSpringVelocity: 15.0, options: .CurveEaseInOut | .AllowUserInteraction, animations: { () -> Void in
               
                //rotate centre button
                sender.transform = CGAffineTransformMakeRotation(CGFloat(-135 * M_PI/180))
                sender.backgroundColor = UIColor.greenColor()
                
                for i in 0..<self.numberOfButtons{
                    for backButton in self.arrayOfButtons{
                        if backButton.tag == i{
                            //animate button 1
                            var yOriginFactor : CGFloat = CGFloat(CGFloat(i + 1) * 75.0)
                            
                            backButton.frame = CGRectMake(backButton.frame.origin.x, backButton.frame.origin.y + yOriginFactor, backButton.frame.size.width, backButton.frame.size.height)
                        }
                    }
                }
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
    
    
    
    //MARK:- animate buttons for central throw animation
    func createButtonForCentralThrowAnimation(){
        //creating center button
        button = UIButton()
        button.frame = CGRectMake(20.0, self.view.frame.size.height - (buttonDiameter + 20.0), buttonDiameter, buttonDiameter)
        button.setImage(UIImage(named: "cross.png"), forState: UIControlState.Normal)
        button.imageEdgeInsets = UIEdgeInsetsMake(20.0, 20.0, 20.0, 20.0)
        button.backgroundColor = UIColor.greenColor()
        button.addTarget(self, action: "showButtonAnimationCentred:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        button.layer.cornerRadius = buttonDiameter/2
        button.clipsToBounds = true
        
        setButtonBehindMainButton("animateButtonsCentreOutwards:")
    }
    

    func showButtonAnimationCentred(sender : UIButton){
        sender.selected = !sender.selected
        
        if sender.selected {
            UIView.animateWithDuration(0.6, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10.0, options: .CurveEaseInOut | .AllowUserInteraction, animations: { () -> Void in
                
                //rotate centre button
                sender.transform = CGAffineTransformMakeRotation(CGFloat(135 * M_PI/180))
                sender.backgroundColor = UIColor.orangeColor()
                
                    for i in 0..<self.numberOfButtons{
                        for backButton in self.arrayOfButtons{
                            if backButton.tag == i{
                                //animate button
                                var radius : Double = 150.0
                                var angle : Double = Double(i) * 90.0 / Double(self.numberOfButtons - 1)
                                
                                var originX : CGFloat = CGFloat (radius * cos(M_PI / 180.0 * angle))
                                var originY : CGFloat = CGFloat( radius * sin(M_PI / 180.0 * angle))

                                backButton.center = CGPoint(x: originX + self.button.center.x, y: (self.button.center.y - originY) )
                                
                            }
                        }
                    }
                }, completion: nil)
        }else{
            UIView.animateWithDuration(0.6, delay: 0.0, usingSpringWithDamping:1.0, initialSpringVelocity: 15.0, options: .CurveEaseInOut | .AllowUserInteraction, animations: { () -> Void in
                
                //rotate centre button
                sender.transform = CGAffineTransformMakeRotation(CGFloat(-135 * M_PI/180))
                sender.backgroundColor = UIColor.greenColor()

                    for i in 0..<self.numberOfButtons{
                        for buttonAnimated in self.arrayOfButtons{
                            buttonAnimated.center = CGPoint(x: self.button.center.x, y: self.button.center.y)
                        }
                    }
                
                }, completion: nil)
        }
    }
    
    
    func animateButtonsCentreOutwards(sender: UIButton){
        sender.showsTouchWhenHighlighted = true
    }
    
    
    
    
    //MARK:- animate buttons for right incoming animation
    func createButtonsWithInwarsAnimation(){
        let startOrigin : CGFloat = 70.0
        
        optionsButton.hidden = false
        
        arrayOfButtons = [UIButton]()

        for i in 0..<self.numberOfButtons{
            
            var buttonForAnimation = UIButton()
            buttonForAnimation.frame = CGRectMake(self.view.frame.size.width + 70.0, startOrigin + (70.0 * CGFloat(i)) , buttonDiameter, buttonDiameter)
            buttonForAnimation.tag = i
            buttonForAnimation.setTitle(String(i), forState:.Normal)
            buttonForAnimation.backgroundColor = UIColor.greenColor()
            //buttonForAnimation.addTarget(self, action: "showButtonVertically:", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(buttonForAnimation)
            buttonForAnimation.layer.cornerRadius = buttonDiameter/2
            buttonForAnimation.clipsToBounds = true
            arrayOfButtons.append(buttonForAnimation)
        }
    }

    @IBAction func createButtonInwardsAnimation(sender: AnyObject) {
        createAnimationsForButtonWithSender(sender as! UIButton)
    }
    
    
    func createAnimationsForButtonWithSender(centralButton : UIButton){
        
        centralButton.selected = !centralButton.selected
        
        if centralButton.selected{
            for i in 0..<self.numberOfButtons{
                for buttonAnimated in self.arrayOfButtons{
                    if buttonAnimated.tag == i{
                        UIView.animateWithDuration(0.5, delay: Double(i)*0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 20.0, options: .CurveEaseInOut | .AllowUserInteraction, animations: { () -> Void in
                            buttonAnimated.frame = CGRectMake(self.view.frame.size.width - 70.0, buttonAnimated.frame.origin.y , buttonAnimated.frame.size.width, buttonAnimated.frame.size.height)
                            }, completion: nil)
                    }
                }
            }
        }else{
            for i in 0..<self.numberOfButtons{
                for buttonAnimated in self.arrayOfButtons{
                    if buttonAnimated.tag == i{
                        UIView.animateWithDuration(0.5, delay: Double(i)*0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 20.0, options: .CurveEaseInOut | .AllowUserInteraction, animations: { () -> Void in
                            buttonAnimated.frame = CGRectMake(self.view.frame.size.width + 70.0, buttonAnimated.frame.origin.y , buttonAnimated.frame.size.width, buttonAnimated.frame.size.height)
                            }, completion: nil)
                    }
                }
            }
        }
    }
    
    
    //MARK:- animate buttons with clock animation
    func createClockWiseButtonAnimation(){
        //creating center button
        button = UIButton()
        button.frame = CGRectMake((self.view.frame.size.width - buttonDiameter)/2.0, (self.view.frame.size.height - buttonDiameter)/2.0, buttonDiameter, buttonDiameter)
        button.setImage(UIImage(named: "cross.png"), forState: UIControlState.Normal)
        button.imageEdgeInsets = UIEdgeInsetsMake(20.0, 20.0, 20.0, 20.0)
        button.backgroundColor = UIColor.greenColor()
        button.addTarget(self, action: "showButtonClockwiseOutwards:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        button.layer.cornerRadius = buttonDiameter/2
        button.clipsToBounds = true
        
        setButtonBehindMainButton("animateButtonsClockwiseOutwards:")
    }

    
    
    func showButtonClockwiseOutwards(sender : UIButton){
        sender.selected = !sender.selected
        
        if sender.selected {
            
            
            UIView.animateWithDuration(0.6, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10.0, options: .CurveEaseInOut | .AllowUserInteraction, animations: { () -> Void in
                
                //rotate centre button
                sender.transform = CGAffineTransformMakeRotation(CGFloat(135 * M_PI/180))
                sender.backgroundColor = UIColor.orangeColor()

            }, completion: nil)
            
            
            
            for i in 0..<self.numberOfButtons{
                for backButton in self.arrayOfButtons{
                    if backButton.tag == i{
                        
                        var radius : Double = 100.0
                        var angle : Double = Double(i) * 180.0 / Double(self.numberOfButtons - 1)
                        
                        var originX : CGFloat = CGFloat (radius * sin(M_PI / 180.0 * angle))
                        var originY : CGFloat = CGFloat (radius * cos(M_PI / 180.0 * angle))
                        
                        UIView.animateWithDuration(0.6, delay:Double(i)*0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 10.0, options: .CurveEaseInOut | .AllowUserInteraction, animations: { () -> Void in
                            backButton.center = CGPoint(x: originX + self.button.center.x, y: (self.button.center.y - originY) )

                        }, completion: nil)
                    }
                }
            }
        }else{
            UIView.animateWithDuration(0.6, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10.0, options: .CurveEaseInOut | .AllowUserInteraction, animations: { () -> Void in
                
                //rotate centre button
                sender.transform = CGAffineTransformMakeRotation(CGFloat(-135 * M_PI/180))
                sender.backgroundColor = UIColor.greenColor()
                
                }, completion: nil)
            
            
            for i in 0..<self.numberOfButtons{
                for backButton in self.arrayOfButtons{
                    if backButton.tag == self.numberOfButtons - 1 - i{
                        
                        UIView.animateWithDuration(0.6, delay:Double(i)*0.1, usingSpringWithDamping: 0.9, initialSpringVelocity: 10.0, options: .CurveEaseInOut | .AllowUserInteraction, animations: { () -> Void in
                            backButton.center = CGPoint(x: self.button.center.x, y: self.button.center.y)
                            
                            }, completion: nil)
                    }
                }
            }
        }
    }
    
    func animateButtonsClockwiseOutwards(sender: UIButton){
        sender.showsTouchWhenHighlighted = true
    }
    
    
    
    //MARK:- animate buttons fall animation
    func createButtonForDownwardFallAnimation(){
        
        arrayOfCustomButtons = [CustomButton]()
        arrayOfVisitedButtons = [CustomButton]()
        
        let numberOfRowsWithAllEntry : Int = numberOfButtons / perRowButton
        let numberOfButtonInLastRow : Int = numberOfButtons % perRowButton
        let regularPadding : CGFloat = (self.view.frame.size.width - (buttonDiameter * CGFloat(perRowButton))) / CGFloat(perRowButton+1)
        
        var yOriginFactor : CGFloat = 0.0
        if numberOfButtonInLastRow > 0 {
             yOriginFactor = (self.view.frame.size.height - ((regularPadding * CGFloat(numberOfRowsWithAllEntry)) + (buttonDiameter * CGFloat(numberOfRowsWithAllEntry + 1))))/2.0
        }else{
            yOriginFactor = (self.view.frame.size.height - ((regularPadding * CGFloat(numberOfRowsWithAllEntry - 1 )) + (buttonDiameter * CGFloat(numberOfRowsWithAllEntry))))/2.0
        }
        
        for j in 0..<numberOfRowsWithAllEntry{
            for i in 0..<perRowButton{
                var buttonForAnimation = CustomButton()
                var xOrigin : CGFloat = regularPadding + (regularPadding * CGFloat(i)) + (buttonDiameter * CGFloat(i))
                var yOrigin : CGFloat = self.view.frame.size.height + (regularPadding * CGFloat(j)) + (buttonDiameter * CGFloat(j))
                buttonForAnimation.frame = CGRectMake(xOrigin , yOrigin, buttonDiameter, buttonDiameter)
                buttonForAnimation.tag = j * perRowButton + i
                buttonForAnimation.setTitle(String(j * perRowButton + i), forState:.Normal)
                buttonForAnimation.backgroundColor = UIColor.purpleColor()
                buttonForAnimation.addTarget(self, action: "animateButtonByGrowAnimation:", forControlEvents: UIControlEvents.TouchDown)
                buttonForAnimation.addTarget(self, action: "animateButtonByShrinkAnimation:", forControlEvents: UIControlEvents.TouchUpInside | UIControlEvents.TouchDragOutside)
                self.view.addSubview(buttonForAnimation)
                buttonForAnimation.layer.cornerRadius = buttonDiameter/2
                buttonForAnimation.clipsToBounds = true
                arrayOfCustomButtons.append(buttonForAnimation)
            }
        }
        
        
        let lastAddedButton : CustomButton = arrayOfCustomButtons.last!
        let regularPaddingInLastRow : CGFloat = (self.view.frame.size.width - (buttonDiameter * CGFloat(numberOfButtonInLastRow))) / CGFloat(numberOfButtonInLastRow+1)
        for k in 0..<numberOfButtonInLastRow{
            var buttonForAnimation = CustomButton()
            var xOrigin : CGFloat = regularPaddingInLastRow + (regularPaddingInLastRow * CGFloat(k)) + (buttonDiameter * CGFloat(k))
            var yOrigin : CGFloat = lastAddedButton.frame.origin.y + buttonDiameter + regularPadding
            buttonForAnimation.frame = CGRectMake(xOrigin , yOrigin, buttonDiameter, buttonDiameter)
            buttonForAnimation.tag = numberOfRowsWithAllEntry * perRowButton + k
            buttonForAnimation.setTitle(String(numberOfRowsWithAllEntry * perRowButton + k), forState:.Normal)
            buttonForAnimation.backgroundColor = UIColor.purpleColor()
            buttonForAnimation.addTarget(self, action: "animateButtonByGrowAnimation:", forControlEvents: UIControlEvents.TouchDown)
            buttonForAnimation.addTarget(self, action: "animateButtonByShrinkAnimation:", forControlEvents: UIControlEvents.TouchUpInside | UIControlEvents.TouchDragOutside)
            self.view.addSubview(buttonForAnimation)
            buttonForAnimation.layer.cornerRadius = buttonDiameter/2
            buttonForAnimation.clipsToBounds = true
            arrayOfCustomButtons.append(buttonForAnimation)
        }
        
        flowButtonUpwards(yOriginFactor)
    }
    
    
    
    func flowButtonUpwards(yOriginFactor : CGFloat){
        for i in 0..<self.numberOfButtons{
           
            var randomIndex = Int(arc4random_uniform(UInt32(arrayOfCustomButtons.count)))
            var buttonToVerify = arrayOfCustomButtons[randomIndex]
            
            for buttonAnimated in self.arrayOfCustomButtons{
                
                
                if buttonAnimated.tag == buttonToVerify.tag {
                
                    UIView.animateWithDuration(0.6, delay: Double(i)*0.1, usingSpringWithDamping: 0.65, initialSpringVelocity: 10.0, options: .CurveEaseInOut | .AllowUserInteraction, animations: { () -> Void in
                        buttonAnimated.frame = CGRectMake(buttonAnimated.frame.origin.x, buttonAnimated.frame.origin.y - self.view.frame.size.height + yOriginFactor , buttonAnimated.frame.size.width, buttonAnimated.frame.size.height)
                        }, completion: nil)
                    
                    arrayOfCustomButtons.removeAtIndex(randomIndex)
                    arrayOfVisitedButtons.append(buttonAnimated)
                    
                    break
                }
            }
        }
    }
    
    func animateButtonByGrowAnimation(sender: UIButton){

        UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10.0, options: .CurveEaseInOut | .AllowUserInteraction, animations: { () -> Void in
            sender.transform = CGAffineTransformMakeScale(1.3, 1.3)
        }, completion: nil)
    }
    
    
    func animateButtonByShrinkAnimation(sender: UIButton){
        
        
        
        UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10.0, options: .CurveEaseInOut | .AllowUserInteraction, animations: { () -> Void in
            sender.transform = CGAffineTransformMakeScale(1.0, 1.0)
        }) { (Bool) -> Void in
            UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10.0, options: .CurveEaseInOut | .AllowUserInteraction, animations: { () -> Void in
                //code for exit animation
            
                }, completion: nil)
        }
    }


}
