//
//  PlayVC.swift
//  ExpandingCollectionView
//
//  Created by Amine Badraoui on 2017-10-30.
//  Copyright © 2017 VamshiKrishna. All rights reserved.
//

import UIKit


class PlayVCSecond: UIViewController {

    var selectedVideo : Inspiration!

    @IBOutlet weak var imageBg: UIImageView!
    @IBAction func backButn(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    @IBOutlet weak var videoTitle: UILabel!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
videoTitle.text = selectedVideo.title
        imageBg.image = selectedVideo.backgroundImage
        imageBg.addBlurEffect()
        
   
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let destination = segue.destination as! ChoiceVC
        destination.selectedVideo = selectedVideo
       
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
class Colors {
    let colorTop = UIColor(red: 192.0/255.0, green: 38.0/255.0, blue: 42.0/255.0, alpha: 1.0)
    let colorBottom = UIColor(red: 35.0/255.0, green: 2.0/255.0, blue: 2.0/255.0, alpha: 1.0)
    
    let gl: CAGradientLayer
    
    init() {
        gl = CAGradientLayer()
        gl.colors = [ colorTop, colorBottom]
        gl.locations = [ 0.0, 1.0]
    }
 
}
