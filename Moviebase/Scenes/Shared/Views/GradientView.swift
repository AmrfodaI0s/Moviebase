//
//  GriedientView.swift
//  Moviebase
//
//  Created by Eslam on 5/12/20.
//  Copyright © 2020 Eslam. All rights reserved.
//
import UIKit

@IBDesignable class GradientView: UIView {
    
    @IBInspectable var topColor: UIColor = UIColor.white {
        didSet {
            self.setNeedsLayout()
        }
    }
    @IBInspectable var bottomColor: UIColor = UIColor.white {
        didSet {
            self.setNeedsLayout()
        }
    }
    override func layoutSubviews() {
        let gradient = CAGradientLayer()
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.frame = bounds
        layer.insertSublayer(gradient, at: 0)
        
    }

 
}
