//
//  ViewController.swift
//  Gradient Animation
//
//  Created by Lucky on 15/03/2020.
//  Copyright © 2020 DmitriyYatsyuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let gradient = CAGradientLayer()
    let firstText = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 350))
    let secondText = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 350))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingColorProperties()
        animationOfView()
    }
    
    func settingColorProperties() {
    
        // Filling in View
        
        self.gradient.frame = self.view.bounds
        self.gradient.colors = [UIColor.magenta.cgColor,
                                UIColor.yellow.cgColor,
                                UIColor(red: (240/255.0),
                                        green: (230/255.0),
                                        blue: (100/255.0),
                                    alpha: 1).cgColor]
        
        self.gradient.startPoint = CGPoint(x: 0, y: 0)
        self.gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.gradient.locations = [0, 0]
        
        self.view.layer.addSublayer(self.gradient)
        

        
        self.firstText.text = "Programming Design Systems"
        self.secondText.text = "A short history of color theory"
        self.firstText.font = UIFont.boldSystemFont(ofSize: 28)
        self.secondText.font = UIFont.boldSystemFont(ofSize: 28)
        self.firstText.numberOfLines = 0
        self.secondText.numberOfLines = 0
        
        self.firstText.textColor = .white
        self.secondText.textColor = .white
        
        self.firstText.textAlignment = .center
        self.secondText.textAlignment = .center
        
        self.firstText.center.x = self.view.center.x
        self.firstText.center.y = self.view.center.y - 100
        
        self.secondText.center = self.view.center
        
        self.firstText.alpha = 0
        self.secondText.alpha = 0
        
        
        self.view.addSubview(self.firstText)
        self.view.addSubview(self.secondText)
        
        UIView.animate(withDuration: 2.5, animations: {
            
            self.firstText.alpha = 1.0
        }) { (_) in
            UIView.animate(withDuration: 2.0) {
                self.secondText.alpha = 1.0
            }
        }
    }
    
    // Animation
    
    func animationOfView() {
        
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.fromValue = [-0.5, -0.25, 0]
        gradientAnimation.toValue = [1.0, 1.25, 1.5]
        gradientAnimation.duration = 5.0
        gradientAnimation.autoreverses = true
        gradientAnimation.repeatCount = Float.infinity
        self.gradient.add(gradientAnimation, forKey: nil)
    }
}
