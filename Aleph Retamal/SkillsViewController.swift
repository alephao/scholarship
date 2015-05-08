//
//  SkillsViewController.swift
//  Aleph Retamal
//
//  Created by Aleph Retamal on 4/16/15.
//  Copyright (c) 2015 Aleph Retamal. All rights reserved.
//

import UIKit

class SkillsViewController: UIViewController {
    
    @IBOutlet weak var swiftBar: SkillBar!
    @IBOutlet weak var objcBar: SkillBar!
    @IBOutlet weak var uiBar: SkillBar!
    @IBOutlet weak var uxBar: SkillBar!
    @IBOutlet weak var webBar: SkillBar!
    @IBOutlet weak var rbBar: SkillBar!
    @IBOutlet weak var respBar: SkillBar!
    @IBOutlet weak var didactBar: SkillBar!
    
    @IBOutlet weak var iconLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    let statusSwift:CGFloat = 0.8
    let statusObjc:CGFloat = 0.7
    let statusUI:CGFloat = 0.5
    let statusUX:CGFloat = 0.45
    let statusWeb:CGFloat = 0.75
    let statusRuby:CGFloat = 0.55
    let statusResponsive:CGFloat = 0.5
    let statusAutodidactism:CGFloat = 1.0
    
    @IBAction func back(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backButton.layer.cornerRadius = 20
        iconLabel.alpha = 0
        
        let swipeGestureRight = UISwipeGestureRecognizer(target: self, action: Selector("swipedView:"))
        swipeGestureRight.direction = .Right
        view.addGestureRecognizer(swipeGestureRight)
        
        swiftBar.fillLevel = 0
        objcBar.fillLevel = 0
        uiBar.fillLevel = 0
        uxBar.fillLevel = 0
        webBar.fillLevel = 0
        rbBar.fillLevel = 0
        respBar.fillLevel = 0
        didactBar.fillLevel = 0
        
        titleLabel.transform = CGAffineTransformMakeTranslation(-500, 0)
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.5)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn))
        CATransaction.setCompletionBlock { () -> Void in
            CATransaction.begin()
            CATransaction.setAnimationDuration(0.2)
CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
            CATransaction.setCompletionBlock({ () -> Void in
                CATransaction.begin()
                CATransaction.setAnimationDuration(0.3)
CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
                self.swiftBar.fillLevel = self.statusSwift
                self.objcBar.fillLevel = self.statusObjc
                self.uiBar.fillLevel = self.statusUI
                self.uxBar.fillLevel = self.statusUX
                self.webBar.fillLevel = self.statusWeb
                self.rbBar.fillLevel = self.statusRuby
                self.respBar.fillLevel = self.statusResponsive
                self.didactBar.fillLevel = self.statusAutodidactism
                UIView.animateWithDuration(1.0, animations: { () -> Void in
                    self.iconLabel.alpha = 1
                })
                CATransaction.commit()
            })
            self.swiftBar.fillLevel = self.statusSwift*4/5
            self.objcBar.fillLevel = self.statusObjc*4/5
            self.uiBar.fillLevel = self.statusUI*4/5
            self.uxBar.fillLevel = self.statusUX*4/5
            self.webBar.fillLevel = self.statusWeb*4/5
            self.rbBar.fillLevel = self.statusRuby*4/5
            self.respBar.fillLevel = self.statusResponsive*4/5
            self.didactBar.fillLevel = self.statusAutodidactism*4/5
            CATransaction.commit()
        }
        
        self.swiftBar.fillLevel = self.statusSwift
        self.objcBar.fillLevel = self.statusObjc
        self.uiBar.fillLevel = self.statusUI
        self.uxBar.fillLevel = self.statusUX
        self.webBar.fillLevel = self.statusWeb
        self.rbBar.fillLevel = self.statusRuby
        self.respBar.fillLevel = self.statusResponsive
        self.didactBar.fillLevel = self.statusAutodidactism
        
        CATransaction.commit()
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.titleLabel.transform = CGAffineTransformMakeTranslation(100, 0)
        }) { (Bool) -> Void in
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.titleLabel.transform = CGAffineTransformMakeTranslation(-50, 0)
                }) { (Bool) -> Void in
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.titleLabel.transform = CGAffineTransformMakeTranslation(0, 0)
                    })
            }
        }
        
    }
    
    
    func swipedView(sgr:UISwipeGestureRecognizer) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}
