//
//  RoundBorders.swift
//  ExpandingCollectionView
//
//  Created by Amine Badraoui on 2017-10-30.
//  Copyright © 2017 VamshiKrishna. All rights reserved.
//

import UIKit
@IBDesignable
class RoundBorders: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: CGColor{
        get {
            return layer.borderColor!
        }
        set {
            layer.borderColor = newValue
        }
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
