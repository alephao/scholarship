//
//  AboutMeViewController.swift
//  Aleph Retamal
//
//  Created by Aleph Retamal on 4/19/15.
//  Copyright (c) 2015 Aleph Retamal. All rights reserved.
//

import UIKit
import MapKit

class AboutMeViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var touchLabel: UILabel!
    
    let transitionManager = TransitionManager()
    
    var mapViewOne: MKMapView!
    var bottomView: UIView!
    
    var middleLabel: UILabel!
    
    var legendLabel: UILabel!
    
    var step = 0
    var animating = false
    
    var imageViewOne: UIImageView!
    var imageViewTwo: UIImageView!
    
    var touchTimer: NSTimer!
    
    @IBAction func back(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.touchLabel.alpha = 0
        
        backButton.layer.cornerRadius = 20
        
        let viewWidth:CGFloat = view.bounds.width
        let viewHeight:CGFloat = view.bounds.height
        let bottomViewHeight:CGFloat = 100
        
//        mapViewOne = MKMapView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight))
        mapViewOne = MKMapView(frame: view.frame)
        view.addSubview(mapViewOne)
        
        bottomView = UIView(frame: CGRect(x: 0, y: viewHeight - 100, width: viewWidth, height: bottomViewHeight))
        bottomView.backgroundColor = UIColor.blackColor()
        bottomView.alpha = 0.5
        view.addSubview(bottomView)
        
        legendLabel = UILabel(frame: bottomView.frame)
        legendLabel.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        legendLabel.lineBreakMode = .ByWordWrapping
        legendLabel.textColor = UIColor.whiteColor()
        legendLabel.textAlignment = .Center
        legendLabel.numberOfLines = 3
        view.addSubview(legendLabel)
        
        mapViewOne.alpha = 0
        bottomView.alpha = 0
        
        middleLabel = UILabel(frame: CGRect(x: 0, y: viewHeight / 2 - 75, width: viewWidth, height: 150))
        middleLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
        middleLabel.textAlignment = .Center
        middleLabel.text = "Hello!\nHere I will show you a short\nstory about my life"
        middleLabel.numberOfLines = 4
        middleLabel.alpha = 0
        view.addSubview(middleLabel)
        
        imageViewOne = UIImageView(frame: view.frame)
        imageViewOne.contentMode = UIViewContentMode.ScaleAspectFill
        imageViewOne.layer.masksToBounds = true
//        imageViewOne.backgroundColor = UIColor.yellowColor()
        imageViewTwo = UIImageView(frame: view.frame)
        imageViewTwo.contentMode = UIViewContentMode.ScaleAspectFill
        imageViewTwo.layer.masksToBounds = true
//        imageViewTwo.backgroundColor = UIColor.blueColor()
    
        
        let timerOne = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: Selector("firstStep"), userInfo: nil, repeats: false)
        self.step++
    }
    
    func initBlinkTimer() {
        self.touchTimer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: Selector("blinkObj"), userInfo: nil, repeats: true)
    }
    
    func firstStep() {
        self.animating = true
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.middleLabel.alpha = 1
        }) { (Bool) -> Void in
            self.initBlinkTimer()
            self.step++
            self.animating = false
        }
    }
    
    func secondStep() {
        self.animating = true
        self.touchTimer.invalidate()
        self.touchLabel.alpha = 0
        mapViewOne.alpha = 0
        bottomView.alpha = 0
        self.view.bringSubviewToFront(self.backButton)
        self.view.bringSubviewToFront(self.touchLabel)
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.middleLabel.alpha = 0
        }) { (Bool) -> Void in
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                self.mapViewOne.alpha = 1
                self.bottomView.alpha = 0.5
            }, completion: { (Bool) -> Void in
                //-18.931271, -48.286023
                
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: -18.931271, longitude: -48.286023)
                let region:MKCoordinateRegion = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
                self.mapViewOne.setRegion(region, animated: true)
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                annotation.title = "Hospital Santa Marta"
                self.mapViewOne.addAnnotation(annotation)
                
                self.legendLabel.alpha = 0
                self.legendLabel.text = "I was born in 1994 in this hospital.\nUberlândia - Minas Gerais, Brazil"
                
                UIView.animateWithDuration(1.0, animations: { () -> Void in
                    self.legendLabel.alpha = 1
                }, completion: { (Bool) -> Void in

                    self.step++
                    self.animating = false
                })
            })
        }
    }
    
    func thirdStep() {
        self.touchTimer.invalidate()
        self.touchLabel.alpha = 0
        self.animating = true
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            self.legendLabel.alpha = 0
            
        }) { (Bool) -> Void in
            self.legendLabel.text = "When I was 7 I moved to São Paulo"
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                //            -23.566887, -46.645620
                //            -18.931271, -48.286023
                //(-18.931271 + -23.566887) / 2 = -21.249079
                //(-46.645620 + -48.286023) / 2 = -47.4658215
                
                // 4.635616, 1.640403
                
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: -23.566887, longitude: -46.645620)
                let region:MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -21.249079, longitude: -47.4658215), span: MKCoordinateSpan(latitudeDelta: 4, longitudeDelta: 4))
                self.mapViewOne.setRegion(region, animated: true)
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                annotation.title = "My place in São Paulo"
                self.mapViewOne.addAnnotation(annotation)
                
                self.legendLabel.alpha = 1
            }, completion: { (Bool) -> Void in

                self.step++
                self.animating = false
            })
        }
    }
    
    func fourthStep() {
        self.touchTimer.invalidate()
        self.touchLabel.alpha = 0
        self.animating = true
        self.view.addSubview(self.imageViewOne)
        self.imageViewOne.transform = CGAffineTransformMakeTranslation(view.bounds.width, 0)
        self.view.bringSubviewToFront(self.bottomView)
        self.view.bringSubviewToFront(self.legendLabel)
        self.view.bringSubviewToFront(self.backButton)
        self.view.bringSubviewToFront(self.touchLabel)
        
        self.imageViewOne.image = UIImage(named: "alephpc1")
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.mapViewOne.transform = CGAffineTransformMakeTranslation(-self.view.bounds.width, 0)
            self.imageViewOne.transform = CGAffineTransformMakeTranslation(0, 0)
            self.legendLabel.alpha = 0
        }) { (Bool) -> Void in
            self.mapViewOne.removeFromSuperview()
            
            self.legendLabel.text = "I always had contact with computers..."
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.legendLabel.alpha = 1
            }, completion: { (Bool) -> Void in

                self.step++
                self.animating = false
            })
        }
        
    }
    
    func fifthStep() {
        self.touchTimer.invalidate()
        self.touchLabel.alpha = 0
        self.animating = true
        self.view.addSubview(self.imageViewTwo)
        self.view.bringSubviewToFront(self.bottomView)
        self.view.bringSubviewToFront(self.legendLabel)
        self.view.bringSubviewToFront(self.backButton)
        self.view.bringSubviewToFront(self.touchLabel)
        
        self.imageViewTwo.transform = CGAffineTransformMakeTranslation(view.bounds.width, 0)
        self.imageViewTwo.image = UIImage(named: "htmlcode")
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.imageViewOne.transform = CGAffineTransformMakeTranslation(-self.view.bounds.width, 0)
            self.imageViewTwo.transform = CGAffineTransformMakeTranslation(0, 0)
            self.legendLabel.alpha = 0
        }) { (Bool) -> Void in
            self.legendLabel.text = "in 2013 I started studying web technologies"
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.legendLabel.alpha = 1
            }, completion: { (Bool) -> Void in
                self.imageViewOne.transform = CGAffineTransformMakeTranslation(self.view.bounds.width, 0)
                self.animating = false

                self.step++
            })
        }
    }
    
    func sixthStep() {
        self.touchTimer.invalidate()
        self.touchLabel.alpha = 0
        self.animating = true
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.legendLabel.alpha = 0
            self.imageViewOne.image = UIImage(named: "alephmack")
            self.imageViewOne.transform = CGAffineTransformMakeTranslation(0, 0)
            self.imageViewTwo.transform = CGAffineTransformMakeTranslation(-self.view.bounds.width, 0)
        }) { (Bool) -> Void in
            self.legendLabel.text = "in 2014 I enrolled on eletronic engineering\nat Mackenzie Presbyterian University"
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.legendLabel.alpha = 1
            }, completion: { (Bool) -> Void in
                self.imageViewTwo.transform = CGAffineTransformMakeTranslation(self.view.bounds.width, 0)
                self.animating = false

                self.step++
            })
        }
    }
    
    func seventhStep() {
        self.touchTimer.invalidate()
        self.touchLabel.alpha = 0
        self.animating = true
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.legendLabel.alpha = 0
            self.imageViewTwo.image = UIImage(named: "alephbepid")
            self.imageViewTwo.transform = CGAffineTransformMakeTranslation(0, 0)
            self.imageViewOne.transform = CGAffineTransformMakeTranslation(-self.view.bounds.width, 0)
            }) { (Bool) -> Void in
                self.legendLabel.text = "in 2015 I was selected for the Brazilian Education Project for iOS Development"
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.legendLabel.alpha = 1
                    }, completion: { (Bool) -> Void in
                        self.imageViewOne.transform = CGAffineTransformMakeTranslation(self.view.bounds.width, 0)
                        self.animating = false

                        self.step++
                })
        }
    }
    
    func eighthStep() {
        self.touchTimer.invalidate()
        self.touchLabel.alpha = 0
        self.animating = true
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.legendLabel.alpha = 0
            self.imageViewOne.image = UIImage(named: "swiftcode")
            self.imageViewOne.transform = CGAffineTransformMakeTranslation(0, 0)
            self.imageViewTwo.transform = CGAffineTransformMakeTranslation(-self.view.bounds.width, 0)
            }) { (Bool) -> Void in
                self.legendLabel.text = "I have been dedicating most of my time to master iOS development..."
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.legendLabel.alpha = 1
                    }, completion: { (Bool) -> Void in
                        self.imageViewTwo.transform = CGAffineTransformMakeTranslation(self.view.bounds.width, 0)

                        self.animating = false
                        self.step++
                })
        }
    }
    
    func ninethStep() {
        self.touchTimer.invalidate()
        self.touchLabel.alpha = 0
        self.animating = true
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.legendLabel.alpha = 0
            self.imageViewTwo.image = UIImage(named: "projects")
            self.imageViewTwo.transform = CGAffineTransformMakeTranslation(0, 0)
            self.imageViewOne.transform = CGAffineTransformMakeTranslation(-self.view.bounds.width, 0)
            }) { (Bool) -> Void in
                self.legendLabel.text = "...amongst other very important topics."
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.legendLabel.alpha = 1
                    }, completion: { (Bool) -> Void in
                        self.imageViewOne.transform = CGAffineTransformMakeTranslation(self.view.bounds.width, 0)

                        self.animating = false
                        self.step++
                        
                })
        }
    }
    
    func finalStep() {
        self.touchTimer.invalidate()
        self.touchLabel.alpha = 0
        self.animating = true
        self.imageViewOne.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(0, 0), CGAffineTransformMakeTranslation(0, 0))
        self.imageViewOne.image = UIImage(named: "thanx")
        self.view.bringSubviewToFront(self.imageViewOne)
        self.view.bringSubviewToFront(self.middleLabel)
        self.view.bringSubviewToFront(self.touchLabel)
        
        self.middleLabel.textColor = UIColor.whiteColor()
        self.middleLabel.text = "Thanks for watching!"
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.legendLabel.alpha = 0
            self.bottomView.alpha = 0
            self.middleLabel.alpha = 1
            self.imageViewOne.transform = CGAffineTransformMakeScale(1, 1)
//            self.imageViewTwo.transform = CGAffineTransformMakeTranslation(-self.view.bounds.width, 0)
            }) { (Bool) -> Void in
                self.legendLabel.removeFromSuperview()
                self.bottomView.removeFromSuperview()
                self.imageViewTwo.removeFromSuperview()

                self.animating = false
                self.step++
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if !animating {
            switch self.step {
//            case 1:
//                firstStep()
            case 2:
                secondStep()
            case 3:
                thirdStep()
            case 4:
                fourthStep()
            case 5:
                fifthStep()
            case 6:
                sixthStep()
            case 7:
                seventhStep()
            case 8:
                eighthStep()
            case 9:
                ninethStep()
            case 10:
                finalStep()
            case 11:
                self.dismissViewControllerAnimated(true, completion: nil)
            default:
                break
            }
        }
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
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}
