//
//  Utilities.swift
//  Sismo
//  @rockarloz
//  Created by Carlos Castellanos on 21/09/17.
//  Copyright © 2017 huerdo. All rights reserved.
//


import UIKit


struct Colors {
    static let gray = UIColor(red: 123.0/255.0, green: 123.0/255.0, blue: 123.0/255.0, alpha: 1.0)
    static let red = UIColor.red // or somthing
    static let green = UIColor.green // or somthing
}

class UIElements {
    class func createFrame(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) -> CGRect
    {
        return CGRect(x: x , y: y , width: w , height: h)
    }
}
