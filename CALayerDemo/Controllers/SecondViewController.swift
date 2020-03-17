//
//  ThirdViewController.swift
//  CALayerDemo
//
//  Created by Lucky on 16/03/2020.
//  Copyright © 2020 DmitriyYatsyuk. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, CAAnimationDelegate {
    
    var shapeLayer: CAShapeLayer!
    var overShapeLayer: CAShapeLayer!
    var borderLayer = CAShapeLayer()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            
            let startColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1).cgColor
            let endColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1).cgColor
            
            gradientLayer.colors = [startColor, endColor] 
//            gradientLayer.colors = [UIColor.red.cgColor, ... Other colors]
            // Screen fill ratio
//            gradientLayer.locations = [0, 0.20, 1]
        }
    }

    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0,
                                     width: self.view.bounds.size.width,
                                     height: 20 + 271 + imageView.frame.size.height / 2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstImageShapeLayer()
        overImageShapeLayer()
        
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBAction func Tapped(_ sender: UIButton) {
    
           let animation = CABasicAnimation(keyPath: "strokeEnd")
               animation.toValue = 1
               animation.duration = 4
               animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
               animation.fillMode = CAMediaTimingFillMode.both
               animation.isRemovedOnCompletion = false
               animation.delegate = self
               
               borderLayer.add(animation, forKey: nil)
           }
       
    func firstImageShapeLayer() {
        // Add rounded corners
        shapeLayer = CAShapeLayer()
        
        shapeLayer.frame = imageView.bounds
        shapeLayer.path = UIBezierPath(roundedRect: imageView.bounds,
                                       byRoundingCorners: .allCorners,
                                       cornerRadii: CGSize(width: self.imageView.frame.width,
                                                           height: self.imageView.frame.height)).cgPath

        imageView.layer.mask = shapeLayer
        
        // Add border
        borderLayer.path = shapeLayer.path
        borderLayer.frame = imageView.bounds
        borderLayer.lineWidth = 25
        borderLayer.lineCap = CAShapeLayerLineCap(rawValue: "round")
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeEnd = 1
        let color = #colorLiteral(red: 0.7230684161, green: 0.8037459254, blue: 0.833204329, alpha: 1)
        borderLayer.strokeColor = color.cgColor
        imageView.layer.addSublayer(borderLayer)
    }

    func overImageShapeLayer() {
        
        // Add rounded corners
        overShapeLayer = CAShapeLayer()
        
        overShapeLayer.frame = imageView.bounds
        overShapeLayer.path = UIBezierPath(roundedRect: imageView.bounds,
                                           byRoundingCorners: .allCorners,
                                           cornerRadii: CGSize(width: self.imageView.frame.width, height: self.imageView.frame.height)).cgPath
        
        imageView.layer.mask = overShapeLayer
        
        // Add border
        borderLayer = CAShapeLayer()
        borderLayer.path = overShapeLayer.path
        borderLayer.frame = imageView.bounds
        borderLayer.lineWidth = 25
        borderLayer.lineCap = CAShapeLayerLineCap(rawValue: "round")
        borderLayer.fillColor = nil
        borderLayer.strokeEnd = 0
        let color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        borderLayer.strokeColor = color.cgColor
        imageView.layer.addSublayer(borderLayer)
    }
}
