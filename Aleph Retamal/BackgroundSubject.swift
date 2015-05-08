//
//  BackgroundSubject.swift
//  Aleph Retamal
//
//  Created by Aleph Retamal on 4/23/15.
//  Copyright (c) 2015 Aleph Retamal. All rights reserved.
//

import UIKit

class BackgroundSubject: NSObject {
    var title: String
    var color: UIColor
    var titleText: String
    var lu: String
    var ru: String
    var ld: String
    var rd: String
    var lut: String
    var rut: String
    var ldt: String
    var rdt: String
    var lust: String
    var rust: String
    var ldst: String
    var rdst: String
    
    init(title:String, color:UIColor, titleText:String, lu:String, ru:String, ld:String, rd:String, lut:String, rut:String, ldt:String, rdt:String, lust:String, rust:String, ldst:String, rdst:String) {
        self.title = title
        self.color = color
        self.titleText = titleText
        self.lu = lu
        self.ru = ru
        self.ld = ld
        self.rd = rd
        self.lut = lut
        self.rut = rut
        self.ldt = ldt
        self.rdt = rdt
        self.lust = lust
        self.rust = rust
        self.ldst = ldst
        self.rdst = rdst
    }
}
