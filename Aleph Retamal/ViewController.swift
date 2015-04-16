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
    
    var gravity: UIGravityBehavior!
    var animator: UIDynamicAnimator!
    
    let squareSide:CGFloat = 170
    let circleDiameter:CGFloat = 160
    let lilCircleDiameter:CGFloat = 60
    
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
    
    let lilTopSquare = CAShapeLayer()
    let lilRightSquare = CAShapeLayer()
    let lilBottomSquare = CAShapeLayer()
    let lilLeftSquare = CAShapeLayer()
    
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
        //        bottomRightCircle.shadowColor = UIColor.blackColor().CGColor
        //        bottomRightCircle.shadowOffset = CGSizeMake(5, -5)
        //        bottomRightCircle.shadowOpacity = 0.5
        view.layer.addSublayer(bottomRightCircle)
        
        bottomLeftCircle.frame = CGRect(x: (viewWidth - circleDiameter) / 2 - radiusx, y: (viewHeight - circleDiameter) / 2 + radiusy, width: circleDiameter, height: circleDiameter)
        bottomLeftCircle.backgroundColor = UIColor(hex: "0D31FF").CGColor
        bottomLeftCircle.opacity = 0.5
        bottomLeftCircle.cornerRadius = circleDiameter / 2
        //        bottomLeftCircle.shadowColor = UIColor.blackColor().CGColor
        //        bottomLeftCircle.shadowOffset = CGSizeMake(-5, -5)
        //        bottomLeftCircle.shadowOpacity = 0.5
        view.layer.addSublayer(bottomLeftCircle)
        
        lilTopSquare.frame = CGRect(x: (viewWidth - lilCircleDiameter) / 2, y: (viewHeight - lilCircleDiameter) / 2 - circleDiameter - lilCircleDiameter/8, width: lilCircleDiameter, height: lilCircleDiameter)
        lilTopSquare.backgroundColor = UIColor(hex: "BD009F").CGColor
        lilTopSquare.opacity = 0
        lilTopSquare.cornerRadius = 10.0
        view.layer.addSublayer(lilTopSquare)
        lilTopSquare.transform = CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, 1)
        
        lilRightSquare.frame = CGRect(x: (viewWidth - lilCircleDiameter) / 2 + circleDiameter + lilCircleDiameter/8, y: (viewHeight - lilCircleDiameter) / 2, width: lilCircleDiameter, height: lilCircleDiameter)
        lilRightSquare.backgroundColor = UIColor(hex: "FA6B0A").CGColor
        lilRightSquare.opacity = 0
        lilRightSquare.cornerRadius = 10.0
        view.layer.addSublayer(lilRightSquare)
        lilRightSquare.transform = CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, 1)
        
        lilBottomSquare.frame = CGRect(x: (viewWidth - lilCircleDiameter) / 2, y: (viewHeight - lilCircleDiameter) / 2 + circleDiameter + lilCircleDiameter/8, width: lilCircleDiameter, height: lilCircleDiameter)
        lilBottomSquare.backgroundColor = UIColor(hex: "139A88").CGColor
        lilBottomSquare.opacity = 0
        lilBottomSquare.cornerRadius = 10.0
        view.layer.addSublayer(lilBottomSquare)
        lilBottomSquare.transform = CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, 1)
        
        lilLeftSquare.frame = CGRect(x: (viewWidth - lilCircleDiameter) / 2 - circleDiameter - lilCircleDiameter/8, y: (viewHeight - lilCircleDiameter) / 2, width: lilCircleDiameter, height: lilCircleDiameter)
        lilLeftSquare.backgroundColor = UIColor(hex: "5E0095").CGColor
        lilLeftSquare.opacity = 0
        lilLeftSquare.cornerRadius = 10.0
        view.layer.addSublayer(lilLeftSquare)
        lilLeftSquare.transform = CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, 1)
        
        centralLosangle.frame = CGRect(x: (viewWidth - squareSide ) / 2 , y: (viewHeight - squareSide ) / 2, width: squareSide, height: squareSide)
        centralLosangle.cornerRadius = 20.0
        centralLosangle.opacity = 0.5
        centralLosangle.backgroundColor = UIColor.blackColor().CGColor
        view.layer.addSublayer(centralLosangle)
        //        centralLosangle.transform = CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, 1)
        
        centralSquare.frame = CGRect(x: (viewWidth - squareSide ) / 2 , y: (viewHeight - squareSide ) / 2, width: squareSide, height: squareSide)
        centralSquare.cornerRadius = 20.0
        centralSquare.opacity = 0.5
        centralSquare.backgroundColor = UIColor.blackColor().CGColor
        view.layer.addSublayer(centralSquare)
        
        
        self.view.bringSubviewToFront(self.mainLabel)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        let transformScaleZero = CATransform3DMakeScale(0, 0, 0)
        let transformScalePoint = CATransform3DMakeScale(0.1, 0.1, 1)
        
        leftCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(circleDiameter / 2, 0, 0), transformScaleZero)
        rightCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(-circleDiameter / 2, 0, 0), transformScaleZero)
        topCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(0, circleDiameter / 2, 0), transformScaleZero)
        bottomCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(0, -circleDiameter / 2, 0), transformScaleZero)
        
        topLeftCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(radiusx, radiusy, 0), transformScaleZero)
        topRightCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(-radiusx, radiusy, 0), transformScaleZero)
        bottomLeftCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(radiusx, -radiusy, 0), transformScaleZero)
        bottomRightCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(-radiusx, -radiusy, 0), transformScaleZero)
        
        centralLosangle.transform = transformScalePoint
        centralSquare.transform = transformScalePoint
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        let transformScaleOne = CATransform3DMakeScale(1, 1, 1)
        
        let timeForAnimation1:CFTimeInterval = 0.3
        let timeForAnimation2:CFTimeInterval = 0.2
        let timeForAnimation3:CFTimeInterval = 1.0
        let timeForAnimation4:CFTimeInterval = 0.5
        let timeForAnimation5:CFTimeInterval = 0.4
        let timeForAnimation6:CFTimeInterval = 2.0
        
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(timeForAnimation1)
        CATransaction.setCompletionBlock { () -> Void in
            
            CATransaction.begin()
            CATransaction.setAnimationDuration(timeForAnimation2)
            CATransaction.setCompletionBlock { () -> Void in
                
                CATransaction.begin()
                CATransaction.setAnimationDuration(timeForAnimation3)
                CATransaction.setCompletionBlock { () -> Void in
                    
                    CATransaction.begin()
                    CATransaction.setAnimationDuration(timeForAnimation4)
                    CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut))
                    CATransaction.setCompletionBlock({ () -> Void in
                        
                        CATransaction.begin()
                        CATransaction.setAnimationDuration(timeForAnimation5)
                        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn))
                        CATransaction.setCompletionBlock({ () -> Void in
                            
                            CATransaction.begin()
                            CATransaction.setAnimationDuration(timeForAnimation6)
                            CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn))
                            CATransaction.setCompletionBlock({ () -> Void in
                                self.animator = UIDynamicAnimator(referenceView: self.view)
                                self.gravity = UIGravityBehavior(items: [self.lilLeftSquare, self.lilRightSquare, self.lilTopSquare, self.lilBottomSquare])
                                self.animator.addBehavior(self.gravity)
                            })
                            self.mainLabel.alpha = 1
                            self.lilTopSquare.opacity = 0.5
                            self.lilRightSquare.opacity = 0.5
                            self.lilBottomSquare.opacity = 0.5
                            self.lilLeftSquare.opacity = 0.5
                            CATransaction.commit()
                        })
                        
                        self.topLeftCircle.transform = CATransform3DMakeTranslation(0, 0, 0)
                        self.topRightCircle.transform = CATransform3DMakeTranslation(0, 0, 0)
                        self.bottomLeftCircle.transform = CATransform3DMakeTranslation(0, 0, 0)
                        self.bottomRightCircle.transform = CATransform3DMakeTranslation(0, 0, 0)
                        
                        self.topCircle.transform = CATransform3DMakeTranslation(0, 0, 0)
                        self.rightCircle.transform = CATransform3DMakeTranslation(0, 0, 0)
                        self.bottomCircle.transform = CATransform3DMakeTranslation(0, 0, 0)
                        self.leftCircle.transform = CATransform3DMakeTranslation(0, 0, 0)
                        CATransaction.commit()
                    })
                    
                    self.leftCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(self.circleDiameter / 2, 0, 0), transformScaleOne)
                    self.rightCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(-self.circleDiameter / 2, 0, 0), transformScaleOne)
                    self.topCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(0, self.circleDiameter / 2, 0), transformScaleOne)
                    self.bottomCircle.transform = CATransform3DConcat(CATransform3DMakeTranslation(0, -self.circleDiameter / 2, 0), transformScaleOne)
                    
                    self.topLeftCircle.transform = transformScaleOne
                    self.topRightCircle.transform = transformScaleOne
                    self.bottomLeftCircle.transform = transformScaleOne
                    self.bottomRightCircle.transform = transformScaleOne
                    
                    CATransaction.commit()
                }
                
                
                self.centralSquare.transform = CATransform3DMakeRotation(CGFloat(M_PI), 0, 0, 1)
                self.centralLosangle.transform = CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, 1)
                
                CATransaction.commit()
            }
            
            self.centralSquare.transform = CATransform3DMakeScale(1, 1, 1)
            self.centralLosangle.transform = CATransform3DMakeScale(1, 1, 1)
            
            CATransaction.commit()
        }
        
        self.centralSquare.transform = CATransform3DMakeScale(0.1, 1, 1)
        self.centralLosangle.transform = CATransform3DMakeScale(0.1, 1, 1)
        
        CATransaction.commit()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

