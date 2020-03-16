//
//  ThirdViewController.swift
//  CALayerDemo
//
//  Created by Lucky on 16/03/2020.
//  Copyright © 2020 DmitriyYatsyuk. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.layer.cornerRadius = 5
            textField.textColor = .white
        }
    }
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 30
            imageView.layer.masksToBounds = true
            imageView.layer.borderColor = #colorLiteral(red: 0.7230684161, green: 0.8037459254, blue: 0.833204329, alpha: 1)
            imageView.layer.borderWidth = 8
            
            
        }
    }
    
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

        
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
        
    }
}
