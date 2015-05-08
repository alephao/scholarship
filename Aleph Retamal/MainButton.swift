//
//  MainButton.swift
//  Aleph Retamal
//
//  Created by Aleph Retamal on 4/24/15.
//  Copyright (c) 2015 Aleph Retamal. All rights reserved.
//

import UIKit

class MainButton: UIButton {

    var leftLabel: UILabel!
    
    override func drawRect(rect: CGRect) {
        var bg = CAShapeLayer()
        bg.bounds = self.bounds
        bg.borderWidth = 1
        bg.borderColor = UIColor(hex: "e0e0e0").CGColor
        bg.position = CGPoint(x: bg.bounds.width / 2, y: bg.bounds.height / 2)
        bg.zPosition = -1
        self.layer.addSublayer(bg)
        
        self.leftLabel.bounds = CGRect(x: 0, y: 0, width: bounds.height, height: bounds.height)
        self.leftLabel.center = CGPoint(x: bounds.height / 2, y: bounds.height / 2)
        self.leftLabel.font = UIFont(name: "FontAwesome", size: bounds.height * 2 / 5)
        self.bringSubviewToFront(leftLabel)

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = frame
        
        leftLabel = UILabel(frame: CGRectZero)
        leftLabel.backgroundColor = UIColor.clearColor()
        leftLabel.textAlignment = .Center
        leftLabel.textColor = UIColor(hex: "8C687C")
        self.addSubview(leftLabel)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
