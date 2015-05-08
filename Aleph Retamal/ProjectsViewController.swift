//
//  ProjectsViewController.swift
//  Aleph Retamal
//
//  Created by Aleph Retamal on 4/16/15.
//  Copyright (c) 2015 Aleph Retamal. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController {

    var firstImageView: ImageView4Drag!
    var secondImageView: ImageView4Drag!
    var thirdImageView: ImageView4Drag!
    
    var theImageView: UIImageView!
    
    var gravity: UIGravityBehavior!
    var animator: UIDynamicAnimator!
    var collision: UICollisionBehavior!
    
    var theIMVCenter: CGPoint!
    var seiLa: CGPoint!
    
    var imageViewInsideSquare: ImageView4Drag!
    
    var dragging: Bool = false
    
    var currentApp = 0
    
    var appPreview:UIImageView!
    var appPreview2:UIImageView!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var seePhotosButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var appDescriptionTextArea: UITextView!
    
    
    @IBAction func back(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.layer.cornerRadius = 20
        
        let cornerRadius:CGFloat = 30.0
        let margin:CGFloat = 10
        let squareSize = (view.bounds.width - 32 - margin * 2) / 3
        
        let bottomMargin:CGFloat = 40
    
        self.seePhotosButton.alpha = 0
        
        let swipeAppPreviewLeft = UISwipeGestureRecognizer(target: self, action: Selector("swipedAppp:"))
        swipeAppPreviewLeft.direction = .Left
        let swipeAppPreviewRight = UISwipeGestureRecognizer(target: self, action: Selector("swipedAppp:"))
        swipeAppPreviewRight.direction = .Right
        
        let swipeAppPreview2Right = UISwipeGestureRecognizer(target: self, action: Selector("swipedAppp2:"))
        swipeAppPreview2Right.direction = .Right
        
        
        appPreview = UIImageView(frame: view.frame)
        appPreview.addGestureRecognizer(swipeAppPreviewLeft)
        appPreview.addGestureRecognizer(swipeAppPreviewRight)
        appPreview.userInteractionEnabled = true
        view.addSubview(appPreview)
        
        appPreview.transform = CGAffineTransformMakeTranslation(view.bounds.width, 0)
        appPreview2 = UIImageView(frame: view.frame)
        appPreview2.addGestureRecognizer(swipeAppPreview2Right)
        appPreview2.userInteractionEnabled = true
        view.addSubview(appPreview2)
        appPreview2.transform = CGAffineTransformMakeTranslation(view.bounds.width, 0)

        
        firstImageView = ImageView4Drag(frame: CGRect(x: (CGRectGetWidth(view.frame) - squareSize) / 2 - squareSize - margin, y: -100, width: squareSize, height: squareSize))
        firstImageView.image = UIImage(named: "copycat")
        firstImageView.userInteractionEnabled = true
        firstImageView.appName = "CopyCat"
        firstImageView.appDescription = "CopyCat is a simple mimic game that I created with other two friends. It is my first ever app and it is already available on App Store. It was the first challenge given at BEPiD and I wanted to put it on App Store to see what people would say about it and how many hits I could get with a simple game, with no marketing and this kind of stuff."
        firstImageView.appNumber = 1
        view.addSubview(firstImageView)

        
        secondImageView = ImageView4Drag(frame: CGRect(x: (CGRectGetWidth(view.frame) - squareSize) / 2, y: -200, width: squareSize, height: squareSize))
        secondImageView.image = UIImage(named: "rendezvous")
        secondImageView.userInteractionEnabled = true
        secondImageView.appName = "Rendezvous"
        secondImageView.appDescription = "This app was the result of the second challenge proposed at BEPiD, but it is still work in progress. In this app we use Bluetooth signal and the compass to help people find each other in events, parties and places with a high density of prople"
        secondImageView.appNumber = 2
        view.addSubview(secondImageView)
        
        thirdImageView = ImageView4Drag(frame: CGRect(x: (CGRectGetWidth(view.frame) - squareSize) / 2 + squareSize + margin, y: -300, width: squareSize, height: squareSize))
        thirdImageView.image = UIImage(named: "bomsono")
        thirdImageView.userInteractionEnabled = true
        thirdImageView.appName = "BomSono (GoodSleep)"
        thirdImageView.appDescription = "We observed that some people have difficulty keeping the record of their sleep disturbs on their journals/diaries in order to report to their doctors, who in turn also face challenges to follow up with their patients. BomSono makes it easier for patients to fill their sleep diary and generates a report for doctors to see how their patients are doing."
        thirdImageView.appNumber = 3
        thirdImageView.layer.cornerRadius = 25
        thirdImageView.layer.masksToBounds = true
        view.addSubview(thirdImageView)
        
        theImageView = UIImageView(frame: CGRect(x: (CGRectGetWidth(view.frame) - squareSize) / 2, y: view.bounds.height - bottomMargin - margin - 2*squareSize, width: squareSize, height: squareSize))
        theImageView.layer.borderColor = UIColor(hex: "888888").CGColor
        theImageView.alpha = 0.5
        theImageView.layer.borderWidth = 3
        theImageView.layer.cornerRadius = 25
        theImageView.backgroundColor = UIColor.clearColor()
        view.addSubview(theImageView)
        
        let insertImageLabel = UILabel(frame: theImageView.frame)
        insertImageLabel.text = "Drag App\nHere"
        insertImageLabel.numberOfLines = 2
        insertImageLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 17)
        insertImageLabel.textAlignment = NSTextAlignment.Center
        insertImageLabel.textColor = UIColor(hex: "888888")
        view.addSubview(insertImageLabel)
        
        view.bringSubviewToFront(theImageView)
        view.bringSubviewToFront(firstImageView)
        view.bringSubviewToFront(secondImageView)
        view.bringSubviewToFront(thirdImageView)
        
        appNameLabel.text = ""
        appDescriptionTextArea.text = ""
        self.appNameLabel.alpha = 0
        self.appDescriptionTextArea.alpha = 0
        
        collision = UICollisionBehavior(items: [firstImageView, secondImageView, thirdImageView])
        collision.addBoundaryWithIdentifier("barrier", fromPoint: CGPoint(x: 0, y: view.bounds.height - bottomMargin), toPoint: CGPoint(x: view.bounds.width, y:  view.bounds.height - bottomMargin))
        collision.addBoundaryWithIdentifier("leftBarrier", fromPoint: CGPoint(x: 0, y: 0), toPoint: CGPoint(x: 0, y:  view.bounds.height))
        collision.addBoundaryWithIdentifier("rightBarrier", fromPoint: CGPoint(x: view.bounds.width, y: 0), toPoint: CGPoint(x: view.bounds.width, y:  view.bounds.height))
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [firstImageView, secondImageView, thirdImageView])
        animator.addBehavior(gravity)
        animator.addBehavior(collision)

        self.titleLabel.transform = CGAffineTransformMakeTranslation(-400, 0)
        
        let animationTime = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("setImageCentersAndDragGestures"), userInfo: nil, repeats: false)
        
        let swipeDownGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("recognizeSwipe:"))
        swipeDownGestureRecognizer.direction = .Down
        view.addGestureRecognizer(swipeDownGestureRecognizer)
        
        self.view.bringSubviewToFront(self.appPreview)
        self.view.bringSubviewToFront(self.appPreview2)
        
    }
    
    override func viewDidLayoutSubviews() {
        UIView.animateWithDuration(0.5, delay: 0.5, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.titleLabel.transform = CGAffineTransformMakeTranslation(0, 0)
        }) { (Bool) -> Void in
        }
    }
    
    func moveViewWithGestureRecognizer(pgr:UIPanGestureRecognizer) {
        let touchLocation:CGPoint = pgr.locationInView(self.view)
        if pgr.state == .Began {
            self.dragging = true
        } else if pgr.state == .Ended {
            self.dragging = false
            if CGRectContainsPoint(self.theImageView.frame, touchLocation) {
                if self.imageViewInsideSquare != nil {
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.imageViewInsideSquare.center = self.imageViewInsideSquare.originalCenter
                    })
                }
                    self.imageViewInsideSquare = pgr.view as! ImageView4Drag
                
                self.theImageView.alpha = 0
                
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    pgr.view?.center = self.theImageView.center
                    self.appNameLabel.alpha = 0
                    self.appDescriptionTextArea.alpha = 0
                    self.seePhotosButton.alpha = 0
                }, completion: { (Bool) -> Void in
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.appNameLabel.text = self.imageViewInsideSquare.appName
                        self.appDescriptionTextArea.text = self.imageViewInsideSquare.appDescription
                        self.currentApp = self.imageViewInsideSquare.appNumber
                        self.appNameLabel.alpha = 1
                        self.appDescriptionTextArea.alpha = 1
                        self.seePhotosButton.alpha = 1
                    })
                })
            } else {
                let currentView = pgr.view as! ImageView4Drag
                if currentView.appName == self.appNameLabel.text {
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.appNameLabel.alpha = 0
                        self.appDescriptionTextArea.alpha = 0
                        self.seePhotosButton.alpha = 0
                        self.imageViewInsideSquare != nil
                        self.theImageView.alpha = 1
                        self.currentApp = 0
                    })
                }
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    let theIMV = pgr.view as! ImageView4Drag
                    theIMV.center = theIMV.originalCenter
                })
            }
            
        } else {
            pgr.view?.center = touchLocation
        }
        
    }
    
    func setImageCentersAndDragGestures() {
        let dragGesture3 = UIPanGestureRecognizer(target: self, action: Selector("moveViewWithGestureRecognizer:"))
        let dragGesture2 = UIPanGestureRecognizer(target: self, action: Selector("moveViewWithGestureRecognizer:"))
        let dragGesture1 = UIPanGestureRecognizer(target: self, action: Selector("moveViewWithGestureRecognizer:"))
        
        firstImageView.addGestureRecognizer(dragGesture1)
        secondImageView.addGestureRecognizer(dragGesture2)
        thirdImageView.addGestureRecognizer(dragGesture3)
        
        firstImageView.originalCenter = firstImageView.center
        secondImageView.originalCenter = secondImageView.center
        thirdImageView.originalCenter = thirdImageView.center
    }

    func recognizeSwipe(sgr:UISwipeGestureRecognizer) {
        switch sgr.direction {
        case UISwipeGestureRecognizerDirection.Down:
            self.dismissViewControllerAnimated(true, completion: nil)
        default:
            break
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func seePhotos(sender: UIButton) {
        if self.currentApp == 1 {
            self.appPreview.image = UIImage(named: "copycat1")
            self.appPreview2.image = UIImage(named: "copycat2")
        }
        
        if self.currentApp == 2 {
            self.appPreview.image = UIImage(named: "rendezvous1")
            self.appPreview2.image = UIImage(named: "rendezvous2")
        }
        
        if self.currentApp == 3 {
            self.appPreview.image = UIImage(named: "bomsono1")
            self.appPreview2.image = UIImage(named: "bomsono2")
        }
        
        UIView.animateWithDuration(0.35, animations: { () -> Void in
            self.appPreview.transform = CGAffineTransformMakeTranslation(0, 0)
        })
    }
    
    func swipedAppp(sgr:UISwipeGestureRecognizer) {
        if sgr.direction == .Left {
            UIView.animateWithDuration(0.35, animations: { () -> Void in
                self.appPreview.transform = CGAffineTransformMakeTranslation(-self.view.bounds.width, 0)
                self.appPreview2.transform = CGAffineTransformMakeTranslation(0, 0)
            })
        }
        
        if sgr.direction == .Right {
            UIView.animateWithDuration(0.35, animations: { () -> Void in
                self.appPreview.transform = CGAffineTransformMakeTranslation(self.view.bounds.width, 0)
            })
        }
    }
    
    func swipedAppp2(sgr:UISwipeGestureRecognizer) {
        if sgr.direction == .Right {
            UIView.animateWithDuration(0.35, animations: { () -> Void in
                self.appPreview.transform = CGAffineTransformMakeTranslation(0, 0)
                self.appPreview2.transform = CGAffineTransformMakeTranslation(self.view.bounds.width, 0)
            })
        }
    }
}
