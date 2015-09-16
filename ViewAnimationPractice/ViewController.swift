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
    
    // MARK :- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        iOSLabel.hidden = true
        swiftAnimationLabel.hidden = true
        
        //animateUILabel()
        //draw8WithAnimation()
        animateViewWithUIBezierPath()
        
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

