//
//  CustomCircleButton.swift
//  Lousa do Prof
//
//  Created by Aleph Retamal on 4/14/15.
//  Copyright (c) 2015 Aleph Retamal. All rights reserved.
//

import UIKit

@IBDesignable
class CircleMenuButton: UIButton {
   
    private var starShape: CAShapeLayer!
    private var outerRingShape: CAShapeLayer!
    private var fillRingShape: CAShapeLayer!
    
    private let starKey = "FAVANIMKEY"
    private let favoriteKey = "FAVORITE"
    private let notFavoriteKey = "NOTFAVORITE"
    
    @IBInspectable var lineWidth: CGFloat = 1 {
        didSet {
            updateLayerProperties()
        }
    }
    
    @IBInspectable var strokeColor: UIColor = UIColor.blackColor() {
        didSet {
            updateLayerProperties()
        }
    }
    
    @IBInspectable var fillColor: UIColor = UIColor.clearColor() {
        didSet {
            updateLayerProperties()
        }
    }
    
    private func updateLayerProperties() {
        
        if outerRingShape != nil {
            outerRingShape.lineWidth = lineWidth
            outerRingShape.strokeColor = strokeColor.CGColor
        }
        
        if fillRingShape != nil {
            fillRingShape.fillColor = fillColor.CGColor
        }
        
        if starShape != nil {
            starShape.fillColor = strokeColor.CGColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createLayersIfNeeded()
        updateLayerProperties()
    }
    
    private func createLayersIfNeeded() {
        if outerRingShape == nil {
            outerRingShape = CAShapeLayer()
            outerRingShape.path = Paths.circle(frameWithInset())
            outerRingShape.bounds = frameWithInset()
            outerRingShape.lineWidth = lineWidth
            outerRingShape.strokeColor = strokeColor.CGColor
            outerRingShape.fillColor = UIColor.clearColor().CGColor
            outerRingShape.position = CGPoint(x: CGRectGetWidth(self.bounds)/2, y: CGRectGetHeight(self.bounds)/2)
            outerRingShape.transform = CATransform3DIdentity
            outerRingShape.opacity = 0.5
            self.layer.addSublayer(outerRingShape)
        }
        
        if fillRingShape == nil {
            fillRingShape = CAShapeLayer()
            fillRingShape.path = Paths.circle(frameWithInset())
            fillRingShape.bounds = frameWithInset()
            fillRingShape.fillColor = fillColor.CGColor
            fillRingShape.position = outerRingShape.position
            fillRingShape.transform = CATransform3DMakeScale(0, 0, 0)
            self.layer.addSublayer(fillRingShape)
        }
        
        if starShape == nil {
            var starFrame = self.bounds
            starFrame.size.width = CGRectGetWidth(starFrame)/2.5
            starFrame.size.height = CGRectGetHeight(starFrame)/2.5
            
            starShape = CAShapeLayer()
            starShape.path = CGPath.rescaleForFrame(path: Paths.star, frame: starFrame)
            starShape.bounds = CGPathGetBoundingBox(starShape.path)
            starShape.fillColor = strokeColor.CGColor
            starShape.position = CGPoint(x: CGRectGetWidth(CGPathGetBoundingBox(outerRingShape.path))/2, y: CGRectGetHeight(CGPathGetBoundingBox(outerRingShape.path))/2)
            starShape.transform = CATransform3DIdentity
            starShape.opacity = 0.5
            self.layer.addSublayer(starShape)
        }
    }
    
    func touchDownAnimation() {
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.3)
        outerRingShape.transform = CATransform3DMakeScale(1.5, 1.5, 0)
        fillRingShape.transform = CATransform3DMakeScale(1.5, 1.5, 0)
        starShape.transform = CATransform3DMakeScale(1.5, 1.5, 0)
        CATransaction.commit()
    }
    
    func touchUpAnimation() {
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.3)
        fillRingShape.transform = CATransform3DMakeScale(0, 0, 0)
        outerRingShape.transform = CATransform3DMakeScale(1, 1, 0)
        starShape.transform = CATransform3DMakeScale(1, 1, 0)
        CATransaction.commit()
    }
    
    func rotateLeftAnimation () {
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.3)
        starShape.transform = CATransform3DMakeRotation(CGFloat(M_PI), 0, 0, 1)
        CATransaction.commit()
    }
    
    func rotateRightAnimation () {
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.3)
        starShape.transform = CATransform3DMakeRotation(0, 0, 0, 1)
        CATransaction.commit()
    }
    
    private func frameWithInset() -> CGRect {
        return CGRectInset(self.bounds, lineWidth/2, lineWidth/2)
    }

}
