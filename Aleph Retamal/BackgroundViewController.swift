//
//  BackgroundViewController.swift
//  Aleph Retamal
//
//  Created by Aleph Retamal on 4/19/15.
//  Copyright (c) 2015 Aleph Retamal. All rights reserved.
//

import UIKit

class BackgroundViewController: UIViewController {
    
    let circleDiameter = 70
    
    var squareUpLeft : CAShapeLayer!
    var squareUpRight : CAShapeLayer!
    var squareDownLeft : CAShapeLayer!
    var squareDownRight : CAShapeLayer!
    
    var actualSubject = 0
    
    var subjects : [BackgroundSubject]!
    
    var lblLeftUp: UILabel!
    var lblRightUp: UILabel!
    var lblLeftDown: UILabel!
    var lblRightDown: UILabel!
    
    var lblLeftUpTitle: UILabel!
    var lblRightUpTitle: UILabel!
    var lblLeftDownTitle: UILabel!
    var lblRightDownTitle: UILabel!

    var lblLeftUpSubTitle: UILabel!
    var lblRightUpSubTitle: UILabel!
    var lblLeftDownSubTitle: UILabel!
    var lblRightDownSubTitle: UILabel!
    
    var arrowLeft: CAShapeLayer!
    var arrowRight: CAShapeLayer!
    
    @IBOutlet weak var middleButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rectangleHeight:CGFloat = view.bounds.height / 2
        let rectangleWidth:CGFloat = view.bounds.width / 2
        subjects = [BackgroundSubject(title: "", color: UIColor(hex: "68BA33"), titleText: "EDUCATION", lu: "", ru: "", ld: "", rd: "", lut: "\nHigh School\nAnglo Morumbi", rut: "\nMackenzie University", ldt: "\nBEPiD\niOS Development", rdt: "", lust: "2012 (finished)", rust: "2014 (enrolled)", ldst: "2015 (started)", rdst: ""),
                    BackgroundSubject(title: "", color: UIColor(hex: "139A88"), titleText: "PROFESSIONAL", lu: "", ru: "", ld: "", rd: "", lut: "\nHeptagon\nWeb Developer", rut: "\nEnsemble Partners\nUI/UX Designer", ldt: "\nElephant Room\nWeb Developer", rdt: "\nBEPiD\n iOS Developer", lust: "2013", rust: "2014", ldst: "2014", rdst: "2015"),
                    BackgroundSubject(title: "", color: UIColor(hex: "FEDE0B"), titleText: "INTERESTS", lu: "", ru: "", ld: "", rd: "", lut: "\nEntepreneurship", rut: "\nNatural Computing", ldt: "\nInformation Security", rdt: "\nRadical Sports", lust: "", rust: "", ldst: "", rdst: "")]
        
        let theSubject = self.subjects[self.actualSubject]
        
        squareUpLeft = CAShapeLayer()
        squareUpLeft.bounds = CGRect(x: 0, y: 0, width: rectangleWidth, height: rectangleHeight)
        squareUpLeft.position = CGPoint(x: rectangleWidth / 2, y: rectangleHeight / 2)
        squareUpLeft.backgroundColor = theSubject.color.CGColor
        view.layer.addSublayer(squareUpLeft)
        
        squareUpRight = CAShapeLayer()
        squareUpRight.bounds = CGRect(x: 0, y: 0, width: rectangleWidth, height: rectangleHeight)
        squareUpRight.position = CGPoint(x: rectangleWidth * 3 / 2, y: rectangleHeight / 2)
        squareUpRight.backgroundColor = UIColor(hex: "ffffff").CGColor
        view.layer.addSublayer(squareUpRight)
        
        squareDownLeft = CAShapeLayer()
        squareDownLeft.bounds = CGRect(x: 0, y: 0, width: rectangleWidth, height: rectangleHeight)
        squareDownLeft.position = CGPoint(x: rectangleWidth / 2, y: rectangleHeight * 3 / 2)
        squareDownLeft.backgroundColor = UIColor(hex: "ffffff").CGColor
        view.layer.addSublayer(squareDownLeft)
        
        squareDownRight = CAShapeLayer()
        squareDownRight.bounds = CGRect(x: 0, y: 0, width: rectangleWidth, height: rectangleHeight)
        squareDownRight.position = CGPoint(x: rectangleWidth * 3 / 2, y: rectangleHeight * 3 / 2)
        squareDownRight.backgroundColor = theSubject.color.CGColor
        view.layer.addSublayer(squareDownRight)
        
        
        
        middleButton.layer.cornerRadius = middleButton.bounds.width / 2
        middleButton.layer.shadowColor = UIColor.blackColor().CGColor
        middleButton.layer.shadowOpacity = 0.5
        middleButton.layer.shadowOffset = CGSizeMake(0, 0)
        

        backButton.layer.cornerRadius = backButton.bounds.width / 2
        

        
        lblLeftUp = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width / 2, height: 100))
        lblLeftUp.text = theSubject.lu
        lblLeftUp.font = UIFont(name: "FontAwesome", size: 70)
        lblLeftUp.textColor = UIColor.whiteColor()
        lblLeftUp.center = squareUpLeft.position
        lblLeftUp.textAlignment = .Center
        view.addSubview(lblLeftUp)
        
        lblRightUp = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width / 2, height: 100))
        lblRightUp.text = theSubject.ru
        lblRightUp.font = UIFont(name: "FontAwesome", size: 70)
        lblRightUp.textColor = theSubject.color
        lblRightUp.center = squareUpRight.position
        lblRightUp.textAlignment = .Center
        view.addSubview(lblRightUp)
        
        lblRightDown = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width / 2, height: 100))
        lblRightDown.text = theSubject.rd
        lblRightDown.font = UIFont(name: "FontAwesome", size: 70)
        lblRightDown.textColor = UIColor.whiteColor()
        lblRightDown.center = squareDownRight.position
        lblRightDown.textAlignment = .Center
        view.addSubview(lblRightDown)
        
        lblLeftDown = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width / 2, height: 100))
        lblLeftDown.text = theSubject.ld
        lblLeftDown.font = UIFont(name: "FontAwesome", size: 70)
        lblLeftDown.textColor = theSubject.color
        lblLeftDown.center = squareDownLeft.position
        lblLeftDown.textAlignment = .Center
        view.addSubview(lblLeftDown)
        
        lblLeftUpTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width / 2, height: 60))
        lblLeftUpTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        lblLeftUpTitle.textColor = UIColor.whiteColor()
        lblLeftUpTitle.textAlignment = .Center
        lblLeftUpTitle.center = CGPoint(x: lblLeftUp.center.x, y: lblLeftUp.center.y + lblLeftUp.bounds.height / 2)
        lblLeftUpTitle.text = theSubject.lut
        lblLeftUpTitle.numberOfLines = 3
        view.addSubview(lblLeftUpTitle)
        
        lblLeftUpSubTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 20))
        lblLeftUpSubTitle.font = UIFont(name: "HelveticaNeue-Light", size: 14)
        lblLeftUpSubTitle.textColor = UIColor.whiteColor()
        lblLeftUpSubTitle.textAlignment = .Center
        lblLeftUpSubTitle.center = CGPoint(x: lblLeftUp.center.x, y: lblLeftUp.center.y - lblLeftUp.bounds.height / 2)
        lblLeftUpSubTitle.text = theSubject.lust
        view.addSubview(lblLeftUpSubTitle)
        
        lblRightUpTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width / 2, height: 60))
        lblRightUpTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        lblRightUpTitle.textColor = theSubject.color
        lblRightUpTitle.textAlignment = .Center
        lblRightUpTitle.center = CGPoint(x: lblRightUp.center.x, y: lblRightUp.center.y + lblRightUp.bounds.height / 2)
        lblRightUpTitle.text = theSubject.rut
        lblRightUpTitle.numberOfLines = 3
        view.addSubview(lblRightUpTitle)
        
        lblRightUpSubTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 20))
        lblRightUpSubTitle.font = UIFont(name: "HelveticaNeue-Light", size: 14)
        lblRightUpSubTitle.textColor = theSubject.color
        lblRightUpSubTitle.textAlignment = .Center
        lblRightUpSubTitle.center = CGPoint(x: lblRightUp.center.x, y: lblRightUp.center.y - lblRightUp.bounds.height / 2)
        lblRightUpSubTitle.text = theSubject.rust
        view.addSubview(lblRightUpSubTitle)
        
        lblRightDownTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width / 2, height: 60))
        lblRightDownTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        lblRightDownTitle.textColor = UIColor.whiteColor()
        lblRightDownTitle.textAlignment = .Center
        lblRightDownTitle.center = CGPoint(x: lblRightDown.center.x, y: lblRightDown.center.y + lblRightDown.bounds.height / 2)
        lblRightDownTitle.text = theSubject.rdt
        lblRightDownTitle.numberOfLines = 3
        view.addSubview(lblRightDownTitle)
        
        lblRightDownSubTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 20))
        lblRightDownSubTitle.font = UIFont(name: "HelveticaNeue-Light", size: 14)
        lblRightDownSubTitle.textColor = UIColor.whiteColor()
        lblRightDownSubTitle.textAlignment = .Center
        lblRightDownSubTitle.center = CGPoint(x: lblRightDown.center.x, y: lblRightDown.center.y - lblRightDown.bounds.height / 2)
        lblRightDownSubTitle.text = theSubject.rdst
        view.addSubview(lblRightDownSubTitle)
        
        lblLeftDownTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width / 2, height: 60))
        lblLeftDownTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        lblLeftDownTitle.textColor = theSubject.color
        lblLeftDownTitle.textAlignment = .Center
        lblLeftDownTitle.center = CGPoint(x: lblLeftDown.center.x, y: lblLeftDown.center.y + lblLeftDown.bounds.height / 2)
        lblLeftDownTitle.text = theSubject.ldt
        lblLeftDownTitle.numberOfLines = 3
        view.addSubview(lblLeftDownTitle)
        
        lblLeftDownSubTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 20))
        lblLeftDownSubTitle.font = UIFont(name: "HelveticaNeue-Light", size: 14)
        lblLeftDownSubTitle.textColor = theSubject.color
        lblLeftDownSubTitle.textAlignment = .Center
        lblLeftDownSubTitle.center = CGPoint(x: lblLeftDown.center.x, y: lblLeftDown.center.y - lblLeftDown.bounds.height / 2)
        lblLeftDownSubTitle.text = theSubject.ldst
        view.addSubview(lblLeftDownSubTitle)
        
        
        
        view.bringSubviewToFront(middleButton)
        view.bringSubviewToFront(backButton)
        view.bringSubviewToFront(titleLabel)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: Selector("swipedView:"))
        swipeDown.direction = .Down
        view.addGestureRecognizer(swipeDown)
        
        arrowLeft = CAShapeLayer()
        arrowLeft.path = Paths.arrow(20, height: 30, lw: 10, hh: 10)
        arrowLeft.transform = CATransform3DMakeRotation(CGFloat(M_PI_2), 0, 0, 1)
        arrowLeft.position = CGPoint(x: view.center.x + 90, y: view.center.y - 10)
        arrowLeft.opacity = 0.4
        arrowLeft.fillColor = UIColor(hex: "999999").CGColor
        self.view.layer.addSublayer(arrowLeft)
        
        arrowRight = CAShapeLayer()
        arrowRight.path = Paths.arrow(20, height: 30, lw: 10, hh: 10)
        arrowRight.transform = CATransform3DMakeRotation(-CGFloat(M_PI_2), 0, 0, 1)
        arrowRight.position = CGPoint(x: view.center.x - 90, y: view.center.y + 10)
        arrowRight.opacity = 0.4
        
        arrowRight.fillColor = UIColor(hex: "999999").CGColor
        self.view.layer.addSublayer(arrowRight)
        
        
        self.animateArrows()
    }
    
    func swipedView(sgr:UISwipeGestureRecognizer) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func backToView(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func middleButtonTUI(sender: UIButton) {
        changeSubject()
        let bgSubject = self.subjects[self.actualSubject]
        
        UIView.animateWithDuration(0.15, animations: { () -> Void in
            sender.transform = CGAffineTransformMakeScale(1.0, 1.0)
            sender.transform = CGAffineTransformMakeRotation(-CGFloat(M_PI))
            
//            self.lblLeftUp.center = self.middleButton.center
//            self.lblRightUp.center = self.middleButton.center
//            self.lblRightDown.center = self.middleButton.center
//            self.lblLeftDown.center = self.middleButton.center
            
            self.lblLeftUp.alpha    = 0
            self.lblRightUp.alpha   = 0
            self.lblRightDown.alpha = 0
            self.lblLeftDown.alpha  = 0
            
            self.lblLeftUpTitle.alpha       = 0
            self.lblRightUpTitle.alpha      = 0
            self.lblRightDownTitle.alpha    = 0
            self.lblLeftDownTitle.alpha     = 0
            
            self.lblLeftUpSubTitle.alpha    = 0
            self.lblRightUpSubTitle.alpha   = 0
            self.lblRightDownSubTitle.alpha = 0
            self.lblLeftDownSubTitle.alpha  = 0
            
        }) { (Bool) -> Void in
            sender.setTitle(bgSubject.title, forState: UIControlState.Normal)
            
            self.lblLeftUp.text     = bgSubject.lu
            self.lblRightUp.text    = bgSubject.ru
            self.lblRightDown.text  = bgSubject.rd
            self.lblLeftDown.text   = bgSubject.ld
            
            self.lblLeftUpTitle.text    = bgSubject.lut
            self.lblRightUpTitle.text   = bgSubject.rut
            self.lblRightDownTitle.text = bgSubject.rdt
            self.lblLeftDownTitle.text  = bgSubject.ldt
            
            
            self.lblLeftUpSubTitle.text     = bgSubject.lust
            self.lblRightUpSubTitle.text    = bgSubject.rust
            self.lblRightDownSubTitle.text  = bgSubject.rdst
            self.lblLeftDownSubTitle.text   = bgSubject.ldst
            
            self.lblRightUp.textColor = bgSubject.color
            self.lblLeftDown.textColor = bgSubject.color
            
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                sender.transform = CGAffineTransformMakeRotation(-CGFloat(2*M_PI))
                
//                self.lblLeftUp.center = self.squareUpLeft.position
//                self.lblRightUp.center = self.squareUpRight.position
//                self.lblRightDown.center = self.squareDownRight.position
//                self.lblLeftDown.center = self.squareDownLeft.position
                
                self.lblLeftUp.alpha    = 1
                self.lblRightUp.alpha   = 1
                self.lblRightDown.alpha = 1
                self.lblLeftDown.alpha  = 1
                
                self.lblLeftUpTitle.alpha       = 1
                self.lblRightUpTitle.alpha      = 1
                self.lblRightDownTitle.alpha    = 1
                self.lblLeftDownTitle.alpha     = 1
                
                self.lblLeftUpSubTitle.alpha    = 1
                self.lblRightUpSubTitle.alpha   = 1
                self.lblRightDownSubTitle.alpha = 1
                self.lblLeftDownSubTitle.alpha  = 1
                
                self.lblLeftUpTitle.textColor       = UIColor.whiteColor()
                self.lblRightUpTitle.textColor      = bgSubject.color
                self.lblRightDownTitle.textColor    = UIColor.whiteColor()
                self.lblLeftDownTitle.textColor     = bgSubject.color
                
                self.lblLeftUpSubTitle.textColor    = UIColor.whiteColor()
                self.lblRightUpSubTitle.textColor   = bgSubject.color
                self.lblRightDownSubTitle.textColor = UIColor.whiteColor()
                self.lblLeftDownSubTitle.textColor  = bgSubject.color
            })
        }
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            let theColor:UIColor = bgSubject.color
            self.middleButton.backgroundColor = theColor
            self.squareUpLeft.backgroundColor = theColor.CGColor
            self.squareDownRight.backgroundColor = theColor.CGColor
            self.titleLabel.text = bgSubject.titleText
    
        })
    }
    
    @IBAction func middleButtonTUO(sender: UIButton) {
        UIView.animateWithDuration(0.15, animations: { () -> Void in
            sender.transform = CGAffineTransformMakeScale(1.0, 1.0)
        })
    }
    
    @IBAction func middleButtonTD(sender: UIButton) {
        UIView.animateWithDuration(0.15, animations: { () -> Void in
            sender.transform = CGAffineTransformMakeScale(1.1, 1.1)
        })
    }
    
    
    @IBAction func middleButtonCancel(sender: UIButton) {
        UIView.animateWithDuration(0.15, animations: { () -> Void in
            sender.transform = CGAffineTransformMakeScale(1.0, 1.0)
        })
    }
    
    func changeSubject() {
        if actualSubject == subjects.count - 1 {
            actualSubject = 0
        } else {
            actualSubject++
        }
    }
    
    func animateArrows() {
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.4)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
        CATransaction.setCompletionBlock { () -> Void in
            CATransaction.begin()
            CATransaction.setAnimationDuration(0.4)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
            CATransaction.setCompletionBlock({ () -> Void in
                self.animateArrows()
            })
        self.arrowLeft.transform = CATransform3DConcat(CATransform3DMakeRotation(CGFloat(M_PI_2), 0, 0, 1), CATransform3DMakeTranslation(0, 0, 0))
        self.arrowRight.transform = CATransform3DConcat(CATransform3DMakeRotation(-CGFloat(M_PI_2), 0, 0, 1), CATransform3DMakeTranslation(0, 0, 0))
            CATransaction.commit()
        }
        self.arrowLeft.transform = CATransform3DConcat(CATransform3DMakeRotation(CGFloat(M_PI_2), 0, 0, 1), CATransform3DMakeTranslation(30, 0, 0))
        self.arrowRight.transform = CATransform3DConcat(CATransform3DMakeRotation(-CGFloat(M_PI_2), 0, 0, 1), CATransform3DMakeTranslation(-30, 0, 0))
        CATransaction.commit()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
