//
//  SkillBar.swift
//  Aleph Retamal
//
//  Created by Aleph Retamal on 4/16/15.
//  Copyright (c) 2015 Aleph Retamal. All rights reserved.
//

import UIKit

@IBDesignable
class SkillBar: UIView {
    
    var borderLayer: CAShapeLayer!
    var fillLayer: CAShapeLayer!
    
    let maxFillLevel:CGFloat = 1.0
    let minFillLevel:CGFloat = 0.0
    
    @IBInspectable var lineWidth:CGFloat = 1.0 {
        didSet {
            updateLayerProperties()
        }
    }
    
    @IBInspectable var strokeColor:UIColor = UIColor.blackColor() {
        didSet {
            updateLayerProperties()
        }
    }
    
    @IBInspectable var fillLevel:CGFloat = 0.5 {
        didSet {
            if (fillLevel < 0) {
                fillLevel = 0
            } else if (fillLevel > 1) {
                fillLevel = 1
            }
            updateLayerProperties()
        }
    }
    
    @IBInspectable var fillColor:UIColor = UIColor.redColor() {
        didSet {
            updateLayerProperties()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createLayersIfNeeded()
        updateLayerProperties()
    }
    
    private func createLayersIfNeeded() {
        
        if fillLayer == nil {
            fillLayer = CAShapeLayer()
            fillLayer.frame = CGRect(x: 0, y: 0, width: CGRectGetWidth(self.bounds)*fillLevel, height: CGRectGetHeight(self.bounds))
            fillLayer.backgroundColor = fillColor.CGColor
            self.layer.addSublayer(fillLayer)
        }
        
        if borderLayer == nil {
            borderLayer = CAShapeLayer()
            borderLayer.bounds = bounds
            borderLayer.position = CGPoint(x: CGRectGetWidth(self.bounds) / 2, y: CGRectGetHeight(self.bounds)/2)
            borderLayer.path = UIBezierPath(rect: self.bounds).CGPath
            borderLayer.strokeColor = strokeColor.CGColor
            borderLayer.fillColor = UIColor.clearColor().CGColor
            self.layer.addSublayer(borderLayer)
        }
        
    }
    
    private func updateLayerProperties() {
        if borderLayer != nil {
            borderLayer.lineWidth = lineWidth
            borderLayer.strokeColor = strokeColor.CGColor
        }
        
        if fillLayer != nil {
            fillLayer.frame = CGRect(x: 0, y: 0 / 2, width: CGRectGetWidth(self.bounds)*fillLevel, height: CGRectGetHeight(self.bounds))
            fillLayer.backgroundColor = fillColor.CGColor
        }
    }
    
    func animateBar() {
        if fillLayer != nil {
            fillLayer.transform = CATransform3DMakeScale(0, 1, 1)
            CATransaction.begin()
            CATransaction.setAnimationDuration(10.0)
            fillLayer.transform = CATransform3DMakeScale(1, 1, 1)
            CATransaction.commit()
        }
    }
    
    private func frameWithInset() -> CGRect {
        return CGRectInset(self.bounds, lineWidth/2, lineWidth/2)
    }
    
}
