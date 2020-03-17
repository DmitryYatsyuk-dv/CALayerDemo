//
//  Button.swift
//  MaskDemo
//
//  Created by Lucky on 17/03/2020.
//  Copyright © 2020 DmitriyYatsyuk. All rights reserved.
//

import UIKit

@IBDesignable

class Button: UIButton {
    
    private var cornerRadii = CGSize()
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            cornerRadii = CGSize(width: cornerRadius, height: cornerRadius)
        }
    }
    
    @IBInspectable var color: UIColor = .green
    
    var path = UIBezierPath()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topRight, .topLeft], cornerRadii: cornerRadii)
        
        color.setFill()
        path.fill()
    }
    
//    Working area button on fill border
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        path.contains(point)
        
        }
    }
