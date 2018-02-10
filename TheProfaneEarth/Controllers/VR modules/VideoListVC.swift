//
//  InspirationsViewController.swift
//  TheProfaneEarth
//
//  Created by Amine Badraoui on 2018-02-06.
//  Copyright © 2018 aminebadraoui. All rights reserved.
//


import UIKit
import AVKit


private let reuseIdentifier = "Cell"

class InspirationsViewController: UICollectionViewController {
    @IBOutlet weak var msgFr: UILabel!
    var selectedVideoTitle : String = ""
    var selectedIndexPath: IndexPath!
   let inspirations = Inspiration.allInspirations()
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        selectedVideoTitle = ""
        if let patternImage = UIImage(named: "Pattern") {
            view.backgroundColor = UIColor(patternImage: patternImage)
        }
        collectionView!.backgroundColor = UIColor.clear
        collectionView!.decelerationRate = UIScrollViewDecelerationRateFast
        
        if(Language.lang == Lang.English){
            msgFr.isHidden = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        
    }


}

extension InspirationsViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inspirations.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InspirationCell", for: indexPath) as! InspirationCell
        cell.inspiration = inspirations[indexPath.item]
        return cell
    }
    
 
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.selectedIndexPath = indexPath
        let layout = collectionViewLayout as! UltravisualLayout
        let offset = layout.dragOffset * CGFloat(indexPath.item)
        if collectionView.contentOffset.y != offset {
            collectionView.setContentOffset(CGPoint(x: 0, y: offset), animated: true)
            
        }
        let selectedVideo = inspirations[indexPath.item]
   
       self.performSegue(withIdentifier: "PlayVCSecond", sender: selectedVideo)
    }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlayVCSecond" {
            let destination = segue.destination as! PlayVCSecond
            let inspiration = sender as! Inspiration
        destination.selectedVideo = inspiration
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.all)
    }
}



