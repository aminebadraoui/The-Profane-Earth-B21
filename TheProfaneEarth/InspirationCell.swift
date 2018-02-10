//
//  InspirationCell.swift
//  TheProfaneEarth
//
//  Created by Amine Badraoui on 2018-02-06.
//  Copyright © 2018 aminebadraoui. All rights reserved.
//


import UIKit
import Hero

class InspirationCell: UICollectionViewCell {
    
    @IBOutlet fileprivate weak var imageView: UIImageView!
    @IBOutlet fileprivate weak var imageCoverView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!

    
  
    var inspiration:Inspiration?{
        didSet{
            
        
            if let inspiration = inspiration{
              
                imageView.image = inspiration.backgroundImage
    
                titleLabel.text = inspiration.title
                
               
                
                
            }
        }
    }
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.sizeThatFits((titleLabel.superview?.frame.size)!)
        titleLabel.numberOfLines = 0
        
        // 1
        let standardHeight = UltravisualLayoutConstants.Cell.standardHeight
        let featuredHeight = UltravisualLayoutConstants.Cell.featuredHeight
        
        // 2
        let delta = 1 - ((featuredHeight - frame.height) / (featuredHeight - standardHeight))
        
        // 3
        let minAlpha: CGFloat = 0.3
        let maxAlpha: CGFloat = 0.75
        imageCoverView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
        
      
    }
}


