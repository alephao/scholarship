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

class MainViewController: UIViewController {
    
    let transitionManager = TransitionManager()
    
    @IBOutlet weak var mainLabel: UILabel!
    
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
    
    let lilTopLeftCircle = CAShapeLayer()
    let lilTopRightCircle = CAShapeLayer()
    let lilBottomRightCircle = CAShapeLayer()
    let lilBottomLeftCircle = CAShapeLayer()
    
    let arrowUp = CAShapeLayer()

    var blinkTimer: NSTimer!
    var arrowUpAndDownTimer: NSTimer!
    var shakeTimer: NSTimer!
    
    var step = 0
    
    @IBOutlet weak var touchLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.touchLabel.alpha = 0
        mainLabel.alpha = 0
        
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
        
        let lilCircleRadiusX = radiusx * 2
        let lilCircleRadiusY = radiusy * 2
        
        lilTopLeftCircle.frame = CGRect(x: (viewWidth - lilCircleDiameter) / 2 - lilCircleRadiusX, y: (viewHeight - lilCircleDiameter) / 2 - lilCircleRadiusY, width: lilCircleDiameter, height: lilCircleDiameter)
        lilTopLeftCircle.cornerRadius = lilCircleDiameter / 2
        lilTopLeftCircle.opacity = 0
        lilTopLeftCircle.backgroundColor = UIColor(hex: "AB00FE").CGColor
        view.layer.addSublayer(lilTopLeftCircle)
        
        lilTopRightCircle.frame = CGRect(x: (viewWidth - lilCircleDiameter) / 2 + lilCircleRadiusX, y: (viewHeight - lilCircleDiameter) / 2 - lilCircleRadiusY, width: lilCircleDiameter, height: lilCircleDiameter)
        lilTopRightCircle.cornerRadius = lilCircleDiameter / 2
        lilTopRightCircle.opacity = 0
        lilTopRightCircle.backgroundColor = UIColor(hex: "F90006").CGColor
        view.layer.addSublayer(lilTopRightCircle)
        
        lilBottomRightCircle.frame = CGRect(x: (viewWidth - lilCircleDiameter) / 2 + lilCircleRadiusX, y: (viewHeight - lilCircleDiameter) / 2 + lilCircleRadiusY, width: lilCircleDiameter, height: lilCircleDiameter)
        lilBottomRightCircle.cornerRadius = lilCircleDiameter / 2
        lilBottomRightCircle.opacity = 0
        lilBottomRightCircle.backgroundColor = UIColor(hex: "FCA50A").CGColor
        view.layer.addSublayer(lilBottomRightCircle)
        
        lilBottomLeftCircle.frame = CGRect(x: (viewWidth - lilCircleDiameter) / 2 - lilCircleRadiusX, y: (viewHeight - lilCircleDiameter) / 2 + lilCircleRadiusY, width: lilCircleDiameter, height: lilCircleDiameter)
        lilBottomLeftCircle.cornerRadius = lilCircleDiameter / 2
        lilBottomLeftCircle.opacity = 0
        lilBottomLeftCircle.backgroundColor = UIColor(hex: "0D31FF").CGColor
        view.layer.addSublayer(lilBottomLeftCircle)
        
        
        centralLosangle.frame = CGRect(x: (viewWidth - squareSide ) / 2 , y: (viewHeight - squareSide ) / 2, width: squareSide, height: squareSide)
        centralLosangle.cornerRadius = 20.0
        centralLosangle.opacity = 0.5
        centralLosangle.backgroundColor = UIColor(hex: "0B0047").CGColor
        view.layer.addSublayer(centralLosangle)
        //        centralLosangle.transform = CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, 1)
        
        centralSquare.frame = CGRect(x: (viewWidth - squareSide ) / 2 , y: (viewHeight - squareSide ) / 2, width: squareSide, height: squareSide)
        centralSquare.cornerRadius = 20.0
        centralSquare.opacity = 0.5
        centralSquare.backgroundColor = UIColor(hex: "0B0047").CGColor
        view.layer.addSublayer(centralSquare)
        
        arrowUp.frame = CGRect(x: viewWidth / 2 - 25, y: CGRectGetMaxY(view.bounds) - 150, width: 50, height: 100)
        arrowUp.fillColor = UIColor.blackColor().CGColor
        arrowUp.strokeColor = UIColor.blackColor().CGColor
        arrowUp.path = Paths.arrow(45, height: 100, lw: 20, hh: 35)
        arrowUp.opacity = 0
        view.layer.addSublayer(arrowUp)
        arrowUp.transform = CATransform3DMakeRotation(CGFloat(M_PI), 0, 0, 1)
        
        shakeTimer = NSTimer.scheduledTimerWithTimeInterval(1.2, target: self, selector: Selector("shakeLilSquare"), userInfo: nil, repeats: true)
        
        self.view.bringSubviewToFront(self.mainLabel)
        
        
        // Status inicial
        self.initialTransforms()
        
    }
    
    func initialTransforms() {
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
        
        blinkTimer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("blinkObj"), userInfo: nil, repeats: true)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if step == 0 {
            shakeTimer.invalidate()
            blinkTimer.invalidate()
            self.touchLabel.alpha = 0
            let transformScaleOne = CATransform3DMakeScale(1, 1, 1)
            
            let timeForAnimation1:CFTimeInterval = 0.3
            let timeForAnimation2:CFTimeInterval = 0.2
            let timeForAnimation3:CFTimeInterval = 1.0
            let timeForAnimation4:CFTimeInterval = 0.5
            let timeForAnimation5:CFTimeInterval = 0.4
            let timeForAnimation6:CFTimeInterval = 0.4
            let timeForAnimation7:CFTimeInterval = 0.1
            
            CATransaction.begin()
            CATransaction.setAnimationDuration(5)
            CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn))
            self.lilTopSquare.opacity = 0.5
            self.lilRightSquare.opacity = 0.5
            self.lilBottomSquare.opacity = 0.5
            self.lilLeftSquare.opacity = 0.5
            
            self.mainLabel.alpha = 1
            
            self.lilTopLeftCircle.opacity = 0.5
            self.lilTopRightCircle.opacity = 0.5
            self.lilBottomRightCircle.opacity = 0.5
            self.lilBottomLeftCircle.opacity = 0.5
            CATransaction.commit()
            
            
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
                                    
                                    self.changeText()
                                    
                                })
                                

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
                        
//                        self.arrowUpAndDownTimer = NSTimer.scheduledTimerWithTimeInterval(2.5, target: self, selector: Selector("arrowUpAndDown"), userInfo: nil, repeats: true)
                        
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
            
            self.step += 1
        }
    }
    
    func changeText() {
//        self.mainLabel.transform = CGAffineTransformMakeScale(1.2, 1.2)
        self.mainLabel.alpha = 0
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.mainLabel.text = "Hello!"
            self.mainLabel.alpha = 1
//            self.mainLabel.transform = CGAffineTransformMakeScale(1, 1)
            }, completion: { (Bool) -> Void in
                
                let x = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("imAleph"), userInfo: nil, repeats: false)

        })
    }
    
    func imAleph() {
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.mainLabel.alpha = 0
        }) { (Bool) -> Void in
            self.mainLabel.text = "My name is Aleph"
            self.mainLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
            self.mainLabel.textColor = UIColor(hex: "303030")
            
            CATransaction.begin()
            CATransaction.setAnimationDuration(1.0)
            CATransaction.setCompletionBlock({ () -> Void in
                UIView.animateWithDuration(1.0, animations: { () -> Void in
                    self.mainLabel.alpha = 1
                }, completion: { (Bool) -> Void in
                    
                    let profileBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 300 + 6))
                    profileBackground.image = UIImage(named: "alephskate")
                    profileBackground.contentMode = UIViewContentMode.ScaleAspectFill
//                    profileBackground.layer.borderColor = UIColor.redColor().CGColor
//                    profileBackground.layer.borderWidth = 1
                    profileBackground.layer.masksToBounds = true
                    self.view.addSubview(profileBackground)
                    profileBackground.alpha = 0
                    profileBackground.transform = CGAffineTransformMakeTranslation(0, -230)
                    
                    let profileImageView = UIImageView(frame: CGRect(x: self.view.bounds.width / 2 - 75, y: 60, width: 150, height: 150))
                    profileImageView.layer.masksToBounds = true
                    profileImageView.layer.cornerRadius = 75
                    
                    profileImageView.layer.borderWidth = 4
                    profileImageView.layer.borderColor = UIColor.whiteColor().CGColor
                    
                    profileImageView.image = UIImage(named: "profilealeph")
                    profileImageView.contentMode = UIViewContentMode.ScaleAspectFit
                    self.view.addSubview(profileImageView)
                    profileImageView.alpha = 0
                    profileImageView.transform = CGAffineTransformMakeTranslation(0, 100)
                    
                    
                    UIView.animateWithDuration(1.0, animations: { () -> Void in
                        self.view.bringSubviewToFront(self.mainLabel)
                        self.mainLabel.alpha = 0
                        profileImageView.alpha = 1
                        profileImageView.transform = CGAffineTransformMakeTranslation(0, 0)
                        
                        profileBackground.alpha = 1
                        profileBackground.transform = CGAffineTransformMakeTranslation(0, 0)
                        }, completion: { (Bool) -> Void in
                            UIView.animateWithDuration(0.5, animations: { () -> Void in
                                self.mainLabel.text = "Aleph Retamal"
                                self.mainLabel.alpha = 1
                                self.mainLabel.textColor = UIColor.whiteColor()
                                self.mainLabel.transform = CGAffineTransformMakeTranslation(0, -90)
                                }, completion: { (Bool) -> Void in

                                    let offsetTop:CGFloat = 300 + 6
                                    let height = (self.view.bounds.height - offsetTop + 2.3) / 4
                                    let width = self.view.bounds.width
                                    
                                    let font:UIFont = UIFont(name: "HelveticaNeue-Light", size: 20)!
                                    
                                    let btnAbout:MainButton = MainButton(type: UIButtonType.Custom)
                                    btnAbout.bounds = CGRect(x: 0, y: 0, width: width, height: height)
                                    btnAbout.center = CGPoint(x: self.view.center.x, y: offsetTop + height / 2)
                                    btnAbout.leftLabel.text = ""
                                    btnAbout.setTitle("About Me", forState: .Normal)
                                    btnAbout.setTitleColor(UIColor(hex: "303030"), forState: .Normal)
                                    btnAbout.titleLabel?.font = font
                                    btnAbout.addTarget(self, action: Selector("showAboutMe"), forControlEvents: .TouchUpInside)
                                    self.view.addSubview(btnAbout)
                                    btnAbout.transform = CGAffineTransformMakeTranslation(400, 0)
                                    
                                    let btnSkills:MainButton = MainButton(type: UIButtonType.Custom)
                                    btnSkills.bounds = CGRect(x: 0, y: 0, width: width, height: height)
                                    btnSkills.center = CGPoint(x: self.view.center.x, y: offsetTop + height * 3 / 2 - 1)
                                    btnSkills.leftLabel.text = ""
                                    btnSkills.setTitle("Skills", forState: .Normal)
                                    btnSkills.setTitleColor(UIColor(hex: "303030"), forState: .Normal)
                                    btnSkills.titleLabel?.font = font
                                    btnSkills.addTarget(self, action: Selector("showSkills"), forControlEvents: .TouchUpInside)
                                    self.view.addSubview(btnSkills)
                                    btnSkills.transform = CGAffineTransformMakeTranslation(-300, 0)
                                    
                                    let btnBackground:MainButton = MainButton(type: UIButtonType.Custom)
                                    btnBackground.bounds = CGRect(x: 0, y: 0, width: width, height: height)
                                    btnBackground.center = CGPoint(x: self.view.center.x, y:  offsetTop + height * 5 / 2 - 2)
                                    btnBackground.leftLabel.text = ""
                                    btnBackground.setTitle("Background", forState: .Normal)
                                    btnBackground.setTitleColor(UIColor(hex: "303030"), forState: .Normal)
                                    btnBackground.titleLabel?.font = font
                                    btnBackground.addTarget(self, action: Selector("showBackground"), forControlEvents: .TouchUpInside)
                                    self.view.addSubview(btnBackground)
                                    btnBackground.transform = CGAffineTransformMakeTranslation(400, 0)
//                                    
                                    let btnProjects:MainButton = MainButton(type: UIButtonType.Custom)
                                    btnProjects.bounds = CGRect(x: 0, y: 0, width: width, height: height)
                                    btnProjects.center = CGPoint(x: self.view.center.x, y:  offsetTop + height * 7 / 2 - 3)
                                    btnProjects.leftLabel.text = ""
                                    btnProjects.setTitle("Projects", forState: .Normal)
                                    btnProjects.setTitleColor(UIColor(hex: "303030"), forState: .Normal)
                                    btnProjects.titleLabel?.font = font
                                    btnProjects.addTarget(self, action: Selector("showProjects"), forControlEvents: .TouchUpInside)
                                    self.view.addSubview(btnProjects)
                                    btnProjects.transform = CGAffineTransformMakeTranslation(-300, 0)
                                    
                                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                                        btnAbout.transform = CGAffineTransformMakeTranslation(0, 0)
                                        btnSkills.transform = CGAffineTransformMakeTranslation(0, 0)
                                        btnBackground.transform = CGAffineTransformMakeTranslation(0, 0)
                                        btnProjects.transform = CGAffineTransformMakeTranslation(0, 0)
                                        
                                    }, completion: { (Bool) -> Void in
                                        
                                    })
                            })
                            
                    })
                })
            })
            
            self.centralSquare.opacity           = 0
            self.centralLosangle.opacity         = 0
            self.leftCircle.opacity              = 0
            self.rightCircle.opacity             = 0
            self.topCircle.opacity               = 0
            self.bottomCircle.opacity            = 0
            
            self.topLeftCircle.opacity           = 0
            self.topRightCircle.opacity          = 0
            self.bottomLeftCircle.opacity        = 0
            self.bottomRightCircle.opacity       = 0
            
            self.lilTopSquare.opacity            = 0
            self.lilRightSquare.opacity          = 0
            self.lilBottomSquare.opacity         = 0
            self.lilLeftSquare.opacity           = 0
            
            self.lilTopLeftCircle.opacity        = 0
            self.lilTopRightCircle.opacity       = 0
            self.lilBottomRightCircle.opacity    = 0
            self.lilBottomLeftCircle.opacity     = 0
            
            CATransaction.commit()
            
        }
    }

    
    func shakeLilSquare() {
        let shake = CAKeyframeAnimation()
        shake.keyPath = "position.y"
        shake.values = [0, -40, 30, -20, 0]
        shake.keyTimes = [0, 2.0/6.0, 4.0/6.0, 5.0/6.0, 1]
        
        shake.additive = true
        shake.duration = 0.6
        
        self.centralSquare.addAnimation(shake, forKey: "shake")
        self.centralLosangle.addAnimation(shake, forKey: "shake")
        
    }
    
    func arrowUpAndDown() {
        let upAndDown = CABasicAnimation()
        upAndDown.keyPath = "transform"
        upAndDown.fromValue = NSValue(CATransform3D: CATransform3DConcat(CATransform3DMakeTranslation(0, 0, 0), CATransform3DMakeRotation(CGFloat(M_PI), 0, 0, 1)))
        upAndDown.toValue = NSValue(CATransform3D: CATransform3DConcat(CATransform3DMakeTranslation(0, 150, 0), CATransform3DMakeRotation(CGFloat(M_PI), 0, 0, 1)))
        upAndDown.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        upAndDown.duration = 1.5
        
        let changeOpacity = CAKeyframeAnimation()
        changeOpacity.keyPath = "opacity"
        changeOpacity.values = [0, 0.4, 0.4, 0]
        changeOpacity.keyTimes = [0, 0.3, 0.7, 1]
        changeOpacity.additive = true
        changeOpacity.duration = 1.0
        changeOpacity.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        self.arrowUp.addAnimation(upAndDown, forKey: "arrowUpAndDown")
        self.arrowUp.addAnimation(changeOpacity, forKey: "changeOpacity")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showSkills" {
            transitionManager.leftSide = false
            let toViewController = segue.destinationViewController 
            toViewController.transitioningDelegate = self.transitionManager
        }

//
//        if segue.identifier == "showBackground" {
//            transitionManager.leftSide = true
//            let toViewController = segue.destinationViewController as! UIViewController
//            toViewController.transitioningDelegate = self.transitionManager
//        }
        
    }
    
    func blinkObj() {
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.touchLabel.alpha = 0.6
            }, completion: { (Bool) -> Void in
                UIView.animateWithDuration(1.0, animations: { () -> Void in
                    self.touchLabel.alpha = 0.01
                })
        })
    }
    
    func showAboutMe() {
        self.performSegueWithIdentifier("showAboutMe", sender: self)
    }
    
    func showProjects() {
        self.performSegueWithIdentifier("showProjects", sender: self)
    }
    
    func showSkills() {
        self.performSegueWithIdentifier("showSkills", sender: self)
    }
    
    func showBackground() {
        self.performSegueWithIdentifier("showBackground", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
}

