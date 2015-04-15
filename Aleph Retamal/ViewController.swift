//
//  ViewController.swift
//  Aleph Retamal
//
//  Created by Aleph Retamal on 4/14/15.
//  Copyright (c) 2015 Aleph Retamal. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var leftButton: CircleMenuButton!
    @IBOutlet weak var middleButton: CircleMenuButton!
    @IBOutlet weak var rightButton: CircleMenuButton!
    
    
    let squareSide:CGFloat = 170
    let circleDiameter:CGFloat = 150
    
    let cos45:CGFloat = CGFloat(cos(M_PI_4))
    let sin45:CGFloat = CGFloat(sin(M_PI_4))
    
    var radiusx:CGFloat = CGFloat()
    var radiusy:CGFloat = CGFloat()
    
    
    let centralSquare = CAShapeLayer()
    let centralLosangle = CAShapeLayer()
    let leftCircle = CAShapeLayer()
    let rightCircle = CAShapeLayer()
    let topCircle = CAShapeLayer()
    let bottomCircle = CAShapeLayer()
    
    let topLeftCircle = CAShapeLayer()
    let topRightCircle = CAShapeLayer()
    let bottomLeftCircle = CAShapeLayer()
    let bottomRightCircle = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.alpha = 0
        leftButton.transform = CGAffineTransformMakeTranslation(0, 100)
        middleButton.transform = CGAffineTransformMakeTranslation(0, 100)
        rightButton.transform = CGAffineTransformMakeTranslation(0, 100)
        
        let viewWidth:CGFloat = view.bounds.width
        let viewHeight:CGFloat = view.bounds.height
        
        let circleFrame = CGRect(x: (viewWidth - circleDiameter) / 2, y: (viewHeight - circleDiameter) / 2, width: circleDiameter, height: circleDiameter)
        
        radiusx = (circleDiameter / 2) * cos45
        radiusy = (circleDiameter / 2) * sin45
    
        leftCircle.frame = CGRect(x: viewWidth / 2 - circleDiameter, y: (viewHeight - circleDiameter) / 2, width: circleDiameter, height: circleDiameter)
        leftCircle.backgroundColor = UIColor(hex: "5E0095").CGColor
        leftCircle.opacity = 0.5
        leftCircle.cornerRadius = circleDiameter / 2
        view.layer.addSublayer(leftCircle)
        
        rightCircle.frame = CGRect(x: viewWidth / 2, y: (viewHeight - circleDiameter) / 2, width: circleDiameter, height: circleDiameter)
        rightCircle.backgroundColor = UIColor(hex: "FA6B0A").CGColor
        rightCircle.opacity = 0.5
        rightCircle.cornerRadius = circleDiameter / 2
        view.layer.addSublayer(rightCircle)
        
        topCircle.frame = CGRect(x: (viewWidth - circleDiameter) / 2, y: viewHeight / 2 - circleDiameter, width: circleDiameter, height: circleDiameter)
        topCircle.backgroundColor = UIColor(hex: "BD009F").CGColor
        topCircle.opacity = 0.5
        topCircle.cornerRadius = circleDiameter / 2
        view.layer.addSublayer(topCircle)
        
        bottomCircle.frame = CGRect(x: (viewWidth - circleDiameter) / 2, y: viewHeight / 2, width: circleDiameter, height: circleDiameter)
        bottomCircle.backgroundColor = UIColor(hex: "139A88").CGColor
        bottomCircle.opacity = 0.5
        bottomCircle.cornerRadius = circleDiameter / 2
        view.layer.addSublayer(bottomCircle)
        
        topLeftCircle.frame = CGRect(x: (viewWidth - circleDiameter) / 2 - radiusx, y: (viewHeight - circleDiameter) / 2 - radiusy, width: circleDiameter, height: circleDiameter)
        topLeftCircle.backgroundColor = UIColor(hex: "AB00FE").CGColor
        topLeftCircle.opacity = 0.5
        topLeftCircle.cornerRadius = circleDiameter / 2
        view.layer.addSublayer(topLeftCircle)
        
        topRightCircle.frame = CGRect(x: (viewWidth - circleDiameter) / 2 + radiusx, y: (viewHeight - circleDiameter) / 2 - radiusy, width: circleDiameter, height: circleDiameter)
        topRightCircle.backgroundColor = UIColor(hex: "F90006").CGColor
        topRightCircle.opacity = 0.5
        topRightCircle.cornerRadius = circleDiameter / 2
        view.layer.addSublayer(topRightCircle)
        
        bottomRightCircle.frame = CGRect(x: (viewWidth - circleDiameter) / 2 + radiusx, y: (viewHeight - circleDiameter) / 2 + radiusy, width: circleDiameter, height: circleDiameter)
        bottomRightCircle.backgroundColor = UIColor(hex: "FCA50A").CGColor
        bottomRightCircle.opacity = 0.5
        bottomRightCircle.cornerRadius = circleDiameter / 2
        bottomRightCircle.cornerRadius = circleDiameter / 2
        bottomRightCircle.shadowColor = UIColor.blackColor().CGColor
        bottomRightCircle.shadowOffset = CGSizeMake(-5, 5)
        bottomRightCircle.shadowOpacity = 0.5
        view.layer.addSublayer(bottomRightCircle)
        
        bottomLeftCircle.frame = CGRect(x: (viewWidth - circleDiameter) / 2 - radiusx, y: (viewHeight - circleDiameter) / 2 + radiusy, width: circleDiameter, height: circleDiameter)
        bottomLeftCircle.backgroundColor = UIColor(hex: "0D31FF").CGColor
        bottomLeftCircle.opacity = 0.5
        bottomLeftCircle.cornerRadius = circleDiameter / 2
        bottomLeftCircle.shadowColor = UIColor.blackColor().CGColor
        bottomLeftCircle.shadowOffset = CGSizeMake(-5, -5)
        bottomLeftCircle.shadowOpacity = 0.5
        view.layer.addSublayer(bottomLeftCircle)
        
        
        centralLosangle.frame = CGRect(x: (viewWidth - squareSide ) / 2 , y: (viewHeight - squareSide ) / 2, width: squareSide, height: squareSide)
        centralLosangle.cornerRadius = 10.0
        centralLosangle.opacity = 0.5
        centralLosangle.backgroundColor = UIColor.blackColor().CGColor
        view.layer.addSublayer(centralLosangle)
        //        centralLosangle.transform = CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, 1)
        
        centralSquare.frame = CGRect(x: (viewWidth - squareSide ) / 2 , y: (viewHeight - squareSide ) / 2, width: squareSide, height: squareSide)
        centralSquare.cornerRadius = 10.0
        centralSquare.opacity = 0.5
        centralSquare.backgroundColor = UIColor.blackColor().CGColor
        view.layer.addSublayer(centralSquare)
        
        
        self.view.bringSubviewToFront(self.mainLabel)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        let transformScaleZero = CATransform3DMakeScale(0, 0, 0)
        
        leftCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(circleDiameter / 2, 0, 0), transformScaleZero)
        rightCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(-circleDiameter / 2, 0, 0), transformScaleZero)
        topCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(0, circleDiameter / 2, 0), transformScaleZero)
        bottomCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(0, -circleDiameter / 2, 0), transformScaleZero)
        
        topLeftCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(radiusx, radiusy, 0), transformScaleZero)
        topRightCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(-radiusx, radiusy, 0), transformScaleZero)
        bottomLeftCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(radiusx, -radiusy, 0), transformScaleZero)
        bottomRightCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(-radiusx, -radiusy, 0), transformScaleZero)

        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        let transformScaleOne = CATransform3DMakeScale(1, 1, 1)
        
        let timeForAnimation1:CFTimeInterval = 1.0
        let timeForAnimation2:CFTimeInterval = 0.5
        let timeForAnimation3:CFTimeInterval = 0.5
        
        let totalDuration:CFTimeInterval = timeForAnimation1 + timeForAnimation2 + timeForAnimation3
        
        
        let group = CAAnimationGroup()
        group.duration = 5
        
        var start = 0.0
        
        let rotateSquares:CABasicAnimation = CABasicAnimation()
        rotateSquares.keyPath = "transform"
        rotateSquares.removedOnCompletion = false
        rotateSquares.fillMode = kCAFillModeForwards
        rotateSquares.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        rotateSquares.duration = timeForAnimation1
        rotateSquares.beginTime = start
        
        start += timeForAnimation1
        
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(timeForAnimation1)
        
        centralSquare.transform = CATransform3DMakeRotation(CGFloat(M_PI), 0, 0, 1)
        centralLosangle.transform = CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, 1)
        
        CATransaction.setCompletionBlock { () -> Void in
            CATransaction.begin()
            CATransaction.setAnimationDuration(timeForAnimation2)
            
            self.leftCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(0, 0, 0), transformScaleOne)
            self.rightCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(0, 0, 0), transformScaleOne)
            self.topCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(0, 0, 0), transformScaleOne)
            self.bottomCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(0, 0, 0), transformScaleOne)
            
            self.topLeftCircle.transform = transformScaleOne
            self.topRightCircle.transform = transformScaleOne
            self.bottomLeftCircle.transform = transformScaleOne
            self.bottomRightCircle.transform = transformScaleOne
            
            CATransaction.setCompletionBlock({ () -> Void in
                CATransaction.begin()
                CATransaction.setAnimationDuration(timeForAnimation3)
                self.topLeftCircle.transform = CATransform3DMakeTranslation(0, 0, 0)
                self.topRightCircle.transform = CATransform3DMakeTranslation(0, 0, 0)
                self.bottomLeftCircle.transform = CATransform3DMakeTranslation(0, 0, 0)
                self.bottomRightCircle.transform = CATransform3DMakeTranslation(0, 0, 0)
                
                self.mainLabel.alpha = 1
                CATransaction.commit()
            })
            
            CATransaction.commit()
        }
        
        CATransaction.commit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

