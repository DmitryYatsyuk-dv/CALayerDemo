//
//  ViewController.swift
//  CALayerDemo
//
//  Created by Lucky on 15/03/2020.
//  Copyright © 2020 DmitriyYatsyuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {

    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineWidth = 20
            shapeLayer.lineCap = CAShapeLayerLineCap(rawValue: "round")
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
            let color = #colorLiteral(red: 0.4256846734, green: 0.5517628617, blue: 0.570057914, alpha: 1)
            shapeLayer.strokeColor = color.cgColor
        }
    }
    
    var overShapeLayer: CAShapeLayer! {
        didSet {
            overShapeLayer.lineWidth = 20
            overShapeLayer.lineCap = CAShapeLayerLineCap(rawValue: "round")
            overShapeLayer.fillColor = nil
            overShapeLayer.strokeEnd = 0
            let color = #colorLiteral(red: 0.7230684161, green: 0.8037459254, blue: 0.833204329, alpha: 1)
            overShapeLayer.strokeColor = color.cgColor
        }
    }
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 30
            imageView.layer.masksToBounds = true
            imageView.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1).cgColor
            imageView.layer.borderWidth = 5
        }
    }
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.layer.shadowOffset = CGSize(width: 0, height: 0)
            button.layer.shadowOpacity = 0.6
            button.layer.shadowRadius = 5
            button.layer.shadowColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1).cgColor
        }
    }

    override func viewWillLayoutSubviews() {
        
        configShapeLayer(shapeLayer)
        configShapeLayer(overShapeLayer)
    }
    
    func configShapeLayer(_ shapeLayer: CAShapeLayer) {
        
        shapeLayer.frame = view.bounds
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: self.view.frame.width / 2 - 100,
                              y: self.view.frame.height / 1.52))
        
        path.addLine(to: CGPoint(x: self.view.frame.width / 2 + 100,
                                 y: self.view.frame.height / 1.52))
        shapeLayer.path = path.cgPath
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        
        overShapeLayer = CAShapeLayer()
        view.layer.addSublayer(overShapeLayer)
    }
    
    @IBAction func questionTapped(_ sender: UIButton) {
        
//        overShapeLayer.strokeEnd += 0.2
//        if overShapeLayer.strokeEnd == 1 {
//            performSegue(withIdentifier: "showSecondScreen", sender: self)
//        }
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.fillMode = CAMediaTimingFillMode.both
        animation.isRemovedOnCompletion = false
        animation.delegate = self
        
        overShapeLayer.add(animation, forKey: nil)
    }
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        performSegue(withIdentifier: "showSecondScreen", sender: self)
    }
}

